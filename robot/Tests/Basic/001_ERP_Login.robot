*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot

*** Variables ***

*** Test Cases ***

User should able to access login page
    [Documentation]  verifies that user is able to access the login page.
    [Tags]  login  loginpage
    run keyword and ignore error  ERP_Keywords.Attempt Full Logout          ###""" Attempts logout if user is already logged in
    ERP_Keywords.Open the Login Page

Invalid login scenarios should display correct error messages
    [Documentation]  Verifies that their is correct error message when user tires to log in with wrong credentials.
    [Tags]  login  invalidlogin
    [Template]  Test Mutiple Login Failed Scenarios
    ${INVALID_USER}
    ${INVALID_PASSWORD}
    #${BLANK_USER}

Users should able to login with correct username and password
    [Documentation]  Verifies that user is able to log in successfully when tries to log in with right credentials.
    [Tags]  login  validlogin
    [Template]  Test Mutiple Login Successful Scenarios
    ${ADMIN_USER}
    ${NONADMIN_USER}


