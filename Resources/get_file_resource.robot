*** Variables ***
${DATE}=    Get Metadata    date

## GMTGPS ##
${GMTGPS_JUMP_HOST}         172.30.64.32
${GMTGPS_JUMP_USER}         sit00757
${GMTGPS_JUMP_PASS}         P@ssw0rd$1T

${GMTGPS_TARGET_HOST}       172.30.76.73
${GMTGPS_TARGET_USER}       gpsadm
${GMTGPS_TARGET_PASS}       itsi#8Kbtg

${GMTGPS_DIRECTORY}         ${CURDIR}/../Test_Data/GMTGPS/${DATE}/GPS
${GMTGPS_CONFIG_FILE}       ${CURDIR}/../Resources/GMTGPS_Config_Get_File.yaml

## GMTGMT ##
${GMTGMT_JUMP_HOST}         172.30.64.32
${GMTGMT_JUMP_USER}         sit00757
${GMTGMT_JUMP_PASS}         P@ssw0rd$1T

${GMTGMT_TARGET_HOST}       172.30.65.61
${GMTGMT_TARGET_USER}       gmttester
${GMTGMT_TARGET_PASS}       Tester@1kbank

${GMTGMT_DIRECTORY}         ${CURDIR}/../Test_Data/GMTGPS/${DATE}/GMT
${GMTGMT_CONFIG_FILE}       ${CURDIR}/../Resources/GMTGMT_Config_Get_File.yaml

## GPS ##
${GPS_TARGET_HOST}       172.30.65.61
${GPS_TARGET_USER}       gpsadm
${GPS_TARGET_PASS}       GPSP@ssw0rd

${GPS_DIRECTORY}         ${CURDIR}/../Test_Data/GPS/${DATE}
${GPS_CONFIG_FILE}       ${CURDIR}/../Resources/GPS_Config_Get_File.yaml

## FXPUB ##
${FXPUB_TARGET_HOST}       10.225.96.68
${FXPUB_TARGET_USER}       fxpapp
${FXPUB_TARGET_PASS}       itsi@01Kbtg

${FXPUB_DIRECTORY}         ${CURDIR}/../Test_Data/FXPUB/${DATE}
${FXPUB_CONFIG_FILE}       ${CURDIR}/../Resources/FXPUB_Config_Get_File.yaml