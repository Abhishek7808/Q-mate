*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot

*** Variables ***
#${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json
${Server}            http://demoprojects.e-connectsolutions.com/erp-test
${Browser}           Chrome

${SalarySlip}   http://demoprojects.e-connectsolutions.com/ERP-TEST/HRM/PayrollProcess/Index
${Action}   Xpath=//*[@id="classListing"]/div[2]/table/tbody/tr[1]/td[12]/div[2]/a

*** Test Cases ***

User should able to configure pay slip
    [Documentation]  Configures different details for pay slip.
    [Tags]  HRMS  payconfigration
    Common_Keywords.Set Test Data  ${configData["Pay Slip Configuration"]}
    HRMS_Keywords.Open Pay Slip Configuration Page
    HRMS_Keywords.Configure Pay Slip Details  ${dataDictionary}
    HRMS_Keywords.Save Pay Slip Configurations  ${dataDictionary}
    sleep  4s

   Open Browser  ${Server}  ${Browser}
  Wait Until page Contains  Login
  input text     LoginIdForShow  econnect
  input password    PasswordForShow  admin
  Click element      ${Login_button}
  sleep   3s
    Go to   ${SalarySlip}
    sleep   5s
    Click Element     ${Action}
    sleep   2s
    Select From List By Value   //*[@id="lnkMultipleSalarySlip_11387709"]
    sleep   2s
