*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}HRMS_Keywords.robot
Library           ${LIBRARY}${/}Addendums.py
Library           DateTime

*** Variables ***
${TEST_PAYGROUP}  None
${SALARYFINANCIALYEAR}  20192020           #20172018
${SALARYCYCLE}  None          #58
${NUMBER_OF_EMPLOYEES}  ${1}
${PAYGROUP}
${PAYMENTUNIT}  Bharatpur Zone
${PAYSLIPUNIT}  head office
${DESIGNATION}  None
${DIVISION}  None
${ISGAZETTED}  None
@{DISBURSEMENT_PAYGROUPS}    Select all
@{DISBURSEMENT_PAYBILLS}    1021/2019-2020
${latestPaybillCreated}  1021/2019-2020
${EMPLOYEELOCATION}  Select all


###""" robot -d robot/Results --variable BROWSER:chrome --variable ENVIRONMENT:stg --variable LOGIN:stg --variable PAYGROUP:"" --variable FINANCIALYEAR:"" --variable SALARYCYCLE:"" -i salary robot/Tests.
###""" If financial year and salary cycle are not given by user then current financial year and salary cycle will be chosen. """
*** Test Cases ***

Create Salary Cycle
    [Documentation]  Fills details in Salary Cycle form and submits it. Creates Salary cycle of current month and year.
    [Tags]  HRMS  Salary  SalaryCycle  createdata  salarycheck
    Common_Keywords.Set Test Data  ${configData["Salary_Cycle"]}
    HRMS_Keywords.Open Salary Cycle Page
    HRMS_Keywords.Add Salary Cycle  ${dataDictionary}           ###""" Adds salary cycle of the current month and year """###

Mark Attendance Of Employees
    [Documentation]  Fills details in Mark Attendance form and submits it.
    [Tags]  HRMS  Salary  markAttendance  createdata
    Common_Keywords.Set Test Data  ${configData["Mark_Attendance"]}
    HRMS_Keywords.Open Manual Attendance Page
    HRMS_Keywords.Set Mark Attendance Criteria  ${dataDictionary}       ###""" This will not select paygroup."""###
    HRMS_Keywords.Submit Marked Attendance
    HRMS_Keywords.Apply Filters For Marked Attendance
    HRMS_Keywords.Verify Marked Attendance  ${dataDictionary["Filters"]}
    HRMS_Keywords.Approve Marked Attendance

Process And Lock Salary
    [Documentation]  Processes and locks Salary.
    [Tags]  HRMS  Salary  salaryprocess  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Detail_Process"]}
    HRMS_Keywords.Open Salary Detail Page
    HRMS_Keywords.Process Salary  ${dataDictionary}
    HRMS_Keywords.Open Salary Detail Page
    HRMS_Keywords.Lock Salary  ${dataDictionary["Filters"]}

Add Paybill
    [Documentation]  Fills details in add paybill form, verifies and approves it.
    [Tags]  HRMS  Salary  Addpaybill  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Paybill"]}
    HRMS_Keywords.Open Salary Paybill Page
    HRMS_Keywords.Add Salary Paybill  ${dataDictionary}
    #HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}
    HRMS_Keywords.Approve Salary Paybill  ${dataDictionary}

Disburse Paybill
    [Documentation]  Adds Disbursment, verifies and approves disbursement.
    [Tags]  HRMS  Salary  AddDisbursement  createdata
    Common_Keywords.Set Test Data  ${configData["Salary Disbursement Process"]}
    HRMS_Keywords.Open Salary Disbursment Page
    HRMS_Keywords.Add Disbursement  ${dataDictionary}
    HRMS_Keywords.Approve Salary Disbursement  ${dataDictionary}
    HRMS_Keywords.Create Voucher  ${dataDictionary}





