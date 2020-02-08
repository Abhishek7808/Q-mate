*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot
Library           ${LIBRARY}/Addendums.py
Library           DateTime

*** Test Cases ***
Create Salary Cycle
    [Documentation]  Fills details in Salary Cycle form and submits it.
    [Tags]  Salary  SalaryCycle  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Cycle"]}
    HRMS_Keywords.Open Salary Cycle Page
    HRMS_Keywords.Add Salary Cycle  ${dataDictionary}

Mark Attendance Of Employees
    [Documentation]  Fills details in Mark Attendance form and submits it.
    [Tags]  Salary  markAttendance  createdata
    Common_Keywords.Set Test Data  ${configData["Mark_Attendance"]}
    HRMS_Keywords.Open Manual Attendance Page
    HRMS_Keywords.Set Filters  ${dataDictionary}