*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot

*** Variables ***
#${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
############################
# Tea Rate Definiton Cases #
############################

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

##########################
# Enquiry Decision Cases #
##########################

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

####################
# Post Class Cases #
####################

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

###############################
# Deputation Department Cases #
###############################

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
    HRMS_Keywords.Delete Deputation Department  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}
    reload page
    HRMS_Keywords.Verify Deputation Department Deletion  ${dataDictionary}

#################################
# Pay Slip Configurations Cases #
#################################

User should able to configure pay slip
    [Documentation]  Configures different details for pay slip.
    [Tags]  HRMS  payslipconfiguration
    Common_Keywords.Set Test Data  ${configData["Pay Slip Configuration"]}
    HRMS_Keywords.Open Pay Slip Configuration Page
    HRMS_Keywords.Configure Pay Slip Details  ${dataDictionary}
    HRMS_Keywords.Save Pay Slip Configurations  ${dataDictionary}

###########################
# Self Varification Cases #
###########################

User should able to configure self verification details
    [Documentation]  Configures the self varification details.
    [Tags]  HRMS  selfvarification
    Common_Keywords.Set Test Data  ${configData["Self Verification Configuration"]}
    HRMS_Keywords.Open Self Verification Configuration Page
    HRMS_Keywords.Configure Self Varification Details  ${dataDictionary}
    HRMS_Keywords.Save Self Varification Detatils  ${dataDictionary}

##################
# Division Cases #
##################

User should able to add new division
    [Documentation]  Fills the add new division form and submits it. Verifies its entry in the division table.
    [Tags]  HRMS  division  createdata
    Common_Keywords.Set Test Data  ${configData["Division"]}
    HRMS_Keywords.Open Division Page
    HRMS_Keywords.Add New Division  ${dataDictionary}
    reload page
    HRMS_Keywords.Verify Division Entry  ${dataDictionary}

User should able to edit division
    [Documentation]  Edits the division details and saves them. Verifies its updation in the division table.
    [Tags]  HRMS  division  editdata
    Common_Keywords.Set Test Data  ${configData["Division"]}
    HRMS_Keywords.Open Division Page
    HRMS_Keywords.Search Division  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Division Details  ${dataDictionary}
    reload page
    HRMS_Keywords.Verify Division Entry  ${dataDictionary}

User should able to delete division
    [Documentation]  deletes the division from the division table. Verifies its deletion in the division table.
    [Tags]  HRMS  division  deletedata
    Common_Keywords.Set Test Data  ${configData["Division"]}
    HRMS_Keywords.Open Division Page
    HRMS_Keywords.Search Division  ${dataDictionary}  ${dataDictionary["Edit Division"]["Name"]["Value"]}
    HRMS_Keywords.Delete Division  ${dataDictionary}
    HRMS_Keywords.Verify Division Deletion  ${dataDictionary}

#####################
# Designation Cases #
#####################

User should able to add new designation
    [Documentation]  Fills the add new designation form and submits it. Verifies its entry in the designation table.
    [Tags]  HRMS  designation  createdata
    Common_Keywords.Set Test Data  ${configData["Designation"]}
    HRMS_Keywords.Open Designation Page
    HRMS_Keywords.Add New Designation  ${dataDictionary}
    HRMS_Keywords.Verify Designation Entry  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}

User should able to edit designation
    [Documentation]  Edits the designation details and saves it. Verifies its updation in the designation table.
    [Tags]  HRMS  designation  editdata
    Common_Keywords.Set Test Data  ${configData["Designation"]}
    HRMS_Keywords.Open Designation Page
    HRMS_Keywords.Search Designation Name  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Designation  ${dataDictionary}
    HRMS_Keywords.Verify Designation Entry  ${dataDictionary}  ${dataDictionary["Edit Designation"]["Name"]["Value"]}

User should able to delete designation
    [Documentation]  Deletes the designation from the designation table. Verifies its deletion from the designation table.
    [Tags]  HRMS  designation  deletedata
    Common_Keywords.Set Test Data  ${configData["Designation"]}
    HRMS_Keywords.Open Designation Page
    HRMS_Keywords.Search Designation Name  ${dataDictionary}  ${dataDictionary["Edit Designation"]["Name"]["Value"]}
    HRMS_Keywords.Select Designation From The Table  ${dataDictionary}  ${dataDictionary["Edit Designation"]["Name"]["Value"]}
    HRMS_Keywords.Delete Designation  ${dataDictionary}
    HRMS_Keywords.Verify Designation Deletion  ${dataDictionary}

