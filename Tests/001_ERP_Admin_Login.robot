*** Settings ***
Documentation  ERP Tests
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot

Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot -d Results Tests/001_ERP_Admin_Login.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot

*** Test Cases ***
Admin should be able to login with correct username and password
    [Documentation]  Opens the login page and login in with the admin username and password
    [Tags]  adminlogin
    ERP_Keywords.Open The Login Page
    sleep  1s
    ERP_Keywords.Login To ERP  ${ADMIN_USER}
    sleep  3s