*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Library   ${LIBRARY}/Notifications.py
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Library     Collections
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library     RequestsLibrary

Suite Setup  Common_Keywords.Begin Web Test
Suite Teardown  Common_Keywords.End Web Test

# robot --loglevel debug -d Results Tests/DEBUG.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
${accountUnit} =  //select[@id='UnitIds']
${salaryCycle} =  SalaryCycleId
${applyButton} =  //button[contains(text(),'Apply Filter')]
${salaryUrl} =  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/salaryDisbursment/SalayDisbursmentIndex
# login data added into Data/Login_Data.robot
@{list}
*** Test Cases ***
This test case is for debug purpose only
#    #[Tags]  debug
#    ${dict}    Get Request    ERP DEMO    api/Login/Validate?loginId=vinodrsmml&password=21232F297A57A5A743894A0E4A801FC3&ipAddress=191.11.100.148
#     Create Session     ERP DEMO    http://demoprojects.e-connectsolutions.com/erp-demo/
#     ${dict}    Get Request    ERP DEMO    api/Login/Validate?loginId=vinodrsmml&password=21232F297A57A5A743894A0E4A801FC3&ipAddress=191.11.100.148
#     Log to console   ${dict.status_code} ${dict.json()}
    ERP_Keywords.Open the Login Page
    ERP_Keywords.Attempt Login  ${ADMIN_USER}
    Go To ERP Page  ${salaryUrl}
    click element  btnFilter
    sleep  1s
    click element  BtnResetSearch
    sleep  2s
    click element  btnFilter
    sleep  1s
    select from list by index  ${accountUnit}  0
    sleep  2s
    Select Last Dropdown Element  ${salaryCycle}
    sleep  2s
    click element  ${applyButton}
    sleep  2s