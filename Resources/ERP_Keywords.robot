*** Settings ***
Library  SeleniumLibrary
Resource  ./page-objects/Generic.robot
Resource  ./page-objects/Login.robot
Resource  ./page-objects/TopNavigation.robot
Resource  ./page-objects/ModuleNavigation.robot

*** Keywords ***
Open the Login Page
    Login.Navigate To Page
    Login.Verify Page Loaded

Attempt Login
    [Arguments]  ${Credentials}
    Login.Fill Username  ${Credentials.username}
    Login.Fill Password  ${Credentials.password}
    Login.Submit The Form

Attempt Logout
    TopNavigation.Open User Action Menu
    TopNavigation.Click On Logout Link
    TopNavigation.Verify Login Page Is Loaded

Test Mutiple Login Failed Scenarios
    [Arguments]  ${Credentials}
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Test Mutiple Login Successful Scenarios
    [Arguments]  ${Credentials}
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}
    Attempt Logout

Login To ERP
    [Arguments]  ${Credentials}
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

Check The Session
    [Arguments]  ${Credentials}
    run keyword if  'login.Verify Page Loaded'=='PASS'
    Attempt Login   ${Credentials}
    Login.Verify Login Message  ${Credentials.ExpectedResponseMessage}

#    run keyword if
#    ${session}=  run keyword and return  Login.Verify Page Loaded
#    Log  variable value is  ${session}
#    run keyword if  ${session}==${LOGIN_TEXT}  Attempt Login   ${Credentials}
#    ...  else


# TODO: separate tests form the run generic tests keywords to get more control on each type of tests. Edit existing keywords for the title tags, another for the any error found in the page.
Run Generic Tests
    [Arguments]  ${pageUrl}
    go to  ${URL.${ENVIRONMENT}}/${pageUrl}
    Check Error Occurred
    Check Title Tag
#    checkAccessValidator

Check Error Occurred
    page should not contain  Sorry! An error

Check Title Tag
    ${title}=  get title
    should not be empty  ${title}
    should not be equal  ${title}  Index

Go To Home
    TopNavigation.Go Back To Home

Test UM
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To UM Module
    Run Generic Tests
    ModuleNavigation.Verify UM Dashboard Is Loaded
    #Go To Home

Test HRMS
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To HRMS Module
    Run Generic Tests
    ModuleNavigation.Verify HRMS Dashboard Is Loaded
    #Go To Home

Test FA
    ModuleNavigation.Open Modules Menu
    ModuleNavigation.Navigate To FA Module
    Run Generic Tests
    ModuleNavigation.Verify FA Dashboard Is Loaded
    #Go To Home

