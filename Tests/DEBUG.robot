*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Library   ${LIBRARY}/Notifications.py
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
Library   Collections

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot --loglevel debug -d Results Tests/DEBUG.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot


${PERFERENCE MENU ID}  xpath=//div[@id='s2id_Pre_Unit']
${Change Preference}  xpath=//a[contains(text(),'Change Preference')]
${PERFERENCE DROPDOWN}  Pre_Unit

*** Test Cases ***
#This test case is for debug purpose only
    #[Tags]  debug

#Unit Selection
Change Unit Pefrence
    [Tags]  debug
    open erp page  /HRM/salaryDisbursment/SalayDisbursmentIndex
#    TopNavigation.Open User Action Menu
#    click element  ${Change Preference}
#    sleep  5s
#    click element  ${PERFERENCE MENU ID}
#    Wait Until Page Contains Element  xpath=//ul[contains(@class,'select2-results')]
#    ${count}  Get Element Count  //div[@id='select2-drop']//li
#    FOR  ${i}  IN RANGE  1  ${count}
#    \    click element  xpath=//div[@id='select2-drop']//li[${i}]
#    \    click element  ${PERFERENCE MENU ID}
#
#    sleep  10s

#    Send Error Email Notification  ${HRMS.name}  ${RECIEVERS_JSON}

#    Mouse Down    xpath=//li[contains(.,'Udaipur')]
#    select last dropdown element  ${PERFERENCE DROPDOWN}


