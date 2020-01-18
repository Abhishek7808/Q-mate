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

User should be able to configure self verification details
    [Documentation]  Configures self varification details
    [Tags]  selfvarification
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EMPSELFVERIFICATION/SelfVerificationConfiguration
    set test variable  ${formField}  ${configData["Self Verification Configuration"]}
    FillFields.Input Value Into Field  ${formField["Raise Self Verification Popup"]}  ${formField["Raise Self Verification Popup"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is Self Verification Mandatory"]}  ${formField["Is Self Verification Mandatory"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Send SMS Notification"]}  ${formField["Send SMS Notification"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Send Email Notification"]}  ${formField["Send Email Notification"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enable Self Verification of Enrollment Detail"]}  ${formField["Enable Self Verification of Enrollment Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enable Self Verification of Personal Detail"]}  ${formField["Enable Self Verification of Personal Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enable Self Verification of Official Detail"]}  ${formField["Enable Self Verification of Official Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enable Self Verification of Salary Detail"]}  ${formField["Enable Self Verification of Salary Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enable Self Verification of Other Detail"]}  ${formField["Enable Self Verification of Other Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enable Self Verification of Nominee Detail"]}  ${formField["Enable Self Verification of Nominee Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}

User should be able to add new division
    [Documentation]  Adds a new division
    [Tags]  division  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    set test variable  ${formField}  ${configData["Division"]}
    FillFields.Input Value Into Field  ${formField["Add New Division"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Division Entry  ${formField}

User should be able to edit division
    [Documentation]  Edits the division details
    [Tags]  division  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    set test variable  ${formField}  ${configData["Edit Division"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Division Entry  ${formField}

User should be able to delete division
    [Documentation]  deletes the division from the table
    [Tags]  division  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    set test variable  ${formField}  ${configData["Edit Division"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    page should contain   Do you really want to Delete this Division ??
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Division Deletion  ${formField}

User should be able to add new designation
    [Documentation]  Adds a new designation
    [Tags]  designation  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation/AddEditDesignationDetails
    set test variable  ${formField}  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Post"]}  ${formField["Post"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is Fourth Class"]}  ${formField["Is Fourth Class"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Designation Entry  ${formField}

User should be able to edit designation
    [Documentation]  Edits designation details
    [Tags]  designation  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation
    set test variable  ${formField}  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Designation"]}  ${formField["Select Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Designation"]["Name"]}  ${formField["Edit Designation"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Designation"]["Post"]}  ${formField["Edit Designation"]["Post"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Designation"]["Is Fourth Class"]}  ${formField["Edit Designation"]["Is Fourth Class"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Designation Entry  ${formField}

User should be able to delete designation
    [Documentation]  Deletes designation
    [Tags]  designation  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation
    set test variable  ${formField}  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${formField["Edit Designation"]["Search box"]}  ${formField["Edit Designation"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Designation"]}  ${formField["Select Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    FillFields.Input Value Into Field  ${formField["Ok"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    HRMS_Keywords.Verify Designation Deletion  ${formField}