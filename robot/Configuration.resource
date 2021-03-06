*** Variables ***

##########################
#  Environment Settings  #
##########################
${ENVIRONMENT}       test
${BROWSER}           chrome
&{BASE_URL}          dev=https://demoprojects.e-connectsolutions.com/eprash-dev  test=https://demoprojects.e-connectsolutions.com/eprash-test  production=http://rajerp.discoms.rajasthan.gov.in  stg=http://103.203.137.148/STG_TEST
${LOGIN_URL}         ${BASE_URL.${ENVIRONMENT}}/adminlogin

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
${DV_DIR}                DV
${SMM_DIR}               SMM
${SMM_DATA_DIR}          SMM_DATA

###################
#  Path Settings  #
###################
${ROOT}                         ${CURDIR}
${TESTS}                        ${CURDIR}${/}${TESTS_DIR}
${RESOURCES}                    ${CURDIR}${/}${RESOURCE_DIR}
${PLUGINS}                      ${CURDIR}${/}${PLUGINS_DIR}
${LIBRARY}                      ${CURDIR}${/}${LIBRARY_DIR}
${DATA}                         ${CURDIR}${/}${DATA_DIR}
${RESULTS}                      ${CURDIR}${/}${RESULTS_DIR}
${PAGE OBJECTS}                 ${RESOURCES}${/}${PAGE_OBJECTS_DIR}
${DV}                           ${CURDIR}${/}${RESULTS_DIR}${/}${DV_DIR}
${SMM_PAGE_OBJECTS}             ${PAGE OBJECTS}${/}${SMM_DIR}
${SMM_DATA_FILES}               ${DATA}${/}${SMM_DATA_DIR}

######################
#    File Names      #
######################
${REPORT_NAME}              ErrorReport.csv
${DV_REPORT_NAME}           Disbursement.csv
${CPF_REPORT_NAME}          BeneficiaryReport.csv
${URLS_JSON_NAME}           URLs.json
${TEST_URLS_JSON_NAME}      TestUrls.json
${CONTACTS_JSON_NAME}       Receivers.json
${COMMON_DATA_NAME}         Common_Data.robot
${CREDENTIALS_FILE_NAME}    Credentials.json
${EMPLOYEE_FILE_NAME}         EmployeeCode.txt

######################
#   File Locations   #
######################
${ERRORFILE}          ${RESULTS}${/}${REPORT_NAME}
${DV_REPORT}          ${DV}${/}${DV_REPORT_NAME}
${CPF_REPORT}         ${RESULTS}${/}${CPF_REPORT_NAME}
${URLS_JSON}          ${DATA}${/}${URLS_JSON_NAME}
${TEST_URLS}          ${DATA}${/}${TEST_URLS_JSON_NAME}
${CONTACTS_JSON}      ${DATA}${/}${CONTACTS_JSON_NAME}
${COMMON_DATA}        ${DATA}${/}${COMMON_DATA_NAME}
${CREDENTIALS_FILE}   ${DATA}${/}${CREDENTIALS_FILE_NAME}
${EMPLOYEE_FILE}        ${DATA}${/}${EMPLOYEE_FILE_NAME}
${LOAN_APPLICATIONS_FILE}   ${DATA}${/}CPF_DATA${/}loan_applications_.txt

####################
#  Email Settings  #
####################
&{EMAIL}
...  address=rpa@e-connectsolutions.com
...  password=R@pa@19
${SEND_EMAIL_NOTIFICATIONS}  True


####################
#  Time Settings   #
####################
${DELAY}          0
${RETRY TIME}     10s
${RETRY INTERVAL}    2s


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

&{CPF}
...  name=CPF
...  link=/CPF
...  link_title=xpath=//a[@title='CPF']
...  dashboard_title=CPF:Dashboard

&{TLM}
...  name=TLM
...  link=/TLM
...  link_title=xpath=//a[@title='']
...  dashboard_title=''

&{MM}
...  name=MM
...  link=/MM
...  link_title=//a[@title='MM & Procurement']
...  dashboard_title=MM & Procurement

&{IMS}
...  name=IMS
...  link=/IMS
...  link_title=//a[@title='']
...  dashboard_title=''

&{LDM}
...  name=LDM
...  link=/LDM
...  link_title=//a[@title='']
...  dashboard_title=''

&{WPM}
...  name=WPM
...  link=/WPM
...  link_title=//a[@title='Work & Project Mgmt.']
...  dashboard_title=MM & Procurement

&{AMS}
...  name=AMS
...  link=/AMS
...  link_title=//a[@title='Asset Management']
...  dashboard_title=Asset Management

&{GPF}
...  name=GPF
...  link=/GPF
...  link_title=//a[@title='General Provident Fund']
...  dashboard_title=Asset Management





########################
#    Organizations     #
########################




######################################################################################
# WARNING: DO NOT TOUCH, VARIABLES WRITTEN BELOW ARE USED IN THE PLUGIN AND LIBRARY  #
######################################################################################

# Default user type for ERP Login used in plugin ERP.py
${LOGIN}  admin  #employee, citizen, admin

# Login page details used in the plugin ERP.py
${LOGIN_TEXT}            Login to your E-Prashasan Account

# Error Definition
&{ERROR_DETAILS}
...  1= Encountered with a showstopper, High
...  2= Appropriate title tag is missing, Low
...  3= Resource not found, High
...  4= Page is accessible without permissions, High

#Notify False Positive Link
${NOTIFY_FALSE_ERROR_LINK}  https://divaksh.com/q-mate/false_positive.php?q=