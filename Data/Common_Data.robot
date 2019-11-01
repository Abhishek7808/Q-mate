*** Variables ***

##########################
#  Environment Settings  #
##########################
${ENVIRONMENT}  demo
${BROWSER}  chrome
&{BASE_URL}  demo=http://demoprojects.e-connectsolutions.com/ERP-DEMO  test=demoprojects.e-connectsolutions.com/ERP-TEST  production=demoprojects.e-connectsolutions.com/ERP-DEMO


####################
#  Directory Names #
####################
${TESTS_DIR}        Tests
${RESOURCE_DIR}    Resources
${PLUGINS_DIR}      Plugins
${LIBRARY_DIR}      Library
${DATA_DIR}         Data
${RESULTS_DIR}      Results


###################
#  Path Settings  #
###################
${ROOT}       ${CURDIR}
${TESTS}      ${CURDIR}${/}..${/}${TESTS_DIR}
${RESOURCES}  ${CURDIR}${/}..${/}${RESOURCE_DIR}
${PLUGINS}    ${CURDIR}${/}..${/}${PLUGINS_DIR}
${LIBRARY}    ${CURDIR}${/}..${/}${LIBRARY_DIR}
${DATA}       ${CURDIR}${/}..${/}${DATA_DIR}
${RESULTS}    ${CURDIR}${/}..${/}${RESULTS_DIR}


######################
#    File Names      #
######################
${REPORT_NAME}  ErrorReport.csv
${URLS_JSON_NAME}  URLs.json
${TEST_URLS_JSON_NAME}  TestUrls.json


######################
#   File Locations   #
######################
${ERRORFILE}  ${RESULTS}${/}${REPORT_NAME}
${URLS_JSON}  ${DATA}${/}${URLS_JSON_NAME}
${TEST_URLS}  ${DATA}${/}${TEST_URLS_JSON_NAME}
${RECIEVERS_JSON}  ./Data/Recievers.json
#${ERRORFILE}  ${CURDIR}${/}..${/}Results${/}${REPORT_NAME}


####################
#  Email Settings  #
####################
&{EMAIL}
...  address=ashwani.vijay@e-connectsolutions.com
...  password=Joy@123
${SEND_EMAIL_NOTIFICATIONS}  True


########################
#  All Module Details  #
########################
&{HRMS}
...  name=HRM
...  link=/HRM
...  link_title=//a[@title='HRMS']
...  dashboard_title=HRM:Dashboard

&{FA}
...  name=ACC
...  link=/ACC
...  link_title=xpath=//a[@title='Financial Accounting']
...  dashboard_title=Financial Accounts:Dashboard

&{UM}
...  name=URM
...  link=/URM
...  link_title=xpath=//a[@title='User Management']
...  dashboard_title=User, Role and Workflow Management:Dashboard

&{SMM}
...  name=SMM
...  link=/SMM
...  link_title=xpath=//a[@title='User Management']
...  dashboard_title=Sales & Marketing


######################################################################################
# WARNING: DO NOT TOUCH, VARIABLES WRITTEN BELOW ARE USED IN THE PLUGIN AND LIBRARY  #
######################################################################################

# Dafault user type for ERP Login used in plugin ERP.py
${LOGIN}  admin  #employee, citizen, admin

# Login page details used in the plugin ERP.py
${LOGIN_TEXT}            Login to your E-Prashasan Account