*** Settings ***
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Library   GenericTests.py
Resource  ${PAGE OBJECTS}/Generic.robot
Resource  ${PAGE OBJECTS}/Generic.robot
Resource  ${PAGE OBJECTS}/Login.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot

*** Keywords ***
Open the Login Page
    Login.Navigate To Page
    Login.Verify Page Loaded

Attempt Login
    [Arguments]  ${Credentials}
    Login.Fill Username  ${Credentials.username}
    Login.Fill Password  ${Credentials.password}
    Login.Submit The Form

Attempt Full Logout
    TopNavigation.Open User Action Menu
    TopNavigation.Click On Logout Link
    TopNavigation.Verify Login Page Is Loaded

Attempt Logout
    Login.Go To Logout

Test Mutiple Login Failed Scenarios
    [Arguments]  ${Credentials}
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Test Mutiple Login Successful Scenarios
    [Arguments]  ${Credentials}
    ${status}  run keyword and return status  Login.Verify Page Loaded
    run keyword unless  ${status}  Login.Go To Logout
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}
    sleep 5s
    Attempt Full Logout

Login To ERP
    [Arguments]  ${Credentials}
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Go To ERP
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}

Go To Home
    TopNavigation.Go Back To Home

Test UM
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To UM Module
 #   Run Generic Tests From Admin
    ModuleNavigation.Verify UM Dashboard Is Loaded
    #Go To ERP Page Home

Test HRMS
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To HRMS Module
#    Run Generic Tests From Admin
    ModuleNavigation.Verify HRMS Dashboard Is Loaded
    #Go To ERP Page Home

Test FA
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To FA Module
 #   Run Generic Tests From Admin
    ModuleNavigation.Verify FA Dashboard Is Loaded
    #Go To ERP Page Home

Run Generic Tests From Admin
    [Arguments]  ${moduleName}
    @{urlsList}  Generic.Get All Module Urls  ${moduleName}
    Generic.Perform All Critical Generic Tests On Urls  ${moduleName}  @{urlsList}

Run Generic Tests From Other User
    [Arguments]  ${moduleName}
    Attempt Logout
    @{urlsList}  Generic.Get All Module Urls  ${moduleName}
    Generic.Perform Permission Tests On Urls  ${moduleName}  @{urlsList}

#Check ALL HRM Urls
