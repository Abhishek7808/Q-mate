*** Settings ***
Resource  ../Resources/Common_Keywords.robot
Library   ${LIBRARY}/Notifications.py
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Resource  ../Resources/page-objects/ModuleNavigation.robot
Resource  ../Resources/page-objects/HRMS/PostClass.robot
Library     Collections

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot --loglevel debug -d Results Tests/DEBUG.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
@{list}
*** Test Cases ***
Admin should be able to login with correct username and password
    [Tags]  debug
#    ERP_Keywords.Open The Login Page
#    ERP_Keywords.Login To ERP  ${ADMIN_USER}
#    ModuleNavigation.Go To HRMS Dashboard
#    ModuleNavigation.Verify HRMS Dashboard Is Loaded
#    PostClass.Go To Post Class Page
#
#    log to console  &{ALL_USER}.[${admin.username}]

#   send email  me@divaksh.me  Test  Hi This is a test
#    Send Error Push Notification
#     ${msg}  Compose Error Message  ${er}  hello
#     send email  ianubhavverma@gmail.com  yeh  ${msg}

#    Go To Erp Page  ${BASE_URL.${ENVIRONMENT}}HRM/LeaveEncashmentDisbursement/EmployeeBillsDisbursmentIndex
#    append to list  ${list}  hello
#    log to console  ${list}
    ${dict}  set variable  dict
    log to console  ${dict.json()}
