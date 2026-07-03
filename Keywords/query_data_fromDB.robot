*** Settings ***
Library    BuiltIn
Library    OperatingSystem
Library    ../Libs/GetDataFromDB.py
Library    ../Libs/YamlLoader.py
Resource    ../Resources/query_data_from_db.robot

*** Keywords ***
GPS Export Data From DB
    ${YEAR}=    Set Variable    ${DATE}[0:4]
    ${MONTH}=   Set Variable    ${DATE}[4:6]
    ${DAY}=     Set Variable    ${DATE}[6:8]
    ${DATE1}=   Set Variable    ${YEAR}-${MONTH}-${DAY}
    Log    ${DATE1}

    ${L_QUERY}=    Load File Paths    ${GPS_QUERY}

    FOR    ${file_data}    IN    @{L_QUERY}
        ${QUERY}=        Replace Variables    ${file_data['query']}
        ${XLSX_FILE}=    Replace Variables    ${file_data['saveto']}
        ${input}=        Replace Variables    ${file_data['saveto']}
        ${upload_file}=  Replace Variables    ${file_data['uploadto']}
        ${del_file}=     Replace Variables    ${file_data['del_file_nm']}

        Export Data To Excel    ${GPS_DB_HOST}    ${GPS_DB_USER}    ${GPS_DB_PASSWORD}    ${GPS_DB_NAME}    ${GPS_DB_PORT}    ${QUERY}    ${XLSX_FILE}
        
        ${src_files}=    List Files In Directory    ${upload_file}    pattern=*${del_file}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_file}/${f}
        END

        Copy File    ${input}    ${upload_file}
    END

GMTGPS Export Data From DB
    ${YEAR}=    Set Variable    ${DATE}[0:4]
    ${MONTH}=   Set Variable    ${DATE}[4:6]
    ${DAY}=     Set Variable    ${DATE}[6:8]
    ${DATE1}=   Set Variable    ${YEAR}-${MONTH}-${DAY}
    Log    ${DATE1}

    ${L_QUERY}=    Load File Paths    ${GMTGPS_QUERY}

    FOR    ${file_data}    IN    @{L_QUERY}
        ${QUERY}=        Replace Variables    ${file_data['query']}
        ${XLSX_FILE}=    Replace Variables    ${file_data['saveto']}
        ${input}=        Replace Variables    ${file_data['saveto']}
        ${upload_file}=  Replace Variables    ${file_data['uploadto']}
        ${del_file}=     Replace Variables    ${file_data['del_file_nm']}

        # Export Data To Excel    ${GMTGPS_DB_HOST}    ${GMTGPS_DB_USER}    ${GMTGPS_DB_PASSWORD}    ${GMTGPS_DB_NAME}    ${GMTGPS_DB_PORT}    ${QUERY}    ${XLSX_FILE}
        Export Data To Excel Via Ssh    
        ...    ${GMTGPS_JUMP_DB_HOST}    ${GMTGPS_JUMP_DB_PORT}    ${GMTGPS_JUMP_DB_USER}    
        ...    ${GMTGPS_JUMP_DB_PASSWORD}    ${GMTGPS_DB_HOST}    ${GMTGPS_DB_USER}    ${GMTGPS_DB_PASSWORD}    
        ...    ${GMTGPS_DB_NAME}    ${GMTGPS_DB_PORT}    ${QUERY}    ${XLSX_FILE}
        
        ${src_files}=    List Files In Directory    ${upload_file}    pattern=*${del_file}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_file}/${f}
        END

        Copy File    ${input}    ${upload_file}
    END

