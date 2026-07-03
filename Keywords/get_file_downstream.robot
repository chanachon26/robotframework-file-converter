*** Settings ***
Library    OperatingSystem
Library    Collections
Library    ../Libs/YamlLoader.py
Library    ../Libs/SFTPWithTunnel.py
Resource    ../Resources/get_file_resource.robot
Resource    convert_file_keywords.robot

*** Keywords ***
GMTGPS Download Files From Server
    Create Directory    ${GMTGPS_DIRECTORY}
    ${file_paths}=    Load File Paths    ${GMTGPS_CONFIG_FILE}
    FOR    ${file_data}    IN    @{file_paths}
        ${remote_path}=    Replace Variables    ${file_data['remote']}
        ${local_path}=     Replace Variables    ${file_data['local']}

        ${directory_parts}=    Split Path    ${local_path}
        ${CreatePath}=    Get From List    ${directory_parts}    0
        Create Directory    ${CreatePath}

        Download File Via Tunnel    
        ...    ${GMTGPS_JUMP_HOST}    ${GMTGPS_JUMP_USER}    ${GMTGPS_JUMP_PASS}
        ...    ${GMTGPS_TARGET_HOST}    ${GMTGPS_TARGET_USER}    ${GMTGPS_TARGET_PASS}
        ...    ${remote_path}    ${local_path}
        
        # Download File Direct    
        # ...    ${GMTGPS_TARGET_HOST}    ${GMTGPS_TARGET_USER}    ${GMTGPS_TARGET_PASS}
        # ...    ${remote_path}    ${local_path}
    END

GMTGMT Download Files From Server
    Create Directory    ${GMTGMT_DIRECTORY}
    ${file_paths}=    Load File Paths    ${GMTGMT_CONFIG_FILE}
    FOR    ${file_data}    IN    @{file_paths}
        ${remote_path}=    Replace Variables    ${file_data['remote']}
        ${local_path}=     Replace Variables    ${file_data['local']}

        ${directory_parts}=    Split Path    ${local_path}
        ${CreatePath}=    Get From List    ${directory_parts}    0
        Create Directory    ${CreatePath}

        Download File Via Tunnel    
        ...    ${GMTGMT_JUMP_HOST}    ${GMTGMT_JUMP_USER}    ${GMTGMT_JUMP_PASS}
        ...    ${GMTGMT_TARGET_HOST}    ${GMTGMT_TARGET_USER}    ${GMTGMT_TARGET_PASS}
        ...    ${remote_path}    ${local_path}
        
        # Download File Direct    
        # ...    ${GMTGMT_TARGET_HOST}    ${GMTGMT_TARGET_USER}    ${GMTGMT_TARGET_PASS}
        # ...    ${remote_path}    ${local_path}
    END

GPS Download Files From Server
    Create Directory    ${GPS_DIRECTORY}
    ${file_paths}=    Load File Paths    ${GPS_CONFIG_FILE}
    FOR    ${file_data}    IN    @{file_paths}
        ${remote_path}=    Replace Variables    ${file_data['remote']}
        ${local_path}=     Replace Variables    ${file_data['local']}

        ${directory_parts}=    Split Path    ${local_path}
        ${CreatePath}=    Get From List    ${directory_parts}    0
        Create Directory    ${CreatePath}

        Download File Direct    
        ...    ${GPS_TARGET_HOST}    ${GPS_TARGET_USER}    ${GPS_TARGET_PASS}
        ...    ${remote_path}    ${local_path}
    END

FXPUB Download Files From Server
    Create Directory    ${FXPUB_DIRECTORY}
    ${file_paths}=    Load File Paths    ${FXPUB_CONFIG_FILE}
    FOR    ${file_data}    IN    @{file_paths}
        ${remote_path}=    Replace Variables    ${file_data['remote']}
        ${local_path}=     Replace Variables    ${file_data['local']}

        ${directory_parts}=    Split Path    ${local_path}
        ${CreatePath}=    Get From List    ${directory_parts}    0
        Create Directory    ${CreatePath}

        Download File Direct    
        ...    ${FXPUB_TARGET_HOST}    ${FXPUB_TARGET_USER}    ${FXPUB_TARGET_PASS}
        ...    ${remote_path}    ${local_path}
    END