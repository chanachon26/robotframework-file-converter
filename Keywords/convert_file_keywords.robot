*** Settings ***
# Library    os
# Library    DateTime
# Library    BuiltIn
Library    OperatingSystem
# Library    String
# Library    re
Library    ../Libs/TextToExcelLibrary.py
Library    ../Libs/RenameFileByDate.py
Library    ../Libs/YamlLoader.py
Resource    ../Resources/convert_file_resource.robot
Resource    ../Keywords/get_file_downstream.robot

*** Keywords ***

## GMT - GPS ##
Rename Files xlsx In Folder
    Rename Files In Folder    ${GMT_OUTPUT_path}    ${DATE}

GMT Convert File With Pipe
    ${file_paths}=    Load File Paths    ${GMT_YAML_FILE_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${INPUT}=      Replace Variables    ${file_data['input_txt']}
        ${OUTPUT}=     Replace Variables    ${file_data['output_xlsx']}
        ${SHEET}=      Set Variable    ${file_data['sheet_name']}
        ${START_ROW}=  Set Variable    ${file_data['start_row']}
        ${COLUMN}=     Set Variable    ${file_data['column']}

        Txt To Excel    ${INPUT}    ${OUTPUT}    ${DELIMITER}    ${SHEET}    ${START_ROW}    ${COLUMN}    ${DATE}
    END

GMT Convert Files Fix Length
    ${file_paths}=    Load File Paths    ${GMT_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${INPUT}=      Replace Variables    ${file_data['input_txt']}
        ${OUTPUT}=     Replace Variables    ${file_data['output_xlsx']}
        ${SHEET}=      Set Variable    ${file_data['sheet_name']}
        ${START_ROW}=  Set Variable    ${file_data['start_row']}
        ${COLUMN}=     Set Variable    ${file_data['column']}

        Txt To Excel Single Column    ${INPUT}    ${OUTPUT}    ${SHEET}    ${START_ROW}    ${COLUMN}    ${DATE}
    END

GMT Remove Source File And Convert File
    ${file_paths}=    Load File Paths    ${GMT_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}         
        ${output}=         Replace Variables    ${file_data['output_xlsx']}       
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}     
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}
        ${del_prefix}=     Set Variable    ${file_data['del_file_nm']}
        
        File Should Exist    ${input}
        File Should Exist    ${output}
        # Directory Should Exist    ${upload_src}
        # Directory Should Exist    ${upload_conv}

        ${src_files}=    List Files In Directory    ${upload_src}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_src}/${f}
        END

        ${conv_files}=    List Files In Directory    ${upload_conv}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{conv_files}
            Remove File    ${upload_conv}/${f}
        END
    END

    ${file_paths}=    Load File Paths    ${GMT_YAML_FILE_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}         
        ${output}=         Replace Variables    ${file_data['output_xlsx']}       
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}     
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}    
        ${del_prefix}=     Set Variable    ${file_data['del_file_nm']}
        File Should Exist    ${input}
        File Should Exist    ${output}
        # Directory Should Exist    ${upload_src}
        # Directory Should Exist    ${upload_conv}

        ${src_files}=    List Files In Directory    ${upload_src}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_src}/${f}
        END

        ${conv_files}=    List Files In Directory    ${upload_conv}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{conv_files}
            Remove File    ${upload_conv}/${f}
        END
    END

GMT Upload Source File And Upload Convert File
    ${file_paths}=    Load File Paths    ${GMT_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}
        File Should Exist    ${input}
        File Should Exist    ${output}
        # Directory Should Exist    ${upload_src}
        # Directory Should Exist    ${upload_conv}

        Copy File    ${input}    ${upload_src}
        Copy File    ${output}   ${upload_conv}
    END

    ${file_paths}=    Load File Paths    ${GMT_YAML_FILE_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}

        File Should Exist    ${input}
        File Should Exist    ${output}
        Directory Should Exist    ${upload_src}
        Directory Should Exist    ${upload_conv}
        
        Copy File    ${input}    ${upload_src}
        Copy File    ${output}   ${upload_conv}
    END

