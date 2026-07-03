*** Settings ***
Documentation    Convert file downstream
Resource         ../Resources/convert_file_resource.robot
Resource         ../Keywords/convert_file_keywords.robot
Resource         ../Keywords/get_file_downstream.robot
Resource         ../Keywords/query_data_fromDB.robot

 
*** Test Cases ***
Convert File Downstream GMT
    [Documentation]    Convert File Downstream GMT
    [Tags]    GMT
    # GMTGPS Download Files From Server
    # GMTGMT Download Files From Server
    # Rename Files xlsx In Folder
    # GMT Convert File With Pipe
    # GMT Convert Files Fix Length
    GMT Remove Source File And Convert File
    GMT Upload Source File And Upload Convert File
    GMTGPS Upload All Files From EDW_DMS
    GMTGPS Export Data From DB
    FXPUB Convert Files

Convert File Downstream GPS
    [Documentation]    Convert File Downstream GPS
    [Tags]    GPS
    GPS Download Files From Server
    GPS Rename Files xlsx In Folder
    GPS Convert File With Pipe
    GPS Convert Files Fix Length
    GPS Remove Source File And Convert File
    GPS Upload Source File And Upload Convert File
    GPS Upload All Files From EDW_DMS
    GPS Export Data From DB