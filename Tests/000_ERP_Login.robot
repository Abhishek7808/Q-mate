*** Settings ***
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Resource  ../Resources/page-objects/TopNavigation.robot
#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot -d Results Tests/000_ERP_Login.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot


*** Test Cases ***

User should be able to access login page
    [Tags]  login
    ERP_Keywords.Open the Login Page

Invalid login scenarios should display correct error messages
    [Tags]  login
    [Template]  Test Mutiple Login Failed Scenarios
    ${INVALID_USER}
    ${INVALID_PASSWORD}
    #${BLANK_USER}

Users should be able to login with correct username and password
    [Tags]  login
    [Template]  Test Mutiple Login Successful Scenarios
    ${ADMIN_USER}
    ${NONADMIN_USER}