GMTGPS Upload All Files From EDW_DMS
    ${src_folder}=    Set Variable    ${CURDIR}/../Test_Data/GMTGPS/${DATE}/GPS/157_EDW_DMS
    ${dst_folder}=    Set Variable    ${GMT_UPLOAD_Source_File}/GPS/Source File & GPS Transaction/157_EDWDMS

    # Directory Should Exist    ${src_folder}
    # Directory Should Exist    ${dst_folder}
    
    ### File ไม่อยู่ใน config Upload Source file อย่างเดียว ไม่ต้อง Convert ###
    ${files}=    List Files In Directory    ${GMT_UPLOAD_Source_File}/GPS/Source File & GPS Transaction/157_EDWDMS    pattern=EDWGPS*
    FOR    ${file}    IN    @{files}
        Remove File    ${GMT_UPLOAD_Source_File}/GPS/Source File & GPS Transaction/157_EDWDMS${/}${file}
    END

    ${files}=    List Files In Directory    ${src_folder}
    FOR    ${file}    IN    @{files}
        Copy File    ${src_folder}/${file}    ${dst_folder}
    END

    ### File ไม่อยู่ใน config Upload Source file อย่างเดียว ไม่ต้อง Convert ###
    ${files}=    List Files In Directory    ${GMT_UPLOAD_Source_File}/GPS/Source File & GPS Transaction/449_GTSUtility    pattern=REF_GPS_*
    FOR    ${file}    IN    @{files}
        Remove File    ${GMT_UPLOAD_Source_File}/GPS/Source File & GPS Transaction/449_GTSUtility${/}${file}
    END
    Copy File    ${CURDIR}/../Test_Data/GMTGPS/${DATE}/GPS/449_GTSUtility/REF_GPS_${DATE}.csv    ${GMT_UPLOAD_Source_File}/GPS/Source File & GPS Transaction/449_GTSUtility


## GPS ##
GPS Rename Files xlsx In Folder
    Rename Files In Folder    ${GPS_OUTPUT_path}    ${DATE}

GPS Convert File With Pipe
    ${file_paths}=    Load File Paths    ${GPS_YAML_FILE_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${INPUT}=      Replace Variables    ${file_data['input_txt']}
        ${OUTPUT}=     Replace Variables    ${file_data['output_xlsx']}
        ${SHEET}=      Set Variable    ${file_data['sheet_name']}
        ${START_ROW}=  Set Variable    ${file_data['start_row']}
        ${COLUMN}=     Set Variable    ${file_data['column']}

        Txt To Excel    ${INPUT}    ${OUTPUT}    ${DELIMITER}    ${SHEET}    ${START_ROW}    ${COLUMN}    ${DATE}
    END

GPS Convert Files Fix Length
    ${file_paths}=    Load File Paths    ${GPS_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${INPUT}=      Replace Variables    ${file_data['input_txt']}
        ${OUTPUT}=     Replace Variables    ${file_data['output_xlsx']}
        ${SHEET}=      Set Variable    ${file_data['sheet_name']}
        ${START_ROW}=  Set Variable    ${file_data['start_row']}
        ${COLUMN}=     Set Variable    ${file_data['column']}

        Txt To Excel Single Column    ${INPUT}    ${OUTPUT}    ${SHEET}    ${START_ROW}    ${COLUMN}    ${DATE}
    END

GPS Remove Source File And Convert File
    ${file_paths}=    Load File Paths    ${GPS_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}
        ${del_prefix}=     Set Variable    ${file_data['del_file_nm']}

        File Should Exist    ${input}
        File Should Exist    ${output}
        Directory Should Exist    ${upload_src}
        Directory Should Exist    ${upload_conv}

        ${src_files}=    List Files In Directory    ${upload_src}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_src}/${f}
        END

        ${conv_files}=    List Files In Directory    ${upload_conv}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{conv_files}
            Remove File    ${upload_conv}/${f}
        END
    END

    ${file_paths}=    Load File Paths    ${GPS_YAML_FILE_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}
        ${del_prefix}=     Set Variable    ${file_data['del_file_nm']}

        File Should Exist    ${input}
        File Should Exist    ${output}
        Directory Should Exist    ${upload_src}
        Directory Should Exist    ${upload_conv}

        ${src_files}=    List Files In Directory    ${upload_src}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_src}/${f}
        END

        ${conv_files}=    List Files In Directory    ${upload_conv}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{conv_files}
            Remove File    ${upload_conv}/${f}
        END
    END

GPS Upload Source File And Upload Convert File
    ${file_paths}=    Load File Paths    ${GPS_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}

        File Should Exist    ${input}
        File Should Exist    ${output}
        Directory Should Exist    ${upload_src}
        Directory Should Exist    ${upload_conv}

        Copy File    ${input}    ${upload_src}
        Copy File    ${output}   ${upload_conv}
    END

    ${file_paths}=    Load File Paths    ${GPS_YAML_FILE_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}

        File Should Exist    ${input}
        File Should Exist    ${output}
        Directory Should Exist    ${upload_src}
        Directory Should Exist    ${upload_conv}

        Copy File    ${input}    ${upload_src}
        Copy File    ${output}   ${upload_conv}
    END

