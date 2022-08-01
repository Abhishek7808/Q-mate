*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource     ../../Resources/MIS_Keywords.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
Monthly Report Salary testcase
    [Documentation]   Monthly Report Testing
    [Tags]  HRMS Monthly MIS Report
    MIS_Keywords.Go to Loginpage
    MIS_Keywords.Open ReportOfSalary
    MIS_Keywords.Verify Salary Report
    MIS_Keywords.Open ReportOfArrear
    MIS_Keywords.Verify ReportOfArrear
    MIS_Keywords.Open LeaveEncashment
    MIS_Keywords.Verify LeaveEncashment
    MIS_Keywords.Open Bonus
    MIS_Keywords.Verify Bonus


