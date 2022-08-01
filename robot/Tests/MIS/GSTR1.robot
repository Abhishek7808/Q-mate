*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library     Screenshot
Resource    ../../Resources/MIS_Keywords.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
GSTR1 Sales Report
    [Documentation]   GSTR1 Sales Report Testing
    [Tags]  admin GSTR1 Sales Report
    MIS_Keywords.GSTR1_Login_Window
    MIS_Keywords.Open GSTR1 Sales Report
