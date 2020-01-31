*** Settings ***
Resource          ../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot

*** Variables ***
#${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
User should able to declare tea rate definition
    [Documentation]  Fills the tea rate definition form and submits it. Verifies its entry in the tea rate definition table.
    [Tags]  HRMS  tearatedefinition  createdata
    Common_Keywords.Set Test Data  ${configData["Tea Rate Definition"]}
    HRMS_Keywords.Open Entertainment Declaration Page
    HRMS_Keywords.Declare Tea Rate Definition  ${dataDictionary}
    HRMS_Keywords.Verify Tea Rate Entry  ${dataDictionary}

User should able to edit tea rate definition
    [Documentation]  Edits the tea rate definition details and submits them. Verifies its updation in tea rate definition table.
    [Tags]  HRMS  tearatedefinition  editdata
    Common_Keywords.Set Test Data  ${configData["Tea Rate Definition"]}
    HRMS_Keywords.Open Entertainment Declaration Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Search Tea Rate Definition  ${dataDictionary}
    HRMS_Keywords.Edit Tea Rate Definition  ${dataDictionary}
    HRMS_Keywords.Verify Tea Rate Entry  ${dataDictionary["Edit Tea Rate Definition"]}

User should able to delete tea rate definition
    [Documentation]  Deletes the tea rate definition entry from the table. Verifies its deletion in tea rate definition table.
    [Tags]  HRMS  tearatedefinition  deletedata
    Common_Keywords.Set Test Data  ${configData["Tea Rate Definition"]}
    HRMS_Keywords.Open Entertainment Declaration Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Apply Tea Rate Filter  ${dataDictionary}
    HRMS_Keywords.Delete Tea Rate Definition  ${dataDictionary}
    HRMS_Keywords.Verify Tea Rate Deletion  ${dataDictionary["Edit Tea Rate Definition"]}

User should able to add new enquiry decision type
    [Documentation]  Fills the add new enquiry decision type form and submits it. Verifies its entry in enquiry decision table.
    [Tags]  HRMS  enquirydecisiontype  createdata
    Common_Keywords.Set Test Data  ${configData["Enquiry Decision Type"]}
    HRMS_Keywords.Open Enquiry Decision Page
    HRMS_Keywords.Add New Enquiry Decision Type  ${dataDictionary}
    HRMS_Keywords.Verify Enquiry Decision Type Creation  ${dataDictionary}

User should able to edit enquiry decision type
    [Documentation]  Pending because there is an exception on the page.
    [Tags]  HRMS  enquirydecisiontype  editdata
    Common_Keywords.Set Test Data  ${configData["Enquiry Decision Type"]}
    HRMS_Keywords.Open Enquiry Decision Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Select Enquiry Decision Type  ${dataDictionary}
    HRMS_Keywords.Edit Enquiry Decision Type  ${dataDictionary}
    HRMS_Keywords.Verify Enquiry Decision Type Updatation  ${dataDictionary}

User should able to delete enquiry decision type
    [Documentation]  Deletes the enquiry decision type entry from the table. Verifies deletion in the enquiry decision table.
    [Tags]  HRMS  enquirydecisiontype  deletedata
    Common_Keywords.Set Test Data  ${configData["Enquiry Decision Type"]}
    HRMS_Keywords.Open Enquiry Decision Page
    Common_Keywords.Show Maximum Entries on Page
    sleep  4s
    HRMS_Keywords.Select Enquiry Decision Type  ${dataDictionary}
    HRMS_Keywords.Delete Enquiry Decision Type  ${dataDictionary}
    HRMS_Keywords.Verify Enquiry Decision Type Deletion  ${dataDictionary}

User should be able to create post class
    [Documentation]  Fills the add new post class form and submits it. Verifies its entry in the post class table.
    [Tags]  HRMS  postclass  createdata
    Common_Keywords.Set Test Data  ${configData["Post Class"]}
    HRMS_Keywords.Open Post Class Page
    HRMS_Keywords.Add New Post Class  ${dataDictionary}
    HRMS_Keywords.Verify Post Class Creation  ${dataDictionary}
    sleep  5s

User should able to update post class
    [Documentation]  Edits the details of the post class. Verifies its updation in the post class table.
    [Tags]  HRMS  postclass  editdata
    Common_Keywords.Set Test Data  ${configData["Post Class"]}
    HRMS_Keywords.Open Post Class Page
    HRMS_Keywords.Filter Post Classes By Class Group  ${dataDictionary}  ${dataDictionary["Class Group"]["Value"]}
    HRMS_Keywords.Search Post Class By Name  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Update Post Class Details  ${dataDictionary}
    HRMS_Keywords.Verify Post Class Creation  ${dataDictionary}

User should able to delete post class
    [Documentation]  deletes the post class from the post class table. Verifies its deletion in the post class table.
    [Tags]  HRMS  postclass  deletedata
    Common_Keywords.Set Test Data  ${configData["Post Class"]}
    HRMS_Keywords.Open Post Class Page
    HRMS_Keywords.Filter Post Classes By Class Group  ${dataDictionary}  ${dataDictionary["Update Post Class"]["Class Group"]["Value"]}
    HRMS_Keywords.Search Post Class By Name  ${dataDictionary}  ${dataDictionary["Update Post Class"]["Name"]["Value"]}
    HRMS_Keywords.Delete Post Class  ${dataDictionary}
    HRMS_Keywords.Verify Post Class deletion  ${dataDictionary}
    sleep  5s

User should able to add new deputation department
    [Documentation]  Fills the add new deputation department form and submits it. Verifies its entry in the deputation department table.
    [Tags]  HRMS  deputationdepartment  createdata
    Common_Keywords.Set Test Data  ${configData["Deputation Department"]}
    HRMS_Keywords.Open Deputation Department Page
    HRMS_Keywords.Add New Deputation Department  ${dataDictionary}
    reload page
    HRMS_Keywords.Verify Deputation Department Creation  ${dataDictionary}

User should able to edit deputation department
    [Documentation]  Edits the deputation department details and saves them. Verifies its updation in the deputation department table.
    [Tags]  HRMS  deputationdepartment  editdata
    Common_Keywords.Set Test Data  ${configData["Deputation Department"]}
    HRMS_Keywords.Open Deputation Department Page
    HRMS_Keywords.Filter Deputation Departments  ${dataDictionary}
    HRMS_Keywords.Search Deputaion Department  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Deputation Department Details  ${dataDictionary}
    reload page
    HRMS_Keywords.Verify Deputation Department Updation  ${dataDictionary}

User should able to delete deputation department
    [Documentation]  Deletes the deputation department from the deputation department table. Verifies its deletion in the deputation department table.
    [Tags]  HRMS  deputationdepartment  deletedata
    Common_Keywords.Set Test Data  ${configData["Deputation Department"]}
    HRMS_Keywords.Open Deputation Department Page
    HRMS_Keywords.Filter Deputation Departments  ${dataDictionary}  ${dataDictionary["Edit Deputation Department"]}
    HRMS_Keywords.Search Deputaion Department  ${dataDictionary}  ${dataDictionary["Edit Deputation Department"]["Name"]["Value"]}
    HRMS_Keywords.Delete Deputation Department  ${datCommon_Keywords.Set Test Data  ${configData["Deputation Department"]}aDictionary}  ${dataDictionary["Edit Deputation Department"]["Name"]["Value"]}
    reload page
    HRMS_Keywords.Verify Deputation Department Deletion  ${dataDictionary}

User should able to configure pay slip
    [Documentation]  Configures different details for pay slip.
    [Tags]  HRMS  payslipconfiguration
    Common_Keywords.Set Test Data  ${configData["Pay Slip Configuration"]}
    HRMS_Keywords.Open Pay Slip Configuration Page
    HRMS_Keywords.Configure Pay Slip Details  ${dataDictionary}
    HRMS_Keywords.Save Pay Slip Configurations  ${dataDictionary}

User should able to configure self verification details
    [Documentation]  Configures the self varification details.
    [Tags]  HRMS  selfvarification
    Common_Keywords.Set Test Data  ${configData["Self Verification Configuration"]}
    HRMS_Keywords.Open Self Verification Configuration Page
    HRMS_Keywords.Configure Self Varification Details  ${dataDictionary}
    HRMS_Keywords.Save Self Varification Detatils  ${dataDictionary}

User should able to add new division
    [Documentation]  Fills the add new division form and submits it. Verifies its entry in the division table.
    [Tags]  HRMS  division  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    Common_Keywords.Set Test Data  ${configData["Division"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Division"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    reload page
    HRMS_Keywords.Verify Division Entry  ${dataDictionary}

User should able to edit division
    [Documentation]  Edits the division details and saves them. Verifies its updation in the division table.
    [Tags]  HRMS  division  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    Common_Keywords.Set Test Data  ${configData["Edit Division"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    reload page
    HRMS_Keywords.Verify Division Entry  ${dataDictionary}

User should able to delete division
    [Documentation]  deletes the division from the division table. Verifies its deletion in the division table.
    [Tags]  HRMS  division  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division
    Common_Keywords.Set Test Data  ${configData["Edit Division"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    page should contain   Do you really want to Delete this Division ??
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Division Deletion  ${dataDictionary}

User should able to add new designation
    [Documentation]  Fills the add new designation form and submits it. Verifies its entry in the designation table.
    [Tags]  HRMS  designation  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation/AddEditDesignationDetails
    Common_Keywords.Set Test Data  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Post"]}  ${dataDictionary["Post"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Fourth Class"]}  ${dataDictionary["Is Fourth Class"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Designation Entry  ${dataDictionary}

User should able to edit designation
    [Documentation]  Edits the designation details and saves it. Verifies its updation in the designation table.
    [Tags]  HRMS  designation  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation
    Common_Keywords.Set Test Data  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${dataDdataDictionaryictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Select Designation"]}  ${dataDictionary["Select Designation"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Name"]}  ${dataDictionary["Edit Designation"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Post"]}  ${dataDictionary["Edit Designation"]["Post"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Is Fourth Class"]}  ${dataDictionary["Edit Designation"]["Is Fourth Class"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Designation Entry  ${dataDictionary}

User should able to delete designation
    [Documentation]  Deletes the designation from the designation table. Verifies its deletion from the designation table.
    [Tags]  HRMS  designation  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation
    Common_Keywords.Set Test Data  ${configData["Designation"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Search box"]}  ${dataDictionary["Edit Designation"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Select Designation"]}  ${dataDictionary["Select Designation"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Designation Deletion  ${dataDictionary}

User should able to add new hospital empanelment
    [Documentation]  Fills the add new hospital empanelment form and submits it. Verifies its entry in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    Common_Keywords.Set Test Data  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Type"]}  ${dataDictionary["Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Exempted"]}  ${dataDictionary["Is Exempted"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Address"]}  ${dataDictionary["Address"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["State"]}  ${dataDictionary["State"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${dataDictionary["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Contact No"]}  ${dataDictionary["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Alternate Contact No"]}  ${dataDictionary["Alternate Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Discount Rate"]}  ${dataDictionary["Discount Rate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Last Validate"]}  ${dataDictionary["Last Validate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Category"]}  ${dataDictionary["Category"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${dataDictionary}

User should able to edit hospital empanelment
    [Documentation]  Edits the hospital empanelment details and saves them. verifies its updation in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    Common_Keywords.Set Test Data  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Name"]}  ${dataDictionary["Edit Hospital Empanelment"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Type"]}  ${dataDictionary["Edit Hospital Empanelment"]["Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Is Exempted"]}  ${dataDictionary["Edit Hospital Empanelment"]["Is Exempted"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Address"]}  ${dataDictionary["Edit Hospital Empanelment"]["Address"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["State"]}  ${dataDictionary["Edit Hospital Empanelment"]["State"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["City"]}  ${dataDictionary["Edit Hospital Empanelment"]["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Contact No"]}  ${dataDictionary["Edit Hospital Empanelment"]["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Alternate Contact No"]}  ${dataDictionary["Edit Hospital Empanelment"]["Alternate Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Discount Rate"]}  ${dataDictionary["Edit Hospital Empanelment"]["Discount Rate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Last Validate"]}  ${dataDictionary["Edit Hospital Empanelment"]["Last Validate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Category"]}  ${dataDictionary["Edit Hospital Empanelment"]["Category"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${dataDictionary}

User should able to delete hospital empanelment
    [Documentation]  Deletes the hospital empanelment from the hospital empanelment table. Verifies its deletion in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/HospitalEmpanelment
    Common_Keywords.Set Test Data  ${configData["Hospital Empanelment"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Search box"]}  ${dataDictionary["Edit Hospital Empanelment"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Designation Deletion  ${dataDictionary}

User should able to add new qualification
    [Documentation]  Fills the add new qualification form and submits it. Verifies its entry in the qualification table.
    [Tags]  HRMS  qualification  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/QualificationMaster
    Common_Keywords.Set Test Data  ${configData["Qualification"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}
    FillFields.Input Value Into Field  ${dataDictionary["Qualification Name"]}  ${dataDictionary["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is professional"]}  ${dataDictionary["Is professional"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Qualification Entry  ${dataDictionary}

User should able to edit qualification
    [Documentation]  Edits the qualification details and saves them. Verifies its updation in the qualification table.
    [Tags]  HRMS  qualification  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/QualificationMaster
    Common_Keywords.Set Test Data  ${configData["Qualification"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Qualification"]["Qualification Name"]}  ${dataDictionary["Edit Qualification"]["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Qualification"]["Is professional"]}  ${dataDictionary["Edit Qualification"]["Is professional"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Qualification Entry  ${dataDictionary}


####################
# Empanelled Cases #
####################
User should able to add new empanelled officer
    [Documentation]  Fills the add new empanelled officer form and submits it. Verifies its entry in the empanelled officer table.
    [Tags]  HRMS  empanelledofficer  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryPanelImpanelment/EmpanelledIndex
    Common_Keywords.Set Test Data  ${configData["Empanelled Officer"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Entry"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Contact No."]}  ${dataDictionary["Contact No."]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective Date"]}  ${dataDictionary["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective Till Date"]}  ${dataDictionary["Effective Till Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Department"]}  ${dataDictionary["Department"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designation"]}  ${dataDictionary["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Empanelled Officer Entry  ${dataDictionary}

User should able to edit new empanelled officer
    [Documentation]  Edits the empanelled officer details and saves them. Verifies its updation in the empanelled officer table.
    [Tags]  HRMS  empanelledofficer  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryPanelImpanelment/EmpanelledIndex
    Common_Keywords.Set Test Data  ${configData["Empanelled Officer"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Empanelled Officer"]["Name"]}  ${dataDictionary["Edit Empanelled Officer"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Empanelled Officer"]["Contact No."]}  ${dataDictionary["Edit Empanelled Officer"]["Contact No."]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Empanelled Officer"]["Effective Date"]}  ${dataDictionary["Edit Empanelled Officer"]["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Empanelled Officer"]["Effective Till Date"]}  ${dataDictionary["Edit Empanelled Officer"]["Effective Till Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Empanelled Officer"]["Department"]}  ${dataDictionary["Edit Empanelled Officer"]["Department"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Empanelled Officer"]["Designation"]}  ${dataDictionary["Edit Empanelled Officer"]["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Empanelled Officer Entry  ${dataDictionary}

####################
# Cadre Test Cases #
####################
User should able to add new cadre detail
    [Documentation]  Fills the add new cadre detail form and submits it. Verifies its entry in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    Common_Keywords.Set Test Data  ${configData["Cadre Details"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add Cadre"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Cadre Detail Entry  ${dataDictionary}

User should able to edit cadre detail
    [Documentation]  Edits the cadre details and saves them. verifies its updation in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    Common_Keywords.Set Test Data  ${configData["Cadre Details"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Cadre Detail"]["Name"]}  ${dataDictionary["Edit Cadre Detail"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Cadre Detail"]["Order By"]}  ${dataDictionary["Edit Cadre Detail"]["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Cadre Detail Entry  ${dataDictionary["Edit Cadre Detail"]}

User should able to delete cadre detail
    [Documentation]  Deletes the cadre detail from the cadre detail table. Verifies its deletion in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Cader
    Common_Keywords.Set Test Data  ${configData["Cadre Details"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Select Cadre Detail"]}  ${dataDictionary["Select Cadre Detail"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Designation Deletion  ${dataDictionary["Edit Cadre Detail"]}


############################
# Payment Type Tests Cases #
############################
User should able to add Payment Type
    [Documentation]  Fills the add new Payment Type form and submits it. Verifies its entry in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    Common_Keywords.Set Test Data  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add Payment Type"]}
    FillFields.Input Value Into Field  ${dataDictionary["Description"]}  ${dataDictionary["Description"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Payment Type Entry  ${dataDictionary}

User should able to edit Payment Type
    [Documentation]  Edits the Payment Type details and saves them. verifies its updation in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    Common_Keywords.Set Test Data  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Payment Type"]["Description"]}  ${dataDictionary["Edit Payment Type"]["Description"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Payment Type Entry  ${dataDictionary["Edit Payment Type"]}

User should able to delete Payment Type
    [Documentation]  Deletes the Payment Type from the Payment Type table. Verifies its deletion in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PaymentType
    Common_Keywords.Set Test Data  ${configData["Payment Type"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Payment Type"]["Search box"]}  ${dataDictionary["Edit Payment Type"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Select Payment Type"]}  ${dataDictionary["Select Payment Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Payment Type Deletion  ${dataDictionary["Edit Payment Type"]}

#########################
# Department Test Cases #
#########################
User should able to add new Department
    [Documentation]  Fills the add Department form and submits it. Verifies its entry in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  department  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    Common_Keywords.Set Test Data  ${configData["Department"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Department Entry  ${dataDictionary}

User should able to edit Department
    [Documentation]  Edits the Department details and saves them. verifies its updation in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  department  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    Common_Keywords.Set Test Data  ${configData["Department"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    sleep  3s
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Department"]["Name"]}  ${dataDictionary["Edit Department"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Department Entry  ${dataDictionary["Edit Department"]}

########################
# Section Tests Cases #
########################
# Note: Department data will be used in this form

User should able to add new section details
    [Documentation]  Fills the add new section form and submits it. Verifies its entry in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    Common_Keywords.Set Test Data  ${configData["Section"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add Section"]}
    FillFields.Input Value Into Field  ${dataDictionary["Department"]}  ${dataDictionary["Department"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Code"]}  ${dataDictionary["Code"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Active"]}  ${dataDictionary["Is Active"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Section Entry  ${dataDictionary}

User should able to add edit section details
    [Documentation]  Edits the section details and saves them. verifies its updation in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    Common_Keywords.Set Test Data  ${configData["Section"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Department"]}  ${dataDictionary["Edit Section"]["Department"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Name"]}  ${dataDictionary["Edit Section"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Code"]}  ${dataDictionary["Edit Section"]["Code"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Order By"]}  ${dataDictionary["Edit Section"]["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Is Active"]}  ${dataDictionary["Edit Section"]["Is Active"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    wait until page contains element  SearchText
    reload page
    HRMS_Keywords.Verify Section Entry  ${dataDictionary["Edit Section"]}

User should able to delete section
    [Documentation]  Deletes the section from the section details table. Verifies its deletion in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Section
    Common_Keywords.Set Test Data  ${configData["Section"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Search box"]}  ${dataDictionary["Edit Section"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Select Section"]}  ${dataDictionary["Select Section"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Section Deletion  ${dataDictionary["Edit Section"]}

#############################################################
# Delete Department after completing the section test cases #
#############################################################

User should able to delete Department
    [Documentation]  Deletes the Department the Department table. Verifies its deletion in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  Department  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Department
    Common_Keywords.Set Test Data  ${configData["Department"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Department"]["Search box"]}  ${dataDictionary["Edit Department"]["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Are you Sure to Delete this Record?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page
    HRMS_Keywords.Verify Department Deletion  ${dataDictionary["Edit Department"]}


#################################
#  ALL TA/DA Grade tests cases  #
#################################

User should able to add new TA/DA grade
    [Documentation]  Fills the add new TA/DA grade form and submits it. Verifies its entry in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Grade"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${dataDictionary["Grade"]}  ${dataDictionary["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Min Range"]}  ${dataDictionary["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Max Range"]}  ${dataDictionary["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Level Number"]}  ${dataDictionary["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designaton"]}  ${dataDictionary["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    Common_Keywords.Switch TAB
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary}

User should able to edit TA/DA grade
    [Documentation]  Edits the TA/DA grade details and saves them. verifies its updation in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Effective From"]}  ${dataDictionary["Edit TA/DA Grade"]["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Min Range"]}  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Max Range"]}  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Edit TA/DA Grade"]["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]}  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Designaton"]}  ${dataDictionary["Edit TA/DA Grade"]["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    reload page
    wait until element is visible  BtnSearchfilter  10s
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary}

User should able to delete TA/DA grade
    [Documentation]  Deletes the TA/DA grade from the TA/DA grade table. Verifies its deletion in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    Common_Keywords.Show Maximum Entries on Page
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    press keys  //button[@class='btn btn-primary']  ENTER

User should able to revised TA/DA grade
    [Documentation]  Revises the TA/DA grade details. Verifies its revision in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  revisedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Tadagraderrule
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Grade"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${dataDictionary["Grade"]}  ${dataDictionary["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Min Range"]}  ${dataDictionary["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Max Range"]}  ${dataDictionary["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Level Number"]}  ${dataDictionary["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designaton"]}  ${dataDictionary["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    Common_Keywords.Switch TAB
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Revise"]}
    switch window  NEW
    FillFields.Input Value Into Field  ${dataDictionary["Revised Effective From"]}  ${dataDictionary["Revised Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Min Range"]}  ${dataDictionary["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Max Range"]}  ${dataDictionary["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]}  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designaton"]}  ${dataDictionary["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    Common_Keywords.Switch TAB
    sleep  3s
    reload page
    wait until element is visible  BtnSearchfilter  10s
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary}

############################################
#  ALL TA/DA Grade dependancy tests cases  #
############################################

User should able to add new grade dependancy
    [Documentation]  Fills the add new grade dependancy form and submits it. Verifies its entry in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/tadagraderrule/TaDaDependencyGrid
    Common_Keywords.Set Test Data  ${configData["Grade Dependency"]}
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
    FillFields.Input Value Into Field  ${dataDictionary["Add New Dependancy"]}
    set to dictionary  ${dataDictionary["Effective From"]["Value"]}  Day=${day}  Month=${month}  Year=${year}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]}  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]}  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]}  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Designation"]}  ${dataDictionary["TA/DA Grade depends on"]["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Save"]}
    HRMS_Keywords.Verify Grade Dependancy Entry  ${dataDictionary}
    sleep  3s

User should able to edit grade dependancy
    [Documentation]  Edits the grade dependancy details and saves them. verifies its updation in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/tadagraderrule/TaDaDependencyGrid
    Common_Keywords.Set Test Data  ${configData["Grade Dependency"]}
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
    set to dictionary  ${dataDictionary["Effective From"]["Value"]}  Day=${day}  Month=${month}  Year=${year}
    set to dictionary  ${dataDictionary["Edit"]}  Locator=//td[contains(text(),'${lastGradeDate}')]/following-sibling::td//i[@class='fa fa-pencil']
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]}  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]}  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]}  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Designation"]}  ${dataDictionary["TA/DA Grade depends on"]["Designation"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Save"]}
    HRMS_Keywords.Verify Grade Dependancy Entry  ${dataDictionary}
    sleep  3s

User should able to delete grade dependancy
    [Documentation]  Deletes the grade dependancy from the grade dependancy table. Verifies its deletion in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/tadagraderrule/TaDaDependencyGrid
    Common_Keywords.Set Test Data  ${configData["Grade Dependency"]}
    Common_Keywords.Show Maximum Entries on Page
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    set to dictionary  ${dataDictionary["Delete"]}  Locator=//td[contains(text(),'${lastGradeDate}')]/following-sibling::td//i[@class='fa fa-trash-o']
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    HRMS_Keywords.Verify Grade Dependancy Deletion  ${dataDictionary}

#################################
#  ALL TA/DA Rule tests cases  #
#################################

User should able to add new TA/DA rule
    [Documentation]  Fills the add new TA/DA rule form and submits it. Verifies its entry in the TA/DA rule table. This test needs grade dependancy test to be executed.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/TadaRule
    Common_Keywords.Set Test Data  ${configData["TA/DA Rule"]}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}
    FillFields.Input Value Into Field  ${dataDictionary["Unit"]}  ${dataDictionary["Unit"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Allowance Type"]}  ${dataDictionary["Allowance Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Grade"]}  ${dataDictionary["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Rule"]}  ${dataDictionary["Rule"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Travel Mode"]}  ${dataDictionary["Travel Mode"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Travel Class"]}  ${dataDictionary["Travel Class"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Mileage Allowance"]}  ${dataDictionary["Mileage Allowance"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${dataDictionary["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Amount"]}  ${dataDictionary["Amount"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA Rule Entry  ${dataDictionary}

User should able to add Edit TA/DA rule
    [Documentation]  Edits the TA/DA rule details and saves them. verifies its updation in the TA/DA rule table. This test needs grade dependancy test to be executed.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  editdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/TadaRule
    Common_Keywords.Set Test Data  ${configData["TA/DA Rule"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Unit"]}  ${dataDictionary["Edit TA/DA Rule"]["Unit"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Allowance Type"]}  ${dataDictionary["Edit TA/DA Rule"]["Allowance Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Effective From"]}  ${dataDictionary["Edit TA/DA Rule"]["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Grade"]}  ${dataDictionary["Edit TA/DA Rule"]["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Rule"]}  ${dataDictionary["Edit TA/DA Rule"]["Rule"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Travel Mode"]}  ${dataDictionary["Edit TA/DA Rule"]["Travel Mode"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Travel Class"]}  ${dataDictionary["Edit TA/DA Rule"]["Travel Class"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Mileage Allowance"]}  ${dataDictionary["Edit TA/DA Rule"]["Mileage Allowance"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["City"]}  ${dataDictionary["Edit TA/DA Rule"]["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Amount"]}  ${dataDictionary["Edit TA/DA Rule"]["Amount"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
    sleep  3s
    reload page
    HRMS_Keywords.Verify TA/DA Rule Entry  ${dataDictionary["Edit TA/DA Rule"]}

User should able to delete TA/DA rule
    [Documentation]  Deletes the TA/DA rule from the TA/DA rule table. Verifies its deletion in the TA/DA rule table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  deletedata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/TadaRule
    Common_Keywords.Set Test Data  ${configData["TA/DA Rule"]}
    Common_Keywords.Show Maximum Entries on Page
#    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    HRMS_Keywords.Verify TA/DA Rule Deletion  ${dataDictionary["Edit TA/DA Rule"]}




#    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Department"]}  ${dataDictionary["Edit Section"]["Department"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Name"]}  ${dataDictionary["Edit Section"]["Name"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Code"]}  ${dataDictionary["Edit Section"]["Code"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Order By"]}  ${dataDictionary["Edit Section"]["Order By"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Edit Section"]["Is Active"]}  ${dataDictionary["Edit Section"]["Is Active"]["Value"]}
#    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
#    wait until page contains element  SearchText
#    HRMS_Keywords.Verify Section Entry  ${dataDictionary["Edit Section"]}