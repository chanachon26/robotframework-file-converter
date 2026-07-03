*** Variables ***
${DATE}=    Get Metadata    date    ## วันที่ต้องการ Convert File ตาม File Name YYYYMMDD ##
${DATE_Path}=    Get Metadata    datepath    ## Path Name ที่สร้างใหม่ทุกวันตอนเช้า เช่น 20250401 , 2025-04-01 , 01-Apr-25 ##
${DELIMITER}                 |

## GMT-GPS ###
${GMT_YAML_FILE_DELIMITER}       ${CURDIR}/../Resources/GMT_Config_Convert_Pipe.yaml    ## Congfig File Convert ด้วย | ##
${GMT_YAML_FILE_NO_DELIMITER}    ${CURDIR}/../Resources/GMT_Config_Convert_FixLength.yaml    ## Config File Convert Fix Length

${GMT_INPUT_path}                ${CURDIR}/../Test_Data/GMTGPS    ## Path ที่เก็บ Source ไฟล์บนเครื่อง ##
${GMT_OUTPUT_path}               ${CURDIR}/../Test_Data/GMTGPS/z_Convert    ## GPS Path ที่ Convert เสร็จแล้ว(ทับของเดิมทุกวัน) ##

${GMT_UPLOAD_Source_File}        C:/Users/o_chanachon.c/KASIKORNBANKGROUP/[PRJ-2023-1114-003] GMT R1.1 - 02 UAT Cycle/UAT Cycle1/4_UAT1_Downstream/${DATE_Path}    ## Path ที่ Upload Source File(Share Drive) ##
${GMT_UPLOAD_Convert_File}       C:/Users/o_chanachon.c/KASIKORNBANKGROUP/[PRJ-2023-1114-003] GMT R1.1 - 02 UAT Cycle/UAT Cycle1/4_UAT1_Downstream/${DATE_Path}    ## Path ที่ Upload Convert File(Share Drive) ##

## FXPUB ##
${FXPUB_YAML_FILE_NO_DELIMITER}    ${CURDIR}/../Resources/FXPUB_Config_Convert_FixLength.yaml    ## Config File Convert Fix Length
${FXPUB_INPUT_path}                ${CURDIR}/../Test_Data/FXPUB    ## Path ที่เก็บ Source ไฟล์บนเครื่อง ##
${FXPUB_OUTPUT_path}               ${CURDIR}/../Test_Data/FXPUB/z_Convert    ## FXPUB Path ที่ Convert เสร็จแล้ว(ทับของเดิมทุกวัน) ##

${FXPUB_UPLOAD_Source_File}        C:/Users/o_chanachon.c/KASIKORNBANKGROUP/[PRJ-2023-1114-003] GMT R1.1 - 02 UAT Cycle/UAT Cycle1/4_UAT1_Downstream/${DATE_Path}    ## Path ที่ Upload Source File(Share Drive) ##
${FXPUB_UPLOAD_Convert_File}       C:/Users/o_chanachon.c/KASIKORNBANKGROUP/[PRJ-2023-1114-003] GMT R1.1 - 02 UAT Cycle/UAT Cycle1/4_UAT1_Downstream/${DATE_Path}    ## Path ที่ Upload Convert File(Share Drive) ##


## GPS ##
${GPS_YAML_FILE_DELIMITER}       ${CURDIR}/../Resources/GPS_Config_Convert_Pipe.yaml    ## Congfig File Convert ด้วย | ##
${GPS_YAML_FILE_NO_DELIMITER}    ${CURDIR}/../Resources/GPS_Config_Convert_FixLength.yaml    ## Config File Convert Fix Length

${GPS_INPUT_path}                ${CURDIR}/../Test_Data/GPS/    ## Path ที่เก็บ Source ไฟล์บนเครื่อง ##
${GPS_OUTPUT_path}               ${CURDIR}/../Test_Data/GPS/z_Convert    ## GPS Path ที่ Convert เสร็จแล้ว(ทับของเดิมทุกวัน) ##

${GPS_UPLOAD_Source_File}        C:/Users/o_chanachon.c/KASIKORNBANKGROUP/Piyakarn Klindee - UAT/${DATE_Path}    ## Path ที่ Upload Source File(Share Drive) ##
${GPS_UPLOAD_Convert_File}       C:/Users/o_chanachon.c/KASIKORNBANKGROUP/Piyakarn Klindee - UAT/${DATE_Path}    ## Path ที่ Upload Convert File(Share Drive) ##

