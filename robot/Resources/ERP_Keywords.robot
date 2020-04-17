*** Settings ***
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Library   ${LIBRARY}/GenericTests.py
Resource  ${PAGE OBJECTS}/Generic.robot
Resource  ${PAGE OBJECTS}/Login.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot
Resource  ${PAGE OBJECTS}/Dashboard.robot
*** Keywords ***
Open the Login Page
    [Documentation]  Opens the login page and verified it is loaded or not
    Login.Navigate To Page
    Login.Verify Page Loaded

Attempt Login
    [Documentation]  Logins the Erp with given credentials
    [Arguments]  ${Credentials}
    Set Log Level    NONE
    ${username}  get from dictionary  ${Credentials}  username
    ${password}  get from dictionary  ${Credentials}  password
    Login.Fill Username  ${username}
    sleep  1s
    Login.Fill Password  ${password}
    Set Log Level  INFO
    Login.Submit The Form

Attempt Full Logout
    [Documentation]  Logout the user
    TopNavigation.Open User Action Menu
    TopNavigation.Click On Logout Link
    TopNavigation.Verify Login Page Is Loaded

Attempt Logout
    [Documentation]  Do logout directly
    Login.Go To Logout

Test Mutiple Login Failed Scenarios
    [Documentation]  Opens login page, Tests the login functionality with wrong credentials
    [Arguments]  ${Credentials}
    ERP_Keywords.Open the Login Page
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Test Mutiple Login Successful Scenarios
    [Documentation]  Opens login page, Tests the login functionality with right credentials
    [Arguments]  ${Credentials}
    ERP_Keywords.Open the Login Page
    ${status}  run keyword and return status  Login.Verify Page Loaded
    run keyword unless  ${status}  Login.Go To Logout
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}
    BuiltIn.sleep  5s
    Attempt Full Logout

Login To ERP
    [Documentation]  Login the user to ERP
    [Arguments]  ${Credentials}
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Go To ERP
    [Documentation]  Opens the ERP login page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}          ###""" This variable is defined in "Configuration.resource" file. """

Go To Home
    [Documentation]  Opens the home page
    TopNavigation.Go Back To Home

Test UM
    [Documentation]  Opens UM module and verifies dashboard is loaded.
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To UM Module
    ModuleNavigation.Verify UM Dashboard Is Loaded

Test HRMS
    [Documentation]  Opens HRMS module and verifies dashboard is loaded.
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To HRMS Module
    ModuleNavigation.Verify HRMS Dashboard Is Loaded

Test FA
    [Documentation]  Opens FA module and verifies dashboard is loaded.
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To FA Module
    ModuleNavigation.Verify FA Dashboard Is Loaded

Run Generic Tests From Admin
    [Documentation]  runs generic tests, uses admin id for login.
    [Arguments]  ${moduleName}
    ###""" A list of modules names is created which is used when error emails are fired for each module one by one."""
    ${status}  run keyword and return status  list should not contain value  ${moduleNames}  ${moduleName}          ###"""Adds module into the List if it is not in the list .
    run keyword if  ${status} == ${True}  append to list  ${moduleNames}  ${moduleName}
    set global variable  @{moduleNames}
    @{urlsList}  Generic.Get All Module Urls  ${moduleName}
    Generic.Perform All Critical Generic Tests On Urls  ${moduleName}  @{urlsList}

Run Generic Tests From Other User
    [Documentation]  runs generic tests, uses non admin id for login.
    [Arguments]  ${moduleName}
    Attempt Logout
    ###""" A list of modules names is created which is used when error emails are fired for each module one by one."""
    ${status}  run keyword and return status  list should not contain value  ${moduleNames}  ${moduleName}          ###"""Adds module into the List if it is not in the list .
    run keyword if  ${status} == ${True}  append to list  ${moduleNames}  ${moduleName}
    set global variable  @{moduleNames}
    @{urlsList}  Generic.Get All Module Urls  ${moduleName}
    Generic.Perform Permission Tests On Urls  ${moduleName}  @{urlsList}

Perform Login
    [Documentation]  Performs login.
    Dashboard.Open Login Page And Do Login

Verify Landing Page Is Loaded
    [Documentation]  Checks if landing page is loaded, if not then updtes the error.
    ${status}  run keyword and return status  ERP_Keywords.Verify Dashboard Is Loaded
	run keyword if  ${status} == ${False}  capture page screenshot
    run keyword if  ${status} == ${False}  Common_Keywords.Update Error Sheet  Fail  ELSE  Common_Keywords.Update Error Sheet  Pass
    run keyword if  ${status} == ${False}  run keyword and continue on failure  Fail  Suspected downtime

Verify Dashboard Is Loaded
    [Documentation]  checks for dashboard text and verifies the url is correct.
    Dashboard.Check For Dashboard Text On The Page
    Dashboard.Check For Page URL