##############################
# Hospital Empanelment Cases #
##############################

User should able to add new hospital empanelment
    [Documentation]  Fills the add new hospital empanelment form and submits it. Verifies its entry in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  createdata
    Common_Keywords.Set Test Data  ${configData["Hospital Empanelment"]}
    HRMS_Keywords.Open Hospital Empanelment Page
    HRMS_Keywords.Add New Hospital Empanelment  ${dataDictionary}
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${dataDictionary["Name"]["Value"]}

User should able to edit hospital empanelment
    [Documentation]  Edits the hospital empanelment details and saves them. verifies its updation in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  editdata
    Common_Keywords.Set Test Data  ${configData["Hospital Empanelment"]}
    HRMS_Keywords.Open Hospital Empanelment Page
    HRMS_Keywords.Search Hospital Empanelment  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Hospital Empanelment  ${dataDictionary}
    HRMS_Keywords.Verify Hospital Empanelment Entry  ${dataDictionary["Edit Hospital Empanelment"]["Name"]["Value"]}

User should able to delete hospital empanelment
    [Documentation]  Deletes the hospital empanelment from the hospital empanelment table. Verifies its deletion in the hospital empanelment table.
    [Tags]  HRMS  hospitalempanelment  deletedata
    Common_Keywords.Set Test Data  ${configData["Hospital Empanelment"]}
    HRMS_Keywords.Open Hospital Empanelment Page
    HRMS_Keywords.Search Hospital Empanelment  ${dataDictionary["Edit Hospital Empanelment"]["Name"]["Value"]}
    HRMS_Keywords.Delete Hospital Empanelment  ${dataDictionary["Edit Hospital Empanelment"]["Name"]["Value"]}
    reload page
    HRMS_Keywords.Verify Hospital Empanelment Deletion  ${dataDictionary["Edit Hospital Empanelment"]["Name"]["Value"]}

#######################
# Qualification Cases #
#######################

User should able to add new qualification
    [Documentation]  Fills the add new qualification form and submits it. Verifies its entry in the qualification table.
    [Tags]  HRMS  qualification  createdata
    Common_Keywords.Set Test Data  ${configData["Qualification"]}
    HRMS_Keywords.Open Qualification Page
    HRMS_Keywords.Add New Qualification  ${dataDictionary}
    HRMS_Keywords.Verify Qualification Entry  ${dataDictionary["Qualification Name"]["Value"]}

User should able to edit qualification
    [Documentation]  Edits the qualification details and saves them. Verifies its updation in the qualification table.
    [Tags]  HRMS  qualification  editdata
    Common_Keywords.Set Test Data  ${configData["Qualification"]}
    HRMS_Keywords.Open Qualification Page
    HRMS_Keywords.Search Qualification  ${dataDictionary["Qualification Name"]["Value"]}
    HRMS_Keywords.Edit Qualification  ${dataDictionary}  ${dataDictionary["Qualification Name"]["Value"]}${SPACE}
    HRMS_Keywords.Verify Qualification Entry  ${dataDictionary["Edit Qualification"]["Qualification Name"]["Value"]}

####################
# Empanelled Cases #
####################

User should able to add new empanelled officer
    [Documentation]  Fills the add new empanelled officer form and submits it. Verifies its entry in the empanelled officer table.
    [Tags]  HRMS  empanelledofficer  createdata
    Common_Keywords.Set Test Data  ${configData["Empanelled Officer"]}
    HRMS_Keywords.Open Empanelled Officer Page
    HRMS_Keywords.Add New Empanelled Officer  ${dataDictionary}
    HRMS_Keywords.Verify Empanelled Officer Entry  ${dataDictionary["Name"]["Value"]}

User should able to edit new empanelled officer         ###"""Not working because searching functionality is not working"""
    [Documentation]  Edits the empanelled officer details and saves them. Verifies its updation in the empanelled officer table.
    [Tags]  HRMS  empanelledofficer  editdata
    Common_Keywords.Set Test Data  ${configData["Empanelled Officer"]}
    HRMS_Keywords.Open Empanelled Officer Page
    HRMS_Keywords.Search Empanelled Officer  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Empanelled Officer  ${dataDictionary}  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Verify Empanelled Officer Entry  ${dataDictionary["Edit Empanelled Officer"]["Name"]["Value"]}

####################
# Cadre Test Cases #
####################

User should able to add new cadre detail
    [Documentation]  Fills the add new cadre detail form and submits it. Verifies its entry in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  createdata
    Common_Keywords.Set Test Data  ${configData["Cadre Details"]}
    HRMS_Keywords.Open Cadre Detail Page
    HRMS_Keywords.Add New Cadre  ${dataDictionary}
    HRMS_Keywords.Verify Cadre Detail Entry  ${dataDictionary["Name"]["Value"]}

User should able to edit cadre detail
    [Documentation]  Edits the cadre details and saves them. verifies its updation in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  editdata
    Common_Keywords.Set Test Data  ${configData["Cadre Details"]}
    HRMS_Keywords.Open Cadre Detail Page
    HRMS_Keywords.Search For Cadre Entry  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Cadre Details  ${dataDictionary}
    HRMS_Keywords.Verify Cadre Detail Entry  ${dataDictionary["Edit Cadre Detail"]["Name"]["Value"]}

User should able to delete cadre detail
    [Documentation]  Deletes the cadre detail from the cadre detail table. Verifies its deletion in the cadre detail table. For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/
    [Tags]  HRMS  cadredetail  deletedata
    Common_Keywords.Set Test Data  ${configData["Cadre Details"]}
    HRMS_Keywords.Open Cadre Detail Page
    HRMS_Keywords.Search For Cadre Entry  ${dataDictionary["Edit Cadre Detail"]["Name"]["Value"]}
    HRMS_Keywords.Delete Cadre Entry  ${dataDictionary}  ${dataDictionary["Edit Cadre Detail"]["Name"]["Value"]}
    HRMS_Keywords.Verify Cadre Detail Deletion  ${dataDictionary["Edit Cadre Detail"]["Name"]["Value"]}

############################
# Payment Type Tests Cases #
############################

User should able to add Payment Type
    [Documentation]  Fills the add new Payment Type form and submits it. Verifies its entry in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  createdata
    Common_Keywords.Set Test Data  ${configData["Payment Type"]}
    HRMS_Keywords.Open Payment Type Page
    HRMS_Keywords.Add Payment Type  ${dataDictionary}
    HRMS_Keywords.Verify Payment Type Entry  ${dataDictionary["Description"]["Value"]}

User should able to edit Payment Type
    [Documentation]  Edits the Payment Type details and saves them. verifies its updation in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  editdata
    Common_Keywords.Set Test Data  ${configData["Payment Type"]}
    HRMS_Keywords.Open Payment Type Page
    HRMS_Keywords.Search Payment Type  ${dataDictionary["Description"]["Value"]}
    HRMS_Keywords.Edit Payment Type  ${dataDictionary}
    HRMS_Keywords.Verify Payment Type Entry  ${dataDictionary["Edit Payment Type"]["Description"]["Value"]}

User should able to delete Payment Type
    [Documentation]  Deletes the Payment Type from the Payment Type table. Verifies its deletion in the Payment Type table. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/
    [Tags]  HRMS  PaymentType  deletedata
    Common_Keywords.Set Test Data  ${configData["Payment Type"]}
    HRMS_Keywords.Open Payment Type Page
    HRMS_Keywords.Search Payment Type  ${dataDictionary["Edit Payment Type"]["Description"]["Value"]}
    HRMS_Keywords.Delete Payment Type Entry  ${dataDictionary}  ${dataDictionary["Edit Payment Type"]["Description"]["Value"]}
    HRMS_Keywords.Verify Payment Type Deletion  ${dataDictionary["Edit Payment Type"]["Description"]["Value"]}

#########################
# Department Test Cases #
#########################

User should able to add new Department
    [Documentation]  Fills the add Department form and submits it. Verifies its entry in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  department  createdata
    Common_Keywords.Set Test Data  ${configData["Department"]}
    HRMS_Keywords.Open Department Page
    HRMS_Keywords.Add New Department  ${dataDictionary}
    HRMS_Keywords.Open Department Page
    HRMS_Keywords.Verify Department Entry  ${dataDictionary["Name"]["Value"]}

User should able to edit Department
    [Documentation]  Edits the Department details and saves them. verifies its updation in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  department  editdata
    Common_Keywords.Set Test Data  ${configData["Department"]}
    HRMS_Keywords.Open Department Page
    HRMS_Keywords.Search Department Entry  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Department Entry  ${dataDictionary}
    HRMS_Keywords.Open Department Page
    HRMS_Keywords.Verify Department Entry  ${dataDictionary["Edit Department"]["Name"]["Value"]}

########################
# Section Tests Cases #
########################

# Note: Department data will be used in this form

User should able to add new section details
    [Documentation]  Fills the add new section form and submits it. Verifies its entry in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  createdata
    Common_Keywords.Set Test Data  ${configData["Section"]}
    HRMS_Keywords.Open Section Page
    HRMS_Keywords.Add New Section  ${dataDictionary}
    HRMS_Keywords.Open Section Page
    HRMS_Keywords.Verify Section Entry  ${dataDictionary["Name"]["Value"]}

User should able to add edit section details
    [Documentation]  Edits the section details and saves them. verifies its updation in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  editdata
    Common_Keywords.Set Test Data  ${configData["Section"]}
    HRMS_Keywords.Open Section Page
    HRMS_Keywords.Search Section Entry  ${dataDictionary["Name"]["Value"]}
    HRMS_Keywords.Edit Section Details  ${dataDictionary}
    HRMS_Keywords.Open Section Page
    HRMS_Keywords.Verify Section Entry  ${dataDictionary["Edit Section"]["Name"]["Value"]}

User should able to delete section
    [Documentation]  Deletes the section from the section details table. Verifies its deletion in the section details table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/
    [Tags]  HRMS  section  deletedata
    Common_Keywords.Set Test Data  ${configData["Section"]}
    HRMS_Keywords.Open Section Page
    HRMS_Keywords.Search Section Entry  ${dataDictionary["Edit Section"]["Name"]["Value"]}
    HRMS_Keywords.Delete Section Entry  ${dataDictionary}  ${dataDictionary["Edit Section"]["Name"]["Value"]}
    HRMS_Keywords.Open Section Page
    HRMS_Keywords.Verify Section Deletion  ${dataDictionary["Edit Section"]["Name"]["Value"]}

#############################################################
# Delete Department after completing the section test cases #
#############################################################

User should able to delete Department
    [Documentation]  Deletes the Department the Department table. Verifies its deletion in the Department table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/
    [Tags]  HRMS  Department  deletedata
    Common_Keywords.Set Test Data  ${configData["Department"]}
    HRMS_Keywords.Open Department Page
    HRMS_Keywords.Search Department Entry  ${dataDictionary["Edit Department"]["Name"]["Value"]}
    HRMS_Keywords.Delete Department Entry  ${dataDictionary["Edit Department"]["Name"]["Value"]}
    HRMS_Keywords.Open Department Page
    HRMS_Keywords.Verify Department Deletion  ${dataDictionary["Edit Department"]["Name"]["Value"]}

#################################
#  ALL TA/DA Grade tests cases  #
#################################

User should able to add new TA/DA grade
    [Documentation]  Fills the add new TA/DA grade form and submits it. Verifies its entry in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS     createdata
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    HRMS_Keywords.Open TA/DA Grade Page
    HRMS_Keywords.Add New TA/DA Grade  ${dataDictionary}
    Common_Keywords.Switch TAB
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary["Grade"]["Value"]}

User should able to edit TA/DA grade
    [Documentation]  Edits the TA/DA grade details and saves them. verifies its updation in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  editdata
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    HRMS_Keywords.Open TA/DA Grade Page
    HRMS_Keywords.Search For TA/DA Grade Entry  ${dataDictionary["Grade"]["Value"]}
    HRMS_Keywords.Edit TA/DA Grade  ${dataDictionary}  ${dataDictionary["Grade"]["Value"]}
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary["Edit TA/DA Grade"]["Grade"]["Value"]}

User should able to delete TA/DA grade
    [Documentation]  Deletes the TA/DA grade from the TA/DA grade table. Verifies its deletion in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  deletedata
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    HRMS_Keywords.Open TA/DA Grade Page
    HRMS_Keywords.Search For TA/DA Grade Entry  ${dataDictionary["Edit TA/DA Grade"]["Grade"]["Value"]}
    HRMS_Keywords.Delete TA/DA Grade Entry
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}

User should able to revised TA/DA grade
    [Documentation]  Revises the TA/DA grade details. Verifies its revision in the TA/DA grade table. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/
    [Tags]  HRMS  TADAgrade  revisedata
    Common_Keywords.Set Test Data  ${configData["TA/DA Grade"]}
    HRMS_Keywords.Open TA/DA Grade Page
    HRMS_Keyword.Add New TA/DA Grade
    Common_Keywords.Switch TAB
    HRMS_Keywords.Verify TA/DA grade Entry  ${dataDictionary["Grade"]["Value"]}
    HRMS_Keywords.Search For TA/DA Grade Entry  ${dataDictionary["Grade"]["Value"]}
    HRMS_Keywords.Revise TA/DA Grade  ${dataDictionary["Grade"]["Value"]}

############################################
#  ALL TA/DA Grade dependancy tests cases  #
############################################

User should able to add new grade dependancy
    [Documentation]  Fills the add new grade dependancy form and submits it. Verifies its entry in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  createdata
    Common_Keywords.Set Test Data  ${configData["Grade Dependency"]}
    HRMS_Keywords.Open Grade Depandancy Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Add New Grade Dependancy  ${dataDictionary}
    HRMS_Keywords.Open Grade Depandancy Page
    HRMS_Keywords.Verify Grade Dependancy Entry  ${dataDictionary}

User should able to edit grade dependancy
    [Documentation]  Edits the grade dependancy details and saves them. verifies its updation in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  editdata
    Common_Keywords.Set Test Data  ${configData["Grade Dependency"]}
    HRMS_Keywords.Open Grade Depandancy Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_keywords.Edit Grade Dependancy  ${dataDictionary}
    HRMS_Keywords.Open Grade Depandancy Page
    HRMS_Keywords.Verify Grade Dependancy Entry  ${dataDictionary}
    sleep  3s

User should able to delete grade dependancy
    [Documentation]  Deletes the grade dependancy from the grade dependancy table. Verifies its deletion in the grade dependancy table. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/
    [Tags]  HRMS  gradedependancy  deletedata
    Common_Keywords.Set Test Data  ${configData["Grade Dependency"]}
    HRMS_Keywords.Open Grade Depandancy Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Delete Grade Dependancy Entry  ${dataDictionary}
    HRMS_Keywords.Open Grade Depandancy Page
    HRMS_Keywords.Verify Grade Dependancy Deletion  ${dataDictionary}

#################################
#  ALL TA/DA Rule tests cases  #
#################################

User should able to add new TA/DA rule
    [Documentation]  Fills the add new TA/DA rule form and submits it. Verifies its entry in the TA/DA rule table. This test needs grade dependancy test to be executed.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  createdata
    Common_Keywords.Set Test Data  ${configData["TA/DA Rule"]}
    HRMS_Keywords.Open TA/DA Rule Page
    HRMS_Keywords.Add New TA/DA Rule  ${dataDictionary}
    HRMS_Keywords.Verify TA/DA Rule Entry  ${dataDictionary}

User should able to add Edit TA/DA rule
    [Documentation]  Edits the TA/DA rule details and saves them. verifies its updation in the TA/DA rule table. This test needs grade dependancy test to be executed.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  editdata
    Common_Keywords.Set Test Data  ${configData["TA/DA Rule"]}
    HRMS_Keywords.Open TA/DA Rule Page
    HRMS_Keywords.Edit TA/DA Rule Entry  ${dataDictionary}  ${dataDictionary["Grade"]["Value"]}
    HRMS_Keywords.Verify TA/DA Rule Entry  ${dataDictionary["Edit TA/DA Rule"]}

User should able to delete TA/DA rule
    [Documentation]  Deletes the TA/DA rule from the TA/DA rule table. Verifies its deletion in the TA/DA rule table.  For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/
    [Tags]  HRMS  TADArule  deletedata
    Common_Keywords.Set Test Data  ${configData["TA/DA Rule"]}
    HRMS_Keywords.Open TA/DA Rule Page
    Common_Keywords.Show Maximum Entries on Page
    HRMS_Keywords.Delete TA/DA Rule  ${dataDictionary}  ${dataDictionary["Edit TA/DA Rule"]["Grade"]["Value"]}
    HRMS_Keywords.Verify TA/DA Rule Deletion  ${dataDictionary["Edit TA/DA Rule"]}