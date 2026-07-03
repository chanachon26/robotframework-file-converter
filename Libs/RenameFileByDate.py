# RenameFileByDate.py
import os
import re
from pathlib import Path

class RenameFileByDate:
    def rename_files_in_folder(self, base_path: str, new_date: str) -> None:
        """
        เปลี่ยนชื่อไฟล์ Excel ภายใต้ base_path ทั้งหมดที่ match pattern *YYYYMMDD*.xlsx ให้เป็นชื่อใหม่โดยใช้ new_date
        """
        pattern = re.compile(r'(\d{8})')

        for root, dirs, files in os.walk(base_path):
            for filename in files:
                if filename.endswith(".xlsx") and pattern.search(filename):
                    old_date = pattern.search(filename).group(1)
                    new_filename = filename.replace(old_date, new_date)

                    old_path = Path(root) / filename
                    new_path = Path(root) / new_filename

                    if old_path != new_path:
                        print(f"Renaming: {old_path} -> {new_path}")
                        os.rename(old_path, new_path)
