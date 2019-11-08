*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Library   ${LIBRARY}/Notifications.py
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
Library   Collections
Resource  ${PAGE OBJECTS}/TopNavigation.robot


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
${PERFERENCE DROPDOWN}  SalaryCycleId
@{finalList}
*** Test Cases ***


All paybills should be checked
    [Tags]  debug

    Common_Keywords.Open SalaryDisbursement Page  ${finalList}

#
#    sleep  10s
#
#    Mouse Down    xpath=//li[contains(.,'Udaipur')]
#   select last dropdown element  ${PERFERENCE DROPDOWN}
#



