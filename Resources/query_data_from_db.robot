*** Variables ***
${GPS_DB_HOST}      172.30.74.210
${GPS_DB_USER}      remitusr
${GPS_DB_PASSWORD}  P@ssw0rd
${GPS_DB_NAME}      remitdb_iso
${GPS_DB_PORT}      3306
${GPS_QUERY}    ${CURDIR}/../Resources/GPS_Query_DB.yaml

${GMTGPS_JUMP_DB_HOST}      172.30.64.32
${GMTGPS_JUMP_DB_USER}      gpsadm
${GMTGPS_JUMP_DB_PASSWORD}  itsi#8Kbtg
${GMTGPS_JUMP_DB_NAME}      remitdb_ir
${GMTGPS_JUMP_DB_PORT}      22

${GMTGPS_DB_HOST}      172.30.84.58
${GMTGPS_DB_USER}      remitusr
${GMTGPS_DB_PASSWORD}  itsi#8Kbtg
${GMTGPS_DB_NAME}      remitdb_fcd
${GMTGPS_DB_PORT}      3306
${GMTGPS_QUERY}    ${CURDIR}/../Resources/GMTGPS_Query_DB.yaml

${DIRECTORY}    ${CURDIR}
${DATE}=    Get Metadata    date