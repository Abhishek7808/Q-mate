*** Settings ***
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Library   ${LIBRARY}/GenericTests.py
Resource  ${PAGE OBJECTS}/Generic.robot
Resource  ${PAGE OBJECTS}/Login.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot

*** Keywords ***
Open the Login Page
    [Documentation]  Opens the login page and verified it is loaded or not
    Login.Navigate To Page
    Login.Verify Page Loaded

Attempt Login
    [Documentation]  Logins the Erp with given credentials
    [Arguments]  ${Credentials}
    ${username}  get from dictionary  ${Credentials}  username
    ${password}  get from dictionary  ${Credentials}  password
    Login.Fill Username  ${username}
    Login.Fill Password  ${password}
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
    [Documentation]  Tests the login functionality with wrong credentials
    [Arguments]  ${Credentials}
    ERP_Keywords.Open the Login Page
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Test Mutiple Login Successful Scenarios
    [Documentation]  Tests the login functionality with right credentials
    [Arguments]  ${Credentials}
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
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}

Go To Home
    [Documentation]  Opens the home page
    TopNavigation.Go Back To Home

Test UM
    [Documentation]  Test UM module
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To UM Module
#    Run Generic Tests From Admin
    ModuleNavigation.Verify UM Dashboard Is Loaded
    #Go To ERP Page Home

Test HRMS
    [Documentation]  Test HRMS module
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To HRMS Module
#    Run Generic Tests From Admin
    ModuleNavigation.Verify HRMS Dashboard Is Loaded
    #Go To ERP Page Home

Test FA
    [Documentation]  Test FA module
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To FA Module
#   Run Generic Tests From Admin
    ModuleNavigation.Verify FA Dashboard Is Loaded
    #Go To ERP Page Home

Run Generic Tests From Admin
    [Documentation]
    [Arguments]  ${moduleName}
    @{urlsList}  Generic.Get All Module Urls  ${moduleName}
    Generic.Perform All Critical Generic Tests On Urls  ${moduleName}  @{urlsList}

Run Generic Tests From Other User
    [Arguments]  ${moduleName}
    Attempt Logout
    @{urlsList}  Generic.Get All Module Urls  ${moduleName}
    Generic.Perform Permission Tests On Urls  ${moduleName}  @{urlsList}



