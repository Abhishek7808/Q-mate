*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot
Library           ${LIBRARY}/Addendums.py
Library           DateTime

*** Variables ***
${SALARYFINANCIALYEAR}  None           #20172018
${SALARYCYCLE}  None          #58
${NUMBER_OF_EMPLOYEES}  ${1}
${PAYGROUP}  select
${PAYMENTUNIT}  Head Office
${PAYSLIPUNIT}  head office
${DESIGNATION}  None
${DIVISION}  None
${ISGAZETTED}  None
@{DISBURSEMENT_PAYGROUPS}    Select all
@{DISBURSEMENT_PAYBILLS}    1021/2019-2020
${latestPaybillCreated}  1021/2019-2020
${EMPLOYEELOCATION}  Select all

###""" robot -d robot/Results --variable BROWSER:chrome --variable ENVIRONMENT:stg --variable LOGIN:stg --variable PAYGROUP:"" --variable FINANCIALYEAR:"" --variable SALARYCYCLE:"" -i salarycheck robot/Tests.
###""" If financial year and salary cycle are not given by user then current financial year and salary cycle will be chosen. """

*** Test Cases ***
Admin should able to mark attendance of the employees
    [Documentation]  Makrs attendance of the top most listed employee of the given paygroup.
    [Tags]  HRMS  salarycheck  markattendancecheck
    Common_Keywords.Set Test Data  ${configData["Mark_Attendance"]}
    HRMS_Keywords.Open Manual Attendance Page
    HRMS_Keywords.Set Mark Attendance Criteria  ${dataDictionary}  ${PAYGROUP}
    HRMS_Keywords.Mark Attendance Of One Employee  ${dataDictionary}
    HRMS_Keywords.Apply Filters For Marked Attendance  Submitted  ${PAYGROUP}
    HRMS_Keywords.Verify Marked Attendance  ${dataDictionary["Filters"]}  ${PAYGROUP}
    HRMS_Keywords.Apply Filters For Marked Attendance  Verified  ${PAYGROUP}
    HRMS_Keywords.Approve Marked Attendance  ${PAYGROUP}

Admin should able to process and lock his salary of the employee
    [Documentation]  Processes and locks salary of the given paygroup.
    [Tags]  HRMS  salarycheck  salaryprocesscheck  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Detail_Process"]}
    HRMS_Keywords.Open Salary Detail Page
    HRMS_Keywords.Process Salary  ${dataDictionary}  ${PAYGROUP}
    HRMS_Keywords.View Salary Slip  ${dataDictionary["Filters"]}
    HRMS_Keywords.Open Salary Detail Page
    HRMS_Keywords.Search Employee
    HRMS_Keywords.Lock Salary  ${dataDictionary["Filters"]}  ${PAYGROUP}

Admin should able to add salary paybill
    [Documentation]  Fills details in add paybill form, verifies and approves it.
    [Tags]  HRMS  salarycheck  Addpaybillcheck  createdata
    Common_Keywords.Set Test Data  ${configData["Salary_Paybill"]}
    HRMS_Keywords.Open Salary Paybill Page
    HRMS_Keywords.Add Salary Paybill  ${dataDictionary}
    HRMS_Keywords.Approve Salary Paybill  ${dataDictionary}

Admin should able to add salary disbursement
    [Documentation]  Adds Disbursment, verifies and approves disbursement.
    [Tags]  HRMS  salarycheck  AddDisbursementcheck  createdata
    Common_Keywords.Set Test Data  ${configData["Salary Disbursement Process"]}
    HRMS_Keywords.Open Salary Disbursment Page
    sleep   3s
    HRMS_Keywords.Add Disbursement  ${dataDictionary}
    HRMS_Keywords.Approve Salary Disbursement  ${dataDictionary}
    HRMS_Keywords.Create Voucher  ${dataDictionary}