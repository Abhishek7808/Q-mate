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
    [Tags]  Basic  login  loginpage
    run keyword and ignore error  ERP_Keywords.Attempt Full Logout          ###""" Attempts logout if user is already logged in """
    ERP_Keywords.Open the Login Page

Invalid login scenarios should display correct error messages
    [Documentation]  Verifies that their is correct error message when user tires to log in with wrong credentials.
    [Tags]  Basic  login  invalidlogin
    [Template]  Test Mutiple Login Failed Scenarios             ###""" This keyword is defined in ERP_Keywords.robot file. """
    ${INVALID_USER}             ###""" These variables are being set in "Begin Basic Testing -> Set Basic Tests Variables" keyword in common keywords file."""
    ${INVALID_PASSWORD}

Users should able to login with correct username and password
    [Documentation]  Verifies that user is able to log in successfully when tries to log in with right credentials.
    [Tags]  Basic  login  validlogin
    [Template]  Test Mutiple Login Successful Scenarios         ###""" This keyword is defined in ERP_Keywords.robot file. """
    ${ADMIN_USER}               ###""" These variables are being set in "Begin Basic Testing -> Set Basic Tests Variables" keyword in common keywords file."""
    ${NONADMIN_USER}


