*** Settings ***
Documentation    Suite description
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot
#Resource          ${RESOURCES}/Leave_encash.robot


*** Variables ***
${EMPLOYEEID}  jvvnl.28981
${EMPLOYEENAME}  xyz

*** Test Cases ***
Employee should able to apply leave encashment
    [Documentation]  Imperosnates an employee.
    [Tags]  HRMS  employee  LeaveEncash
    HRMS_Keywords.Open Manage User Page
    HRMS_Keywords.Impersonate into employee ID  ${EMPLOYEEID}
    HRMS_Keywords.Encash Privilege Leave

Admin should able to apply leave encashment
    [Documentation]  Fills leave encashment form from admin side
    [Tags]  HRMS  admin  LeaveEncash  apply
    Common_Keywords.Set Test Data  ${configData["Leave_Encashment_Admin"]}
    HRMS_Keywords.Open Leave Encashment Page
    HRMS_Keywords.Add Leave Encashment  ${dataDictionary}  ${EMPLOYEENAME}
    HRMS_Keywords.Open Leave Encashment Page
    HRMS_Keywords.Verify Leave Encashment Entry

Admin should able to add leave encashment proposal
    [Documentation]  Fills leave encashment proposal details
    [Tags]  HRMS  admin  LeaveEncash
    Common_Keywords.Set Test Data  ${configData["Encash_Proposal"]}
    HRMS_Keywords.Open Leave Encashment Proposal Page
    HRMS_Keywords.Add Leave Encashment Proposal  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}

Admin should able to approve leave encashment proposal
    [Documentation]  Approves proposal and issues order.
    [Tags]  HRMS  admin  LeaveEncash
    HRMS_Keywords.Open Leave Encashment Proposal Approval Page
    HRMS_Keywords.Select Leave Encashment Filters  ${EMPLOYEELOATION}
    HRMS_Keywords.Issue Order For Leave Encashment Proposal

