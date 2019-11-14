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
${number} =  1
#${num}  convert to integer  3

*** Test Cases ***


All paybills should be checked
    [Tags]  debug
#
#    Common_Keywords.Open SalaryDisbursement Page  ${finalList}

#
#    sleep  10s
#
#    Mouse Down    xpath=//li[contains(.,'Udaipur')]
#   select last dropdown element  ${PERFERENCE DROPDOWN}

#
#    log to console  ${number}
#    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}${HRMS.link}
#    sleep  4s
#    ${floatnum}  Evaluate  "%.2f" % ${number}
#    #${floatnum2}  convert to number  ${floatnum}  2
#    log to console  ${floatnum}
     ${num}  convert to integer  ${number}

#     ${num}  set variable  ${num+1}
#     log to console  ${num}
     FOR  ${i}  IN RANGE  1  5
     \   ${num}  set variable  ${num+1}
     \   log to console  ${num}



*** Keywords ***
