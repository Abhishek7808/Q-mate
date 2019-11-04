*** Variables ***

##########################
#  Environment Settings  #
##########################
${ENVIRONMENT}       demo
${BROWSER}           chrome
&{BASE_URL}          demo=http://demoprojects.e-connectsolutions.com/ERP-DEMO  test=demoprojects.e-connectsolutions.com/ERP-TEST  production=demoprojects.e-connectsolutions.com/ERP-DEMO


####################
#  Directory Names #
####################
${TESTS_DIR}             Tests
${RESOURCE_DIR}          Resources
${PLUGINS_DIR}           Plugins
${LIBRARY_DIR}           Library
${DATA_DIR}              Data
${RESULTS_DIR}           Results
${PAGE_OBJECTS_DIR}      page-objects


###################
#  Path Settings  #
###################
${ROOT}             ${CURDIR}
${TESTS}            ${CURDIR}${/}${TESTS_DIR}
${RESOURCES}        ${CURDIR}${/}${RESOURCE_DIR}
${PLUGINS}          ${CURDIR}${/}${PLUGINS_DIR}
${LIBRARY}          ${CURDIR}${/}${LIBRARY_DIR}
${DATA}             ${CURDIR}${/}${DATA_DIR}
${RESULTS}          ${CURDIR}${/}${RESULTS_DIR}
${PAGE OBJECTS}     ${RESOURCES}${/}${PAGE_OBJECTS_DIR}


######################
#    File Names      #
######################
${REPORT_NAME}              ErrorReport.csv
${URLS_JSON_NAME}           URLs.json
${TEST_URLS_JSON_NAME}      TestUrls.json
${RECIEVERS_JSON_NAME}      Receivers.json
${COMMON_DATA_NAME}         Common_Data.robot


######################
#   File Locations   #
######################
${ERRORFILE}          ${RESULTS}${/}${REPORT_NAME}
${URLS_JSON}          ${DATA}${/}${URLS_JSON_NAME}
${TEST_URLS}          ${DATA}${/}${TEST_URLS_JSON_NAME}
${RECIEVERS_JSON}     ${DATA}${/}${RECIEVERS_JSON_NAME}
${COMMON_DATA}        ${DATA}${/}${COMMON_DATA_NAME}


####################
#  Email Settings  #
####################
&{EMAIL}
...  address=ashwani.vijay@e-connectsolutions.com
...  password=Joy@123
${SEND_EMAIL_NOTIFICATIONS}  True


######################################################################################
# WARNING: DO NOT TOUCH, VARIABLES WRITTEN BELOW ARE USED IN THE PLUGIN AND LIBRARY  #
######################################################################################

# Dafault user type for ERP Login used in plugin ERP.py
${LOGIN}  admin  #employee, citizen, admin

# Login page details used in the plugin ERP.py
${LOGIN_TEXT}            Login to your E-Prashasan Account

# Error Definations
&{ERROR_DETAILS}
...  1= Page is not loading properly
...  2= Appropriate title tag is missing
...  3= Page is accessible without permissions