GPS Upload All Files From EDW_DMS
    ${src_folder}=    Set Variable    ${CURDIR}/../Test_Data/GPS/${DATE}/157 EDW-DMS
    ${dst_folder}=    Set Variable    ${GPS_UPLOAD_Source_File}/Source File/157 EDW-DMS

    Directory Should Exist    ${src_folder}
    Directory Should Exist    ${dst_folder}
    
    ### File ไม่อยู่ใน config Upload Source file อย่างเดียว ไม่ต้อง Convert ###
    ${files}=    List Files In Directory    ${GPS_UPLOAD_Source_File}/Source File/157 EDW-DMS    pattern=EDWGPS*
    FOR    ${file}    IN    @{files}
        Remove File    ${GPS_UPLOAD_Source_File}/Source File/157 EDW-DMS${/}${file}
    END

    ${files}=    List Files In Directory    ${src_folder}
    FOR    ${file}    IN    @{files}
        Copy File    ${src_folder}/${file}    ${dst_folder}
    END

FXPUB Convert Files
    # ### Download File ###
    FXPUB Download Files From Server
    # ### Rename File ###
    Rename Files In Folder    ${FXPUB_OUTPUT_path}    ${DATE}

    # ## Convert File ###
    ${file_paths}=    Load File Paths    ${FXPUB_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${INPUT}=      Replace Variables    ${file_data['input_txt']}
        ${OUTPUT}=     Replace Variables    ${file_data['output_xlsx']}
        ${SHEET}=      Set Variable    ${file_data['sheet_name']}
        ${START_ROW}=  Set Variable    ${file_data['start_row']}
        ${COLUMN}=     Set Variable    ${file_data['column']}
        Txt To Excel Single Column    ${INPUT}    ${OUTPUT}    ${SHEET}    ${START_ROW}    ${COLUMN}    ${DATE}
    END

    ### Remove File & Upload File On Share Drive ###
    FXPUB Remove Source File And Convert File
    
    FXPUB Upload Source File And Upload Convert File

FXPUB Remove Source File And Convert File
    ${file_paths}=    Load File Paths    ${FXPUB_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}         
        ${output}=         Replace Variables    ${file_data['output_xlsx']}       
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}     
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}
        ${del_prefix}=     Set Variable    ${file_data['del_file_nm']}
        
        File Should Exist    ${input}
        File Should Exist    ${output}
        # Directory Should Exist    ${upload_src}
        # Directory Should Exist    ${upload_conv}

        ${src_files}=    List Files In Directory    ${upload_src}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_src}/${f}
        END

        ${conv_files}=    List Files In Directory    ${upload_conv}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{conv_files}
            Remove File    ${upload_conv}/${f}
        END
    END

    ${file_paths}=    Load File Paths    ${FXPUB_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}         
        ${output}=         Replace Variables    ${file_data['output_xlsx']}       
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}     
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}    
        ${del_prefix}=     Set Variable    ${file_data['del_file_nm']}
        File Should Exist    ${input}
        File Should Exist    ${output}
        # Directory Should Exist    ${upload_src}
        # Directory Should Exist    ${upload_conv}

        ${src_files}=    List Files In Directory    ${upload_src}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{src_files}
            Remove File    ${upload_src}/${f}
        END

        ${conv_files}=    List Files In Directory    ${upload_conv}    pattern=*${del_prefix}*
        FOR    ${f}    IN    @{conv_files}
            Remove File    ${upload_conv}/${f}
        END
    END

FXPUB Upload Source File And Upload Convert File
    ${file_paths}=    Load File Paths    ${FXPUB_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}
        File Should Exist    ${input}
        File Should Exist    ${output}
        # Directory Should Exist    ${upload_src}
        # Directory Should Exist    ${upload_conv}

        Copy File    ${input}    ${upload_src}
        Copy File    ${output}   ${upload_conv}
    END

    ${file_paths}=    Load File Paths    ${FXPUB_YAML_FILE_NO_DELIMITER}
    FOR    ${file_data}    IN    @{file_paths}
        ${input}=          Replace Variables    ${file_data['input_txt']}
        ${output}=         Replace Variables    ${file_data['output_xlsx']}
        ${upload_src}=     Replace Variables    ${file_data['upload_source']}
        ${upload_conv}=    Replace Variables    ${file_data['upload_convert']}

        File Should Exist    ${input}
        File Should Exist    ${output}
        Directory Should Exist    ${upload_src}
        Directory Should Exist    ${upload_conv}
        
        Copy File    ${input}    ${upload_src}
        Copy File    ${output}   ${upload_conv}
    END