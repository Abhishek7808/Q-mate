*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/MIS_Keywords.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
IncomeTaxDetection Report
    [Documentation]   IncomeTaxDetection Report Testing
    [Tags]  HRMS Income Tax Detection MIS
    MIS_Keywords.Go To ERP Page
    MIS_Keywords.Income Tax Report
    MIS_Keywords.Verify Income Tax Report
