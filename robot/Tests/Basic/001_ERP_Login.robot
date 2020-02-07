*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot -d Results Tests/001_ERP_Login.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot


*** Test Cases ***

User should able to access login page
    [Tags]  login  loginpage
    run keyword and ignore error  ERP_Keywords.Attempt Full Logout
    ERP_Keywords.Open the Login Page

Invalid login scenarios should display correct error messages
    [Tags]  login  invalidlogin
    [Template]  Test Mutiple Login Failed Scenarios
    ${INVALID_USER}
    ${INVALID_PASSWORD}
    #${BLANK_USER}

Users should able to login with correct username and password
    [Tags]  login  validlogin
    [Template]  Test Mutiple Login Successful Scenarios
    ${ADMIN_USER}
    ${NONADMIN_USER}


