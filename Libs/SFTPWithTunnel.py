import paramiko
import os
import fnmatch

def download_file_via_tunnel(jump_host, jump_user, jump_pass,
                              target_host, target_user, target_pass,
                              remote_path, local_path):
    # Connect to jump host
    jump_transport = paramiko.Transport((jump_host, 22))
    jump_transport.connect(username=jump_user, password=jump_pass)

    # Open channel from jump to target
    jump_channel = jump_transport.open_channel(
        "direct-tcpip",
        (target_host, 22),
        ("127.0.0.1", 0)
    )

    # Connect to target server via jump channel
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(
        hostname=target_host,
        username=target_user,
        password=target_pass,
        sock=jump_channel
    )

    sftp = client.open_sftp()
    # sftp.get(remote_path, local_path)
    # sftp.close()
    # client.close()
    # jump_transport.close()
        # ====== CASE 1: no wildcard (ของเดิม) ======
    if "*" not in remote_path:
        os.makedirs(os.path.dirname(local_path), exist_ok=True)
        sftp.get(remote_path, local_path)

    # ====== CASE 2: wildcard (516 LIPS) ======
    else:
        remote_dir = os.path.dirname(remote_path)
        pattern = os.path.basename(remote_path)

        local_dir = os.path.dirname(local_path)
        os.makedirs(local_dir, exist_ok=True)

        files = [
            f for f in sftp.listdir(remote_dir)
            if fnmatch.fnmatch(f, pattern)
        ]

        if not files:
            raise FileNotFoundError(f"No file match {remote_path}")

        for f in files:
            sftp.get(
                f"{remote_dir}/{f}",
                os.path.join(local_dir, f)
            )

    sftp.close()

def download_file_direct(target_host, target_user, target_pass, remote_path, local_path):
    """
    ดาวน์โหลดไฟล์จาก target host โดยไม่ใช้ jump host (เชื่อมตรง)
    """
    try:
        client = paramiko.SSHClient()
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        client.connect(
            hostname=target_host,
            username=target_user,
            password=target_pass,
            port=22
        )

        sftp = client.open_sftp()
        sftp.get(remote_path, local_path)
        sftp.close()
        client.close()
    except Exception as e:
        raise RuntimeError(f"Download failed: {str(e)}")