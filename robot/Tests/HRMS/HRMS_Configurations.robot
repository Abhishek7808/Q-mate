*** Settings ***
Resource          ../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot

*** Variables ***
${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
User should able to declare tea rate definition
    [Documentation]  Fills the tea rate definition form and submits it. Verifies its entry in the tea rate definition table.
    [Tags]  HRMS  tearatedefinition  createdata
    HRMS_Keywords.Open Entertainment Declaration Page
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    HRMS_Keywords.Declare Tea Rate Definition  ${formField}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField}

User should able to edit tea rate definition
    [Documentation]  Edits the tea rate definition details and submits them. Verifies its updation in tea rate definition table.
    [Tags]  HRMS  tearatedefinition  editdata
    HRMS_Keywords.Open Entertainment Declaration Page
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Search Tea Rate Definition  ${formField}
    HRMS_Keywords.Edit Tea Rate Definition  ${formField}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField["Edit Tea Rate Definition"]}

User should able to delete tea rate definition
    [Documentation]  Deletes the tea rate definition entry from the table. Verifies its deletion in tea rate definition table.
    [Tags]  HRMS  tearatedefinition  deletedata
    HRMS_Keywords.Open Entertainment Declaration Page
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Apply Tea Rate Filter  ${formField}
    HRMS_Keywords.Delete Tea Rate Definition  ${formField}
    HRMS_Keywords.Verify Tea Rate Deletion  ${formField["Edit Tea Rate Definition"]}

User should able to add new enquiry decision type
    [Documentation]  Fills the add new enquiry decision type form and submits it. Verifies its entry in enquiry decision table.
    [Tags]  HRMS  enquirydecisiontype  createdata
    HRMS_Keywords.Open Enquiry Decision Page
    set test variable  ${formField}  ${configData["Enquiry Decision Type"]}
    HRMS_Keywords.Add New Enquiry Decision Type  ${formField}
    HRMS_Keywords.Verify Enquiry Decision Type Creation  ${formField}

User should able to edit enquiry decision type
    [Documentation]  Pending because there is an exception on the page.
    [Tags]  HRMS  enquirydecisiontype  editdata
    HRMS_Keywords.Open Enquiry Decision Page
    set test variable  ${formField}  ${configData["Enquiry Decision Type"]}
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Select Enquiry Decision Type  ${formField}
    HRMS_Keywords.Edit Enquiry Decision Type  ${formField}
    HRMS_Keywords.Verify Enquiry Decision Type Updatation  ${formField}

User should able to delete enquiry decision type
    [Documentation]  Deletes the enquiry decision type entry from the table. Verifies deletion in the enquiry decision table.
    [Tags]  HRMS  enquirydecisiontype  deletedata
    HRMS_Keywords.Open Enquiry Decision Page
    set test variable  ${formField}  ${configData["Enquiry Decision Type"]}
    Common_Keywords.Show Maximum Entries on Page
    sleep  4s
    HRMS_Keywords.Select Enquiry Decision Type  ${formField}
    HRMS_Keywords.Delete Enquiry Decision Type  ${formField}
    HRMS_Keywords.Verify Enquiry Decision Type Deletion  ${formField}

User should be able to create post class
    [Documentation]  Fills the add new post class form and submits it. Verifies its entry in the post class table.
    [Tags]  HRMS  postclass  createdata
    HRMS_Keywords.Open Post Class Page
    set test variable  ${formField}  ${configData["Post Class"]}
    HRMS_Keywords.Add New Post Class  ${formField}
    HRMS_Keywords.Verify Post Class Creation  ${formField}
    sleep  5s

User should able to update post class
    [Documentation]  Edits the details of the post class. Verifies its updation in the post class table.
    [Tags]  HRMS  postclass  editdata
    HRMS_Keywords.Open Post Class Page
    set test variable  ${formField}  ${configData["Post Class"]}
    HRMS_Keywords.Filter Post Classes By Class Group  ${formField}  ${formField["Class Group"]["Value"]}
    HRMS_Keywords.Search Post Class By Name  ${formField}  ${formField["Name"]["Value"]}
    HRMS_Keywords.Update Post Class Details  ${formField}
    HRMS_Keywords.Verify Post Class Creation  ${formField}

User should able to delete post class
    [Documentation]  deletes the post class from the post class table. Verifies its deletion in the post class table.
    [Tags]  HRMS  postclass  deletedata
    HRMS_Keywords.Open Post Class Page
    set test variable  ${formField}  ${configData["Post Class"]}
    HRMS_Keywords.Filter Post Classes By Class Group  ${formField}  ${formField["Update Post Class"]["Class Group"]["Value"]}
    HRMS_Keywords.Search Post Class By Name  ${formField}  ${formField["Update Post Class"]["Name"]["Value"]}
    HRMS_Keywords.Delete Post Class  ${formField}
    HRMS_Keywords.Verify Post Class deletion  ${formField}
    sleep  5s

User should able to add new deputation department
    [Documentation]  Fills the add new deputation department form and submits it. Verifies its entry in the deputation department table.
    [Tags]  HRMS  deputationdepartment  createdata
    HRMS_Keywords.Open Deputation Department Page
    set test variable  ${formField}  ${configData["Deputation Department"]}
    HRMS_Keywords.Add New Deputation Department  ${formField}
    reload page
    HRMS_Keywords.Verify Deputation Department Creation  ${formField}

User should able to edit deputation department
    [Documentation]  Edits the deputation department details and saves them. Verifies its updation in the deputation department table.
    [Tags]  HRMS  deputationdepartment  editdata
    HRMS_Keywords.Open Deputation Department Page
    set test variable  ${formField}  ${configData["Deputation Department"]}
    HRMS_Keywords.Filter Deputation Departments  ${formField}
    HRMS_Keywords.Search Deputaion Department  ${formField}  ${formField["Name"]["Value"]}
    HRMS_Keywords.Edit Deputation Department Details  ${formField}
    reload page
    HRMS_Keywords.Verify Deputation Department Updation  ${formField}

User should able to delete deputation department
    [Documentation]  Deletes the deputation department from the deputation department table. Verifies its deletion in the deputation department table.
    [Tags]  HRMS  deputationdepartment  deletedata
    HRMS_Keywords.Open Deputation Department Page
    set test variable  ${formField}  ${configData["Deputation Department"]}
    HRMS_Keywords.Filter Deputation Departments  ${formField}  ${formField["Edit Deputation Department"]}
    HRMS_Keywords.Search Deputaion Department  ${formField}  ${formField["Edit Deputation Department"]["Name"]["Value"]}
    HRMS_Keywords.Delete Deputation Department  ${formField}  ${formField["Edit Deputation Department"]["Name"]["Value"]}
    reload page
    HRMS_Keywords.Verify Deputation Department Deletion  ${formField}

User should able to configure pay slip
    [Documentation]  Configures different details for pay slip.
    [Tags]  HRMS  payslipconfiguration
    HRMS_Keywords.Open Pay Slip Configuration Page
    set test variable  ${formField}  ${configData["Pay Slip Configuration"]}
    HRMS_Keywords.Configure Pay Slip Details  ${formField}
    HRMS_Keywords.Save Pay Slip Configurations  ${formField}

User should able to configure self verification details
    [Documentation]  Configures the self varification details.
    [Tags]  HRMS  selfvarification
    HRMS_Keywords.Open Self Verification Configuration Page
    set test variable  ${formField}  ${configData["Self Verification Configuration"]}
    HRMS_Keywords.Configure Self Varification Details  ${formField}
    HRMS_Keywords.Save Self Varification Detatils  ${formField}

User should able to add new division
    [Documentation]  Fills the add new division form and submits it. Verifies its entry in the division table.
    [Tags]  HRMS  division  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    set test variable  ${formField}  ${configData["Division"]}
    FillFields.Input Value Into Field  ${formField["Add New Division"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    reload page
    HRMS_Keywords.Verify Division Entry  ${formField}

User should able to edit division
    [Documentation]  Edits the division details and saves them. Verifies its updation in the division table.
    [Tags]  HRMS  division  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    set test variable  ${formField}  ${configData["Edit Division"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    reload page
    HRMS_Keywords.Verify Division Entry  ${formField}

User should able to delete division
    [Documentation]  deletes the division from the division table. Verifies its deletion in the division table.
    [Tags]  HRMS  division  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    set test variable  ${formField}  ${configData["Edit Division"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    page should contain   Do you really want to Delete this Division ??
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Division Deletion  ${formField}

User should able to add new designation
    [Documentation]  Fills the add new designation form and submits it. Verifies its entry in the designation table.
    [Tags]  HRMS  designation  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation/AddEditDesignationDetails
    set test variable  ${formField}  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Post"]}  ${formField["Post"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is Fourth Class"]}  ${formField["Is Fourth Class"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Designation Entry  ${formField}

User should able to edit designation
    [Documentation]  Edits the designation details and saves it. Verifies its updation in the designation table.
    [Tags]  HRMS  designation  editdata
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
    reload page
    HRMS_Keywords.Verify Designation Entry  ${formField}

User should able to delete designation
    [Documentation]  Deletes the designation from the designation table. Verifies its deletion from the designation table.
    [Tags]  HRMS  designation  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation
    set test variable  ${formField}  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${formField["Edit Designation"]["Search box"]}  ${formField["Edit Designation"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Designation"]}  ${formField["Select Designation"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Designation Deletion  ${formField}

User should able to add new hospital empanelment
    [Documentation]  Fills the add new hospital empanelment form and submits it. Verifies its entry in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  createdata
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
    reload page
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${formField}

User should able to edit hospital empanelment
    [Documentation]  Edits the hospital empanelment details and saves them. verifies its updation in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  editdata
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
    reload page
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${formField}

User should able to delete hospital empanelment
    [Documentation]  Deletes the hospital empanelment from the hospital empanelment table. Verifies its deletion in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    set test variable  ${formField}  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${formField["Edit Hospital Empanelment"]["Search box"]}  ${formField["Edit Hospital Empanelment"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Designation Deletion  ${formField}

User should able to add new qualification
    [Documentation]  Fills the add new qualification form and submits it. Verifies its entry in the qualification table.
    [Tags]  HRMS  qualification  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/QualificationMaster
    set test variable  ${formField}  ${configData["Qualification"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Qualification Name"]}  ${formField["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Is professional"]}  ${formField["Is professional"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Qualification Entry  ${formField}

User should able to edit qualification
    [Documentation]  Edits the qualification details and saves them. Verifies its updation in the qualification table.
    [Tags]  HRMS  qualification  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/QualificationMaster
    set test variable  ${formField}  ${configData["Qualification"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Qualification"]["Qualification Name"]}  ${formField["Edit Qualification"]["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Edit Qualification"]["Is professional"]}  ${formField["Edit Qualification"]["Is professional"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Qualification Entry  ${formField}


####################
# Empanelled Cases #
####################
User should able to add new empanelled officer
    [Documentation]  Fills the add new empanelled officer form and submits it. Verifies its entry in the empanelled officer table.
    [Tags]  HRMS  empanelledofficer  createdata
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
    reload page
    HRMS_Keywords.Verify Empanelled Officer Entry  ${formField}

User should able to edit new empanelled officer
    [Documentation]  Edits the empanelled officer details and saves them. Verifies its updation in the empanelled officer table.
    [Tags]  HRMS  empanelledofficer  editdata
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
    reload page
    HRMS_Keywords.Verify Empanelled Officer Entry  ${formField}

####################
# Cadre Test Cases #
####################
User should able to add new cadre detail
    [Documentation]  Fills the add new cadre detail form and submits it. Verifies its entry in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    set test variable  ${formField}  ${configData["Cadre Details"]}
    FillFields.Input Value Into Field  ${formField["Add Cadre"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Order By"]}  ${formField["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Cadre Detail Entry  ${formField}

User should able to edit cadre detail
    [Documentation]  Edits the cadre details and saves them. verifies its updation in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  editdata
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
    reload page
    HRMS_Keywords.Verify Cadre Detail Entry  ${formField["Edit Cadre Detail"]}

User should able to delete cadre detail
    [Documentation]  Deletes the cadre detail from the cadre detail table. Verifies its deletion in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    set test variable  ${formField}  ${configData["Cadre Details"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Cadre Detail"]}  ${formField["Select Cadre Detail"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Designation Deletion  ${formField["Edit Cadre Detail"]}


############################
# Payment Type Tests Cases #
############################
User should able to add Payment Type
    [Documentation]  Fills the add new Payment Type form and submits it. Verifies its entry in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    set test variable  ${formField}  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Add Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Description"]}  ${formField["Description"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Payment Type Entry  ${formField}

User should able to edit Payment Type
    [Documentation]  Edits the Payment Type details and saves them. verifies its updation in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    set test variable  ${formField}  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Payment Type"]["Description"]}  ${formField["Edit Payment Type"]["Description"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Payment Type Entry  ${formField["Edit Payment Type"]}

User should able to delete Payment Type
    [Documentation]  Deletes the Payment Type from the Payment Type table. Verifies its deletion in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    set test variable  ${formField}  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${formField["Edit Payment Type"]["Search box"]}  ${formField["Edit Payment Type"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Payment Type"]}  ${formField["Select Payment Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Payment Type Deletion  ${formField["Edit Payment Type"]}

#########################
# Department Test Cases #
#########################
User should able to add new Department
    [Documentation]  Fills the add Department form and submits it. Verifies its entry in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  department  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    set test variable  ${formField}  ${configData["Department"]}
    FillFields.Input Value Into Field  ${formField["Add"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Department Entry  ${formField}

User should able to edit Department
    [Documentation]  Edits the Department details and saves them. verifies its updation in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  department  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    set test variable  ${formField}  ${configData["Department"]}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    sleep  3s
    FillFields.Input Value Into Field  ${formField["Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Department"]["Name"]}  ${formField["Edit Department"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Department Entry  ${formField["Edit Department"]}

########################
# Section Tests Cases #
########################
# Note: Department data will be used in this form

User should able to add new section details
    [Documentation]  Fills the add new section form and submits it. Verifies its entry in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  createdata
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
    reload page
    HRMS_Keywords.Verify Section Entry  ${formField}

User should able to add edit section details
    [Documentation]  Edits the section details and saves them. verifies its updation in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  editdata
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
    reload page
    HRMS_Keywords.Verify Section Entry  ${formField["Edit Section"]}

User should able to delete section
    [Documentation]  Deletes the section from the section details table. Verifies its deletion in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    set test variable  ${formField}  ${configData["Section"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Edit Section"]["Search box"]}  ${formField["Edit Section"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Select Section"]}  ${formField["Select Section"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Section Deletion  ${formField["Edit Section"]}

#############################################################
# Delete Department after completing the section test cases #
#############################################################

User should able to delete Department
    [Documentation]  Deletes the Department the Department table. Verifies its deletion in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  Department  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    set test variable  ${formField}  ${configData["Department"]}
    FillFields.Input Value Into Field  ${formField["Edit Department"]["Search box"]}  ${formField["Edit Department"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Are you Sure to Delete this Record?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Department Deletion  ${formField["Edit Department"]}


#################################
#  ALL TA/DA Grade tests cases  #
#################################

User should able to add new TA/DA grade
    [Documentation]  Fills the add new TA/DA grade form and submits it. Verifies its entry in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  createdata
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

User should able to edit TA/DA grade
    [Documentation]  Edits the TA/DA grade details and saves them. verifies its updation in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  editdata
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

User should able to delete TA/DA grade
    [Documentation]  Deletes the TA/DA grade from the TA/DA grade table. Verifies its deletion in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    set test variable  ${formField}  ${configData["TA/DA Grade"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    press keys  //button[@class='btn btn-primary']  ENTER

User should able to revised TA/DA grade
    [Documentation]  Revises the TA/DA grade details. Verifies its revision in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  revisedata
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

############################################
#  ALL TA/DA Grade dependancy tests cases  #
############################################

User should able to add new grade dependancy
    [Documentation]  Fills the add new grade dependancy form and submits it. Verifies its entry in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  createdata
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

User should able to edit grade dependancy
    [Documentation]  Edits the grade dependancy details and saves them. verifies its updation in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  editdata
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

User should able to delete grade dependancy
    [Documentation]  Deletes the grade dependancy from the grade dependancy table. Verifies its deletion in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  deletedata
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

#################################
#  ALL TA/DA Rule tests cases  #
#################################

User should able to add new TA/DA rule
    [Documentation]  Fills the add new TA/DA rule form and submits it. Verifies its entry in the TA/DA rule table. This test needs grade dependancy test to be executed.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  createdata
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

User should able to add Edit TA/DA rule
    [Documentation]  Edits the TA/DA rule details and saves them. verifies its updation in the TA/DA rule table. This test needs grade dependancy test to be executed.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  editdata
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

User should able to delete TA/DA rule
    [Documentation]  Deletes the TA/DA rule from the TA/DA rule table. Verifies its deletion in the TA/DA rule table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  deletedata
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