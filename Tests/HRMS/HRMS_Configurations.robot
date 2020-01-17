*** Settings ***
Resource          ../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot

*** Variables ***
${HRMSconfigurations}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
User should be able to declare tea rate definition
    [Documentation]  Fills the tea rate definition form and save it.
    [Tags]  tearatedefinition  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    FillFields.Input Value Into Field  ${formField["Declare"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField}

User should be able to edit tea rate definition
    [Documentation]  Edits the tea rate definition details and save them.
    [Tags]  tearatedefinition  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    set test variable  ${formField}  ${configData["Tea Rate Definition Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Button"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField}

User should be able to delete tea rate definition
    [Documentation]  Deletes the tea rate definition entry from the table.
    [Tags]  tearatedefinition  delete
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    set test variable  ${formField}  ${configData["Tea Rate Definition Edit"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    page should contain  Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Tea Rate Deletion  ${formField}

User should be able to add new enquiry decision type
    [Documentation]  Fills the enquiry decision type form and save it.
    [Tags]  enquirydecisiontype  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryDecision
    set test variable  ${formField}  ${configData["Enquiry Decision Type"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Decision Name"]}  ${formField["Decision Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enquiry Type"]}  ${formField["Enquiry Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Impact On"]}  ${formField["Impact On"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Enquiry Decision Type Creation  ${formField}
    sleep  5s

User should be able to edit enquiry decision type
    [Documentation]  Pending because there is an exception on the page
    [Tags]  enquirydecisiontype  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryDecision
    set test variable  ${formField}  ${configData["Enquiry Decision Type Edit"]}
    Common_Keywords.Show Maximum Entries on Page
    sleep  4s
    FillFields.Input Value Into Field  ${formField["Edit Button"]}
    FillFields.Input Value Into Field  ${formField["Decision Name"]}  ${formField["Decision Name"]["Value"]}
    sleep  5s
    FillFields.Input Value Into Field  ${formField["Enquiry Type"]}  ${formField["Enquiry Type"]["Value"]}
    sleep  5s
    FillFields.Input Value Into Field  ${formField["Impact On"]}  ${formField["Impact On"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Enquiry Decision Type Updatation  ${formField}
    sleep  5s

User should be able to delete enquiry decision type
    [Documentation]  Deletes the enquiry decision type entry from the table.
    [Tags]  enquirydecisiontype  delete
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryDecision
    set test variable  ${formField}  ${configData["Enquiry Decision Type Edit"]}
    Common_Keywords.Show Maximum Entries on Page
    sleep  4s
    FillFields.Input Value Into Field  ${formField["Delete Button"]}
    page should contain  Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Enquiry Decision Type Deletion  ${formField}
    sleep  5s

User should be abele to create post class
    [Documentation]  Creates new post class
    [Tags]  postclass  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
    set test variable  ${formField}  ${configData["Post Class"]}
    FillFields.Input Value Into Field  ${formField["Add New Post Class"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Class Group"]}  ${formField["Class Group"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Seniority Level"]}  ${formField["Seniority Level"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Post Class Creation  ${formField}
    sleep  5s

User should be able to update post class
    [Documentation]  Edits the details of post class
    [Tags]  postclass  updatedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
    set test variable  ${formField}  ${configData["Post Class Update"]}
    FillFields.Input Value Into Field  ${formField["Update"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Class Group"]}  ${formField["Class Group"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Seniority Level"]}  ${formField["Seniority Level"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Post Class Creation  ${formField}

User should be able to delete post class
    [Documentation]  deletes the post class.
    [Tags]  postclass  delete
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
    set test variable  ${formField}  ${configData["Post Class"]}
    FillFields.Input Value Into Field  ${formField["Delete Post Class"]}
    sleep  2s
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Post Class deletion  ${formField}
    sleep  5s

User should be able to add new deputation department
    [Documentation]  Fills the deputation department form
    [Tags]  deputationdepartment  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/DeputationDepartment
    set test variable  ${formField}  ${configData["Deputation Department"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Governing Authorities"]}  ${formField["Governing Authorities"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Address"]}  ${formField["Address"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Email"]}  ${formField["Email"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Contact No"]}  ${formField["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["State"]}  ${formField["State"]["Value"]}
    FillFields.Input Value Into Field  ${formField["City"]}  ${formField["City"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Deputation Department Creation  ${formField}

User should be able to edit deputation department
    [Documentation]  Edits the deputation department form
    [Tags]  deputationdepartment  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/DeputationDepartment
    set test variable  ${formField}  ${configData["Deputation Department Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Governing Authorities"]}  ${formField["Governing Authorities"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Address"]}  ${formField["Address"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Email"]}  ${formField["Email"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Contact No"]}  ${formField["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["State"]}  ${formField["State"]["Value"]}
    FillFields.Input Value Into Field  ${formField["City"]}  ${formField["City"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Deputation Department Updation  ${formField}

User should be able to delete deputation department
    [Documentation]  Edits the deputation department form
    [Tags]  deputationdepartment  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/DeputationDepartment
    set test variable  ${formField}  ${configData["Deputation Department Edit"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    page should contain  Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Deputation Department Deletion  ${formField}

User should be able to configure pay slip
    [Documentation]  Configures different details for pay slip
    [Tags]  payslipconfiguration
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Common/PaySlipConfiguration
    set test variable  ${formField}  ${configData["Pay Slip Configuration"]}
    FillFields.Input Value Into Field  ${formField["Page/View Name"]["Selected Values"]}  ${formField["Page/View Name"]["Selected Values"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Other Details"]["Show/Hide"]}  ${formField["Show Other Details"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Other Details"]["Selected Values"]}  ${formField["Show Other Details"]["Selected Values"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Net Payable In Words"]["Show/Hide"]}  ${formField["Show Net Payable In Words"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show DDO Details"]["Show/Hide"]}  ${formField["Show DDO Details"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Birthday Message"]["Show/Hide"]}  ${formField["Show Birthday Message"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Birthday Message"]["Selected Values"]}  ${formField["Show Birthday Message"]["Selected Values"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show PF Balance"]["Show/Hide"]}  ${formField["Show PF Balance"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Net Payable Rounded Off"]["Show/Hide"]}  ${formField["Show Net Payable Rounded Off"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Gross Salary with Employer Contribution"]["Show/Hide"]}  ${formField["Show Gross Salary with Employer Contribution"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Loan Details"]["Show/Hide"]}  ${formField["Show Loan Details"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Leave Balances"]["Show/Hide"]}  ${formField["Show Leave Balances"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Leave Balances"]["Selected Values"]}  ${formField["Show Leave Balances"]["Selected Values"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show LWP Days"]["Show/Hide"]}  ${formField["Show LWP Days"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Language"]["Show/Hide"]}  ${formField["Language"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Language"]["Selected Values"]}  ${formField["Language"]["Selected Values"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Salary Annexure"]["Show/Hide"]}  ${formField["Show Salary Annexure"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Salary Annexure"]["Selected Values"]}  ${formField["Show Salary Annexure"]["Selected Values"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
