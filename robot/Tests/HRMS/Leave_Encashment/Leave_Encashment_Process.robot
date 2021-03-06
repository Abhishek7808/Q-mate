*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot
#Resource          ${RESOURCES}/Leave_encash.robot


*** Variables ***
#robot -d robot/Results --variable BROWSER:chrome --variable ENVIRONMENT:stg --variable LOGIN:stg -i adminANDleaveencashANDpaybill robot/Tests

########## RUN THIS CMD TO EXCECUTE COMPLETE LEAVE ENCASHMENT PROCESS ############
#robot -i admin  robot\Tests\HRMS\Leave_Encashment\

${EMPLOYEEID}  21971                    ####Change the Employee_ID and EmployeeCode each time you run the case
${EMPLOYEECODE}  21971
${EMPLOYEELOCATION}  Head Office
${PAYGROUP}  RSMML CO Paybill

#${EMPLOYEEID}  no5149
#${EMPLOYEECODE}  no5149
#${EMPLOYEELOCATION}  ......ACOS, Bharatpur (ACOS, BPR)
#${PAYGROUP}  ACOS, Bharatpur Ministerial Staff

*** Test Cases ***
Employee should able to apply leave encashment
    [Documentation]  Imperosnates an employee.
    [Tags]  HRMS  employee  LeaveEncash
    HRMS_Keywords.Open Manage User Page
    HRMS_Keywords.Impersonate into employee ID  ${EMPLOYEEID}           ###""" Employee code is required and can be given from command line or can be set in the variables section written above. """
    HRMS_Keywords.Encash Privilege Leave
    HRMS_Keywords.Do Logout Impersonate

Admin should able to apply leave encashment
    [Documentation]  Fills leave encashment form from admin side
    [Tags]  HRMS  admin  LeaveEncash  apply
    Common_Keywords.Set Test Data  ${configData["Leave_Encashment_Admin"]}
    HRMS_Keywords.Open Leave Encashment Page
    HRMS_Keywords.Add Leave Encashment  ${dataDictionary}  ${EMPLOYEECODE}
    HRMS_Keywords.Open Leave Encashment Page
    #HRMS_Keywords.Verify Leave Encashment Entry  ${EMPLOYEECODE}

Admin should able to add leave encashment proposal
    [Documentation]  Fills leave encashment proposal details
    [Tags]  HRMS  admin  LeaveEncash  proposal
    Common_Keywords.Set Test Data  ${configData["Encash_Proposal"]}
    HRMS_Keywords.Open Leave Encashment Proposal Page
    ###""" Paygroup amd Employee Location are required and can be given from command line or can be set in the variables section written above. """
    HRMS_Keywords.Add Leave Encashment Proposal  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}

Admin should able to approve leave encashment proposal
    [Documentation]  Approves proposal and issues order.
    [Tags]  HRMS  admin  LeaveEncash  approve
    HRMS_Keywords.Open Leave Encashment Proposal Approval Page
    HRMS_Keywords.Select Leave Encashment Filters  ${EMPLOYEELOCATION}
    HRMS_Keywords.Issue Order For Leave Encashment Proposal

Admin should able to process and lock leave encashment
    [Documentation]  Processes leave encashment proposal.
    [Tags]  HRMS  admin  leaveEncash  process
    Common_Keywords.Set Test Data  ${configData["Leave_Encashment_Process"]}
    HRMS_Keywords.Open Leave Encashment Process Page
    HRMS_Keywords.Process Leave Encashment  ${currentFinancialYear}  ${currentMonth}  ${EMPLOYEELOCATION}  ${PAYGROUP}
    HRMS_Keywords.Open Leave Encashment Process Page
    HRMS_Keywords.Check LE Request Status
    HRMS_Keywords.Lock Leave Encshment

Admin should able to add paybill
    [Documentation]  Fills details into paybill form, verifies and approves it.
    [Tags]  HRMS  admin  leaveEncash  paybill
    Common_Keywords.Set Test Data  ${configData["Leave_Encashment_Paybill"]}
    Log Many    ${dataDictionary}   console=yes
    HRMS_Keywords.Open Leave Encashment Paybill Page
    HRMS_Keywords.Add Leave Encashment Paybill
    HRMS_Keywords.Set Filters For LE Paybill  ${dataDictionary}    Pending
    HRMS_Keywords.Approve LE Paybill   ${dataDictionary}
    HRMS_Keywords.Verify LE Approved Paybill    ${dataDictionary}

Admin should able to Disburse Paybill
    [Documentation]  Adds Disbursment, verifies and approves disbursement.
    [Tags]  HRMS  admin  LeaveEncash  Disbursment
    Common_Keywords.Set Test Data  ${configData["Leave Encash Disbursement Process"]}
    HRMS_Keywords.Open LE Disbursment Page
    HRMS_Keywords.LE Add Disbursement  ${dataDictionary}
    HRMS_Keywords.Approve LE Disbursement  ${dataDictionary}
    HRMS_Keywords.Create LE Voucher  ${dataDictionary}