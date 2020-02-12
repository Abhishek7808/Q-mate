*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot
Library           ${LIBRARY}/Addendums.py
Library           DateTime

*** Variables ***
${FINANCIALYEAR1}  20192020           #20172018
${SALARYCYCLEID}  None          #58
${NUMBER_OF_EMPLOYEES}  ${1}
${PAYGROUP}  RIICO Staff (Head Office)
${PAYMENTUNIT}  HEAD OFFICE
${DESIGNATION}  None
${DIVISION}  None
${ISGAZETTED}  None
@{DISBURSEMENT_PAYGROUPS}  ABUROAD (Abu Road)  Ajmer Staff (Ajmer)
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
    HRMS_Keywords.Set Mark Attendance Criteria  ${dataDictionary}
    HRMS_Keywords.Submit Marked Attendance
    HRMS_Keywords.Verify Marked Attendance  ${dataDictionary["Filters"]}
    HRMS_Keywords.Approve Marked Attendance

Process And Lock Salary
    [Documentation]  Processes Salary.
    [Tags]  Salary  salaryprocess  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Detail_Process"]}
    HRMS_Keywords.Open Salary Detail Page
    HRMS_Keywords.Set Salary Process Criteria  ${dataDictionary}
    HRMS_Keywords.Lock Salary  ${dataDictionary["Filters"]}

Add Paybill
    [Documentation]  Adds Paybill.
    [Tags]  Salary  Addpaybill  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Paybill"]}
    HRMS_Keywords.Open Salary Paybill Page
    HRMS_Keywords.Add Salary Paybill  ${dataDictionary}