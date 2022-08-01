*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource   ../../Resources/MIS_Keywords.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
PayrollMIS Report
    [Documentation]   Payroll MIS Report Testing
    [Tags]  HRMS Payroll MIS
    MIS_Keywords.Login to ERP Page
    MIS_Keywords.Salary Report
    MIS_Keywords.Arrear Report
    MIS_Keywords.Leave Encashment Report

   # Keywords.Verify Report