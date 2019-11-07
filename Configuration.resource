*** Variables ***

##########################
#  Environment Settings  #
##########################
${ENVIRONMENT}       demo
${BROWSER}           chrome
&{BASE_URL}          demo=http://demoprojects.e-connectsolutions.com/ERP-DEMO  test=http://demoprojects.e-connectsolutions.com/ERP-TEST  production=http://demoprojects.e-connectsolutions.com/ERP-DEMO


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
${URLS_JSON_NAME}           TestUrls.json
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
...  address=anubhav.verma@e-connectsolutions.com
...  password=A@nub@19
${SEND_EMAIL_NOTIFICATIONS}  True


####################
#  Time Settings   #
####################
${DELAY}          0
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms



######################################################################################
# WARNING: DO NOT TOUCH, VARIABLES WRITTEN BELOW ARE USED IN THE PLUGIN AND LIBRARY  #
######################################################################################

# Dafault user type for ERP Login used in plugin ERP.py
${LOGIN}  admin  #employee, citizen, admin

# Login page details used in the plugin ERP.py
${LOGIN_TEXT}            Login to your E-Prashasan Account

# Error Definition
&{ERROR_DETAILS}
...  1= Encountered with a showstopper
...  2= Appropriate title tag is missing
...  3= Resource not found
...  4= Page is accessible without permissions

#Notify False Positive Link
${NOTIFY_FALSE_ERROR_LINK}  https://divaksh.com/q-mate/false_positive.php?q=