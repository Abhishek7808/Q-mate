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
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Designation Deletion  ${formField}

User should be able to add new hospital empanelment
    [Documentation]  Adds a new hospital empanelment
    [Tags]  hospitalempanelment  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    set test variable  ${formField}  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is Exempted"]}  ${formField["Is Exempted"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Address"]}  ${formField["Address"]["Value"]}
    FillFields.Input Value Into Field  ${formField["State"]}  ${formField["State"]["Value"]}
    FillFields.Input Value Into Field  ${formField["City"]}  ${formField["City"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Contact No"]}  ${formField["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Alternate Contact No"]}  ${formField["Alternate Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Discount Rate"]}  ${formField["Discount Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Last Validate"]}  ${formField["Last Validate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Category"]}  ${formField["Category"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${formField}

User should be able to edit hospital empanelment
    [Documentation]  Edit hospital empanelment
    [Tags]  hospitalempanelment  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    set test variable  ${formField}  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Name"]}  ${formField["Edit Hospital Empanelment"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Type"]}  ${formField["Edit Hospital Empanelment"]["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Is Exempted"]}  ${formField["Edit Hospital Empanelment"]["Is Exempted"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Address"]}  ${formField["Edit Hospital Empanelment"]["Address"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["State"]}  ${formField["Edit Hospital Empanelment"]["State"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["City"]}  ${formField["Edit Hospital Empanelment"]["City"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Contact No"]}  ${formField["Edit Hospital Empanelment"]["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Alternate Contact No"]}  ${formField["Edit Hospital Empanelment"]["Alternate Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Discount Rate"]}  ${formField["Edit Hospital Empanelment"]["Discount Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Last Validate"]}  ${formField["Edit Hospital Empanelment"]["Last Validate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Category"]}  ${formField["Edit Hospital Empanelment"]["Category"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${formField}

User should be able to delete hospital empanelment
    [Documentation]  Deletes hospital empanelment
    [Tags]  hospitalempanelment  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    set test variable  ${formField}  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Search box"]}  ${formField["Edit Hospital Empanelment"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Designation Deletion  ${formField}

User should be able to add new qualification
    [Documentation]  Adds a new qualification
    [Tags]  qualification  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/QualificationMaster
    set test variable  ${formField}  ${configData["Qualification"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Qualification Name"]}  ${formField["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is professional"]}  ${formField["Is professional"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Qualification Entry  ${formField}

User should be able to edit qualification
    [Documentation]  edits qualification details
    [Tags]  qualification  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/QualificationMaster
    set test variable  ${formField}  ${configData["Qualification"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Qualification"]["Qualification Name"]}  ${formField["Edit Qualification"]["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Qualification"]["Is professional"]}  ${formField["Edit Qualification"]["Is professional"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Qualification Entry  ${formField}

User should be able to add new empanelled officer
    [Documentation]  Adds a new empanelled officer
    [Tags]  empanelledofficer  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryPanelImpanelment/EmpanelledIndex
    set test variable  ${formField}  ${configData["Empanelled Officer"]}
    FillFields.Input Value Into Field  ${formField["Add New Entry"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Contact No."]}  ${formField["Contact No."]["Value"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Effective Till Date"]}  ${formField["Effective Till Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Department"]}  ${formField["Department"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Designation"]}  ${formField["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Empanelled Officer Entry  ${formField}

User should be able to edit new empanelled officer
    [Documentation]  Edits empanelled officer details
    [Tags]  empanelledofficer  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryPanelImpanelment/EmpanelledIndex
    set test variable  ${formField}  ${configData["Empanelled Officer"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Empanelled Officer"]["Name"]}  ${formField["Edit Empanelled Officer"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Empanelled Officer"]["Contact No."]}  ${formField["Edit Empanelled Officer"]["Contact No."]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Empanelled Officer"]["Effective Date"]}  ${formField["Edit Empanelled Officer"]["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Empanelled Officer"]["Effective Till Date"]}  ${formField["Edit Empanelled Officer"]["Effective Till Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Empanelled Officer"]["Department"]}  ${formField["Edit Empanelled Officer"]["Department"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Empanelled Officer"]["Designation"]}  ${formField["Edit Empanelled Officer"]["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Empanelled Officer Entry  ${formField}

User should be able to add new cadre detail
    [Documentation]  Adds a new cadre
    [Tags]  cadredetail  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    set test variable  ${formField}  ${configData["Cadre Details"]}
    FillFields.Input Value Into Field  ${formField["Add Cadre"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Order By"]}  ${formField["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Cadre Detail Entry  ${formField}

User should be able to edit cadre detail
    [Documentation]  Edits cadre details
    [Tags]  cadredetail  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    set test variable  ${formField}  ${configData["Cadre Details"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Cadre Detail"]["Name"]}  ${formField["Edit Cadre Detail"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Cadre Detail"]["Order By"]}  ${formField["Edit Cadre Detail"]["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Cadre Detail Entry  ${formField["Edit Cadre Detail"]}

User should be able to delete cadre detail
    [Documentation]  Deletes cadre detail
    [Tags]  cadredetail  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    set test variable  ${formField}  ${configData["Cadre Details"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Cadre Detail"]}  ${formField["Select Cadre Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Designation Deletion  ${formField["Edit Cadre Detail"]}

User should be able to add Payment Type
    [Documentation]  Adds a new Payment Type
    [Tags]  PaymentType  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    set test variable  ${formField}  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Add Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Description"]}  ${formField["Description"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Payment Type Entry  ${formField}

User should be able to edit Payment Type
    [Documentation]  Edits Payment Type details
    [Tags]  PaymentType  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    set test variable  ${formField}  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Payment Type"]["Description"]}  ${formField["Edit Payment Type"]["Description"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Payment Type Entry  ${formField["Edit Payment Type"]}

User should be able to delete Payment Type
    [Documentation]  Deletes Payment Type
    [Tags]  PaymentType  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    set test variable  ${formField}  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Edit Payment Type"]["Search box"]}  ${formField["Edit Payment Type"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Payment Type"]}  ${formField["Select Payment Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Designation Deletion  ${formField["Edit Payment Type"]}

User should be able to add new Department
    [Documentation]  Adds a new Department
    [Tags]  department  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    set test variable  ${formField}  ${configData["Department"]}
    FillFields.Input Value Into Field  ${formField["Add"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Department Entry  ${formField}

User should be able to edit Department
    [Documentation]  Edits Department details
    [Tags]  department  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    set test variable  ${formField}  ${configData["Department"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    sleep  3s
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Department"]["Description"]}  ${formField["Edit Department"]["Description"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Department Entry  ${formField["Edit Department"]}

User should be able to delete Department
    [Documentation]  Deletes Department
    [Tags]  Department  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    set test variable  ${formField}  ${configData["Department"]}
    FillFields.Input Value Into Field  ${formField["Edit Department"]["Search box"]}  ${formField["Edit Department"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Department Deletion  ${formField["Edit Department"]}

User should be able to add new section details
    [Documentation]  Adds a new section
    [Tags]  section  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    set test variable  ${formField}  ${configData["Section"]}
    FillFields.Input Value Into Field  ${formField["Add Section"]}
    FillFields.Input Value Into Field  ${formField["Department"]}  ${formField["Department"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Code"]}  ${formField["Code"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Order By"]}  ${formField["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is Active"]}  ${formField["Is Active"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Section Entry  ${formField}

User should be able to add edit section details
    [Documentation]  Edits section details
    [Tags]  section  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    set test variable  ${formField}  ${configData["Section"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Department"]}  ${formField["Edit Section"]["Department"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Name"]}  ${formField["Edit Section"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Code"]}  ${formField["Edit Section"]["Code"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Order By"]}  ${formField["Edit Section"]["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Is Active"]}  ${formField["Edit Section"]["Is Active"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    HRMS_Keywords.Verify Section Entry  ${formField["Edit Section"]}

User should be able to delete section
    [Documentation]  Deletes section
    [Tags]  section  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    set test variable  ${formField}  ${configData["Section"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Search box"]}  ${formField["Edit Section"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Section"]}  ${formField["Select Section"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Section Deletion  ${formField["Edit Section"]}

User should be able to add new TA/DA grade
    [Documentation]  Adds a new TA/DA grade
    [Tags]  TADAgrade  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    set test variable  ${formField}  ${configData["TA/DA Grade"]}
    FillFields.Input Value Into Field  ${formField["Add New Grade"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${formField["Grade"]}  ${formField["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Effective From"]}  ${formField["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Basic Pay Min Range"]}  ${formField["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Basic Pay Max Range"]}  ${formField["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${formField["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${formField["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${formField["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${formField["Level Number"]}  ${formField["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Designaton"]}  ${formField["Designaton"]["Value"]}
    click element  ${formField["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    Common_Keywords.Switch TAB
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA grade Entry  ${formField}

User should be able to edit TA/DA grade
    [Documentation]  Edits TA/DA grade details
    [Tags]  TADAgrade  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    set test variable  ${formField}  ${configData["TA/DA Grade"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Grade"]["Effective From"]}  ${formField["Edit TA/DA Grade"]["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Grade"]["Basic Pay Min Range"]}  ${formField["Edit TA/DA Grade"]["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Grade"]["Basic Pay Max Range"]}  ${formField["Edit TA/DA Grade"]["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${formField["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${formField["Edit TA/DA Grade"]["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${formField["Edit TA/DA Grade"]["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Grade"]["Level Number"]}  ${formField["Edit TA/DA Grade"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Grade"]["Designaton"]}  ${formField["Edit TA/DA Grade"]["Designaton"]["Value"]}
    click element  ${formField["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    reload page
    wait until element is visible  BtnSearchfilter  10s
    HRMS_Keywords.Verify TA/DA grade Entry  ${formField}

User should be able to delete TA/DA grade
    [Documentation]  Deletes TA/DA grade
    [Tags]  TADAgrade  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    set test variable  ${formField}  ${configData["TA/DA Grade"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    press keys  //button[@class='btn btn-primary']  ENTER

User should be able to revised TA/DA grade
    [Documentation]  Revises TA/DA grade details
    [Tags]  TADAgrade  revisedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    set test variable  ${formField}  ${configData["TA/DA Grade"]}
    FillFields.Input Value Into Field  ${formField["Add New Grade"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${formField["Grade"]}  ${formField["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Effective From"]}  ${formField["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Basic Pay Min Range"]}  ${formField["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Basic Pay Max Range"]}  ${formField["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${formField["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${formField["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${formField["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${formField["Level Number"]}  ${formField["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Designaton"]}  ${formField["Designaton"]["Value"]}
    click element  ${formField["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    Common_Keywords.Switch TAB
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA grade Entry  ${formField}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Revise"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${formField["Revised Effective From"]}  ${formField["Revised Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Basic Pay Min Range"]}  ${formField["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Basic Pay Max Range"]}  ${formField["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${formField["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${formField["Edit TA/DA Grade"]["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${formField["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Grade"]["Level Number"]}  ${formField["Edit TA/DA Grade"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Designaton"]}  ${formField["Designaton"]["Value"]}
    click element  ${formField["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    Common_Keywords.Switch TAB
    sleep  3s
    reload page
    wait until element is visible  BtnSearchfilter  10s
    HRMS_Keywords.Verify TA/DA grade Entry  ${formField}

User should be able to add new grade dependancy
    [Documentation]  Creates new grade dependancy
    [Tags]  gradedependancy  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/tadagraderrule/TaDaDependencyGrid
    set test variable  ${formField}  ${configData["Grade Dependency"]}
    Common_Keywords.Show Maximum Entries on Page
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    log to console  ${lastGradeDate}
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    log to console  ${day}-${month}-${year}
    ${intday}  convert to integer  ${day}
    ${day}  run keyword if  ${intday}<10  remove string  ${day}  0  ELSE  set variable  ${day}
    ${day}  convert to integer  ${day}
    ${day}  set variable  ${day+1}
    FillFields.Input Value Into Field  ${formField["Add New Dependancy"]}
    set to dictionary  ${formField["Effective From"]["Value"]}  Day=${day}  Month=${month}  Year=${year}
    FillFields.Input Value Into Field  ${formField["Effective From"]}  ${formField["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Basic Pay"]}  ${formField["TA/DA Grade depends on"]["Basic Pay"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Pay Scale"]}  ${formField["TA/DA Grade depends on"]["Pay Scale"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Level Number"]}  ${formField["TA/DA Grade depends on"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Designation"]}  ${formField["TA/DA Grade depends on"]["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Save"]}
    HRMS_Keywords.Verify Grade Dependancy Entry  ${formField}
    sleep  3s

User should be able to edit grade dependancy
    [Documentation]  Edits grade dependancy
    [Tags]  gradedependancy  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/tadagraderrule/TaDaDependencyGrid
    set test variable  ${formField}  ${configData["Grade Dependency"]}
    Common_Keywords.Show Maximum Entries on Page
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    log to console  ${lastGradeDate}
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    log to console  ${day}-${month}-${year}
    ${intday}  convert to integer  ${day}
    ${day}  run keyword if  ${intday}<10  remove string  ${day}  0  ELSE  set variable  ${day}
    ${day}  convert to integer  ${day}
    ${day}  set variable  ${day+1}
    set to dictionary  ${formField["Effective From"]["Value"]}  Day=${day}  Month=${month}  Year=${year}
    set to dictionary  ${formField["Edit"]}  Locator=//td[contains(text(),'${lastGradeDate}')]/following-sibling::td//i[@class='fa fa-pencil']
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Effective From"]}  ${formField["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Basic Pay"]}  ${formField["TA/DA Grade depends on"]["Basic Pay"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Pay Scale"]}  ${formField["TA/DA Grade depends on"]["Pay Scale"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Level Number"]}  ${formField["TA/DA Grade depends on"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Designation"]}  ${formField["TA/DA Grade depends on"]["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["TA/DA Grade depends on"]["Save"]}
    HRMS_Keywords.Verify Grade Dependancy Entry  ${formField}
    sleep  3s

User should be able to delete grade dependancy
    [Documentation]  Deletes grade dependancy
    [Tags]  gradedependancy  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/tadagraderrule/TaDaDependencyGrid
    set test variable  ${formField}  ${configData["Grade Dependency"]}
    Common_Keywords.Show Maximum Entries on Page
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    set to dictionary  ${formField["Delete"]}  Locator=//td[contains(text(),'${lastGradeDate}')]/following-sibling::td//i[@class='fa fa-trash-o']
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Grade Dependancy Deletion  ${formField}

User should be able to add new TA/DA rule
    [Documentation]  Adds a new TA/DA rule, This test needs grade dependancy test to be executed.
    [Tags]  TADArule  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/TadaRule
    set test variable  ${formField}  ${configData["TA/DA Rule"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Unit"]}  ${formField["Unit"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Allowance Type"]}  ${formField["Allowance Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Effective From"]}  ${formField["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Grade"]}  ${formField["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rule"]}  ${formField["Rule"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Travel Mode"]}  ${formField["Travel Mode"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Travel Class"]}  ${formField["Travel Class"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Mileage Allowance"]}  ${formField["Mileage Allowance"]["Value"]}
    FillFields.Input Value Into Field  ${formField["City"]}  ${formField["City"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Amount"]}  ${formField["Amount"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA Rule Entry  ${formField}

User should be able to add Edit TA/DA rule
    [Documentation]  Edits a new TA/DA rule, This test needs grade dependancy test to be executed.
    [Tags]  TADArule  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/TadaRule
    set test variable  ${formField}  ${configData["TA/DA Rule"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Unit"]}  ${formField["Edit TA/DA Rule"]["Unit"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Allowance Type"]}  ${formField["Edit TA/DA Rule"]["Allowance Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Effective From"]}  ${formField["Edit TA/DA Rule"]["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Grade"]}  ${formField["Edit TA/DA Rule"]["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Rule"]}  ${formField["Edit TA/DA Rule"]["Rule"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Travel Mode"]}  ${formField["Edit TA/DA Rule"]["Travel Mode"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Travel Class"]}  ${formField["Edit TA/DA Rule"]["Travel Class"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Mileage Allowance"]}  ${formField["Edit TA/DA Rule"]["Mileage Allowance"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["City"]}  ${formField["Edit TA/DA Rule"]["City"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit TA/DA Rule"]["Amount"]}  ${formField["Edit TA/DA Rule"]["Amount"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA Rule Entry  ${formField["Edit TA/DA Rule"]}

User should be able to delete TA/DA rule
    [Documentation]  Deletes TA/DA rule
    [Tags]  TADArule  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/TadaRule
    set test variable  ${formField}  ${configData["TA/DA Rule"]}
    Common_Keywords.Show Maximum Entries on Page
#    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify TA/DA Rule Deletion  ${formField["Edit TA/DA Rule"]}




#    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Search button"]}
#    FillFields.Input Value Into Field  ${formField["Edit"]}
#    FillFields.Input Value Into Field  ${formField["Edit Section"]["Department"]}  ${formField["Edit Section"]["Department"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Edit Section"]["Name"]}  ${formField["Edit Section"]["Name"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Edit Section"]["Code"]}  ${formField["Edit Section"]["Code"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Edit Section"]["Order By"]}  ${formField["Edit Section"]["Order By"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Edit Section"]["Is Active"]}  ${formField["Edit Section"]["Is Active"]["Value"]}
#    FillFields.Input Value Into Field  ${formField["Save"]}
#    wait until page contains element  SearchText
#    HRMS_Keywords.Verify Section Entry  ${formField["Edit Section"]}