*** Settings ***
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
#Resource  ${PAGE OBJECTS}/LeftNavigation.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ./ERP_Keywords.robot
Resource  ${PAGE OBJECTS}/HRMS/EntertainmentDeclaration.robot
Resource  ${PAGE OBJECTS}/HRMS/EnquiryDecision.robot
Resource  ${PAGE OBJECTS}/HRMS/DeputationDepartment.robot
Resource  ${PAGE OBJECTS}/HRMS/Division.robot
Resource  ${PAGE OBJECTS}/HRMS/Designation.robot
Resource  ${PAGE OBJECTS}/HRMS/HospitalEmpanelment.robot
Resource  ${PAGE OBJECTS}/HRMS/Qualification.robot
Resource  ${PAGE OBJECTS}/HRMS/EmpanelledOfficer.robot
Resource  ${PAGE OBJECTS}/HRMS/CadreDetail.robot
Resource  ${PAGE OBJECTS}/HRMS/PaymentType.robot
Resource  ${PAGE OBJECTS}/HRMS/Department.robot
Resource  ${PAGE OBJECTS}/HRMS/Section.robot
Resource  ${PAGE OBJECTS}/HRMS/TADAgrade.robot
Resource  ${PAGE OBJECTS}/HRMS/GradeDependancy.robot
Resource  ${PAGE OBJECTS}/HRMS/TADARule.robot
Resource  ${PAGE OBJECTS}/HRMS/PaySlipConfiguration.robot
Resource  ${PAGE OBJECTS}/HRMS/SelfVerification.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryCycle.robot
Resource  ${PAGE OBJECTS}/HRMS/ManualAttendance.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryDetail.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryPaybill.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryDisbursment.robot
Resource  ${PAGE OBJECTS}/UM/ManageUser.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentEmployee.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentAdmin.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentPropsal.robot
Resource  ${PAGE OBJECTS}/HRMS/ApproveLeaveEncashmentProposal.robot
Resource  ${PAGE OBJECTS}/HRMS/ProcessLeaveEncashment.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentPaybill.robot
Resource  ${PAGE OBJECTS}/HRMS/ReviewAttendance.robot
Resource  NewUiFormHelpers/InputFields.robot

*** Variables ***
${employeeStatus}  Status

*** Keywords ***
Open Post Class Page
    [Documentation]  Opens post class page.
    PostClass.Go To ERP Page Post Class Page

#Add New Class
#    PostClass.Click Add New Post Class
#
#Fill Post Class Details
#    [Arguments]  ${Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
#    PostClass.Fill Post Class Name  ${Post_Class_Name}
#    PostClass.Select Class Group  ${Class_Group}
#    PostClass.Fill Seniority Level  ${Seniority_Level}
#
#Check Post Class Entry
#    [Arguments]  ${Post_Class_Name}
#    PostClass.Check Post Class Is Added  ${Post_Class_Name}
#
#Update The Added Post Class Element
#    [Arguments]  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
#    PostClass.Get Number of Rows of Post Class Table
#    PostClass.Update The Post Class Entry  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
#    Check Post Class Entry  ${New_Post_Class_Name}
#
#Delete The Added Post Class Element
#    [Arguments]  ${New_Post_Class_Name}
#    PostClass.Get Number of Rows of Post Class Table
#    PostClass.Delete The Post Class Entry
#    PostClass.Verify The Deleted Element  ${New_Post_Class_Name}
    #Check Post Class Entry  ${New_Post_Class_Name}

Add New Post Class
    [Documentation]  Opens add post class form and fills details into it.
    [Arguments]  ${dataDictionary}
    PostClass.Click Add New Post Class Button  ${dataDictionary}
    PostClass.Fill Post Class Details  ${dataDictionary}
    PostClass.Submit Details  ${dataDictionary}

Filter Post Classes By Class Group
    [Documentation]  Applies filters for listing desired post class.
    [Arguments]  ${dataDictionary}  ${value}
    PostClass.Click On Filter Button  ${dataDictionary}
    PostClass.Select Type In Dropdown  ${dataDictionary}  ${value}
    PostClass.Apply Filter  ${dataDictionary}

Search Post Class By Name
    [Documentation]  Searches post class by name.
    [Arguments]  ${dataDictionary}  ${value}
    PostClass.Search Post Class  ${dataDictionary}  ${value}

Update Post Class Details
    [Documentation]  Edits details of post class.
    [Arguments]  ${dataDictionary}
    PostClass.Click On Update Button  ${dataDictionary}
    PostClass.Fill Post Class Details  ${dataDictionary["Update Post Class"]}
    PostClass.Submit Details  ${dataDictionary}

Delete Post Class
    [Documentation]  Deletes post class.
    [Arguments]  ${dataDictionary}
    PostClass.Click On Delete Button  ${dataDictionary}
    PostClass.Confirm Delete Entry Popup Appeared
    PostClass.Delete Selected Entry  ${dataDictionary}

Verify Post Class Creation
    [Documentation]  Verifies creation of post class.
    [Arguments]  ${dataDictionary}
    PostClass.Check For The Post Class Entry In The Post Class Table  ${dataDictionary}

Verify Post Class deletion
    [Documentation]  Verifies deletion of post class
    [Arguments]  ${dataDictionary}
    PostClass.Check For The Post Class Entry In The Post Class Table  ${dataDictionary}

Open Entertainment Declaration Page
    [Documentation]  Opens Entertainment declaration form.
    EntertainmentDeclaration.Go To Entertainment Declaration Page

Declare Tea Rate Definition
    [Documentation]  Fills tea rate definition details into entertainment declaration form.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Declare Button  ${dataDictionary}
    EntertainmentDeclaration.Fill Entertainment Declaration Details  ${dataDictionary}
    EntertainmentDeclaration.Submit Details  ${dataDictionary}

Search Tea Rate Definition
    [Documentation]  Searches tea rate definition in entertainment declaration page.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Search Tea Rate Definition In Entertainment Declaration Table  ${dataDictionary}

Apply Tea Rate Filter
    [Documentation]  Opens and selects appropriate filters for tea rate definition.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Filter  ${dataDictionary}
    EntertainmentDeclaration.Select Type In Dropdown  ${dataDictionary}
    EntertainmentDeclaration.Apply Filter  ${dataDictionary}

Edit Tea Rate Definition
    [Documentation]  Edits details of tea rate definition.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Edit Button  ${dataDictionary}
    EntertainmentDeclaration.Fill Entertainment Declaration Details  ${dataDictionary["Edit Tea Rate Definition"]}
    EntertainmentDeclaration.Submit Details  ${dataDictionary}

Delete Tea Rate Definition
    [Documentation]  Deletes tea rate definition record.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Delete Button  ${dataDictionary}
    EntertainmentDeclaration.Confirm Delete Entry Popup Appeared
    EntertainmentDeclaration.Delete Selected Entry  ${dataDictionary}

Verify Tea Rate Entry
    [Documentation]  Verifies entry of tea rate definition.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Check For The New Entry In Entertainment Declaration Table  ${dataDictionary}

Verify Tea Rate Deletion
    [Documentation]  Verifies entry deletion of tea rate definition.
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Check For The Deletion In Entertainment Declaration Table  ${dataDictionary}

Open Enquiry Decision Page
    [Documentation]  Opens enquiry decision page.
    EnquiryDecision.Go To Enquiry Decision Page

Add New Enquiry Decision Type
    [Documentation]  Opens add new enquiry decision form and fills details into it.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Click On Add New Button  ${dataDictionary}
    EnquiryDecision.Fill Enquiry Decision Details  ${dataDictionary}
    EnquiryDecision.Submit Details  ${dataDictionary}

Verify Enquiry Decision Type Creation
    [Documentation]  Checks for enrty of enquiry decision type.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${dataDictionary}

Edit Enquiry Decision Type
    [Documentation]  Edits Details of previously created enquiry decision type.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Click On Edit Button  ${dataDictionary}
    EnquiryDecision.Fill Enquiry Decision Details  ${dataDictionary["Edit Enquiry Decision Type"]}
    EnquiryDecision.Submit Details  ${dataDictionary}

Verify Enquiry Decision Type Updatation
    [Documentation]  Verify Update in the entry of enquiry decision type.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${dataDictionary}

Select Enquiry Decision Type
    [Documentation]  Selects the entry of given enquiry decision type.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Search Enquiry Decision  ${dataDictionary}
    EnquiryDecision.Select Enquiry Decision Checkbox  ${dataDictionary}

Delete Enquiry Decision Type
    [Documentation]  Deletes enquiry decision type entry.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Click On Delete Button  ${dataDictionary}
    EnquiryDecision.Confirm Delete Entry Popup Appeared
    EnquiryDecision.Delete Selected Entry  ${dataDictionary}

Verify Enquiry Decision Type Deletion
    [Documentation]  Verifies deletion of enquiry decision type.
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${dataDictionary}

Open Deputation Department Page
    [Documentation]  Opens deputation department page.
    DeputationDepartment.Go To Deputation Department Page

Add New Deputation Department
    [Documentation]  Opens add new deputation department form and fills details into it.
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Click On Add New Button  ${dataDictionary}
    DeputationDepartment.Fill Deputation Department Details  ${dataDictionary}
    DeputationDepartment.Submit Details  ${dataDictionary}

Filter Deputation Departments
    [Documentation]  Open deputation department filter and selects appropriate filters.
    [Arguments]  ${dataDictionary}  ${value}=${dataDictionary}
    DeputationDepartment.Open Deputation Department Filters  ${dataDictionary}
    DeputationDepartment.Select Governing Authorities Filter  ${dataDictionary}  ${value["Governing Authorities"]["Value"]}
    DeputationDepartment.Select State Filter  ${dataDictionary}  ${value["State"]["Value"]}
    DeputationDepartment.Select City Filter  ${dataDictionary}  ${value["City"]["Value"]}
    DeputationDepartment.Apply Filters  ${dataDictionary}

Edit Deputation Department Details
    [Documentation]  Edits details of previously created deputation department.
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Click On Edit Button  ${dataDictionary}
    switch window  NEW
    DeputationDepartment.Fill Deputation Department Details  ${dataDictionary["Edit Deputation Department"]}
    DeputationDepartment.Submit Details  ${dataDictionary}

Search Deputaion Department
    [Documentation]  Search deputation department.
    [Arguments]  ${dataDictionary}  ${value}
    DeputationDepartment.Search Deputaion Department In Deputation Department table  ${dataDictionary}  ${value}

Delete Deputation Department
    [Documentation]  Deletes Deputation department entry.
    [Arguments]  ${dataDictionary}  ${entity}
    DeputationDepartment.Click On Delete Button  ${dataDictionary}  ${entity}
    DeputationDepartment.Confirm Delete Entry Popup Appeared
    DeputationDepartment.Delete Selected Entry  ${dataDictionary}

Verify Deputation Department Creation
    [Documentation]  Verifies creation of deputation department
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${dataDictionary}

Verify Deputation Department Updation
    [Documentation]  Verifies update in details of deputation department entry.
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${dataDictionary}

Verify Deputation Department Deletion
    [Documentation]  Verifies deletion of deputation department.
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${dataDictionary}

Open Pay Slip Configuration Page
    [Documentation]  Opens pay slip configuration page.
    PaySlipConfiguration.Go To pay Slip Configuration Page

Configure Pay Slip Details
    [Documentation]  Configures details of pay slip.
    [Arguments]  ${dataDictionary}
    PaySlipConfiguration.Configure Page/View Name  ${dataDictionary}
    PaySlipConfiguration.Configure Show Other Details  ${dataDictionary}
    PaySlipConfiguration.Configure Show Net Payable In Words  ${dataDictionary}
    PaySlipConfiguration.Configure Show DDO Details  ${dataDictionary}
    PaySlipConfiguration.Configure Show Birthday Message  ${dataDictionary}
    PaySlipConfiguration.Configure Show PF Balance  ${dataDictionary}
    PaySlipConfiguration.Configure Show Net Payable Rounded Off  ${dataDictionary}
    PaySlipConfiguration.Configure Show Gross Salary with Employer Contribution  ${dataDictionary}
    PaySlipConfiguration.Configure Show Loan Details  ${dataDictionary}
    PaySlipConfiguration.Configure Show Leave Balances  ${dataDictionary}
    PaySlipConfiguration.Configure Show LWP Days  ${dataDictionary}
    PaySlipConfiguration.Configure Language  ${dataDictionary}
    PaySlipConfiguration.Configure Show Salary Annexure  ${dataDictionary}

Save Pay Slip Configurations
    [Documentation]  Saves the configuration details of pay slip.
    [Arguments]  ${dataDictionary}
    PaySlipConfiguration.Save Configurations  ${dataDictionary}

Open Self Verification Configuration Page
    [Documentation]  Opens self verification configurations page.
    SelfVerification.Go To Self Verification Configuration Page

Configure Self Varification Details
    [Documentation]  Configures details of self verification configurations form.
    [Arguments]  ${dataDictionary}
    SelfVerification.Configure Self Varication Popup  ${dataDictionary}
    SelfVerification.Configure Self Varication Mandatory  ${dataDictionary}
    SelfVerification.Configure Send SMS Notification  ${dataDictionary}
    SelfVerification.Configure Send Email Notification  ${dataDictionary}
    SelfVerification.Configure Self Verification of Enrollment Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Personal Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Official Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Salary Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Other Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Nominee Detail  ${dataDictionary}

Save Self Varification Detatils
    [Documentation]  Saves self verification details.
    [Arguments]  ${dataDictionary}
    SelfVerification.Click On Save Button  ${dataDictionary}

Open Division Page
    [Documentation]  Opens division page.
    Division.Go To Division Page

Add New Division
    [Documentation]  Opens add new division form and fills detail into it.
    [Arguments]  ${dataDictionary}
    Division.Click On Add New Button  ${dataDictionary}
    Division.Fill Division Form  ${dataDictionary}
    Division.Save Details  ${dataDictionary}

Search Division
    [Documentation]  Searches Division name in division entries.
    [Arguments]  ${dataDictionary}  ${value}
    Division.Input Division Name Into Search Box  ${dataDictionary}  ${value}
    Division.Click Search Button  ${dataDictionary}

Edit Division Details
    [Documentation]  Edits details of previously created divison entry.
    [Arguments]  ${dataDictionary}
    Division.Click On Edit Button  ${dataDictionary}
    Division.Fill Division Form  ${dataDictionary["Edit Division"]}
    Division.Save Details  ${dataDictionary}

Verify Division Entry
    [Documentation]  Verifies entry of division.
    [Arguments]  ${dataDictionary}
    Division.Check For Division Entry In Division Table  ${dataDictionary}

Delete Division
    [Documentation]  Deletes entry of selected division.
    [Arguments]  ${dataDictionary}
    Division.Delete Division Entry  ${dataDictionary}

Verify Division Deletion
    [Documentation]  Veifies deletion in division entry.
    [Arguments]  ${dataDictionary}
    Division.Check For Division Deletion In Division Table  ${dataDictionary}

Open Designation Page
    [Documentation]  Opens designation page.
    Designation.Go To Designation Page

Add New Designation
    [Documentation]  Opens add new designation form and fills details into it.
    [Arguments]  ${dataDictionary}
    Designation.Click On Add New Designation Button  ${dataDictionary["Add Designation"]}
    Designation.Fill Designation Form  ${dataDictionary}
    Designation.Save Details  ${dataDictionary}

Search Designation Name
    [Documentation]  Search designation entry.
    [Arguments]  ${dataDictionary}  ${value}
    Designation.Input Designation Name Into Search Box  ${dataDictionary}  ${value}
    Designation.Click On Search Button  ${dataDictionary}

Select Designation From The Table
    [Documentation]  Selects given designation.
    [Arguments]  ${dataDictionary}  ${desingnationName}
    Designation.Select Designation Checkbox  ${dataDictionary}  ${desingnationName}

Edit Designation
    [Documentation]  Edits details of previously created designation.
    [Arguments]  ${dataDictionary}
    Designation.Click On Edit Button  ${dataDictionary}
    Designation.Edit Designation Details  ${dataDictionary}
    Designation.Save Details  ${dataDictionary}

Delete Designation
    [Documentation]  Deletes selected designation.
    [Arguments]  ${dataDictionary}
    Designation.Delete Designation Entry  ${dataDictionary}

Verify Designation Entry
    [Documentation]  Verifies created entry of designation.
    [Arguments]  ${dataDictionary}  ${value}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${dataDictionary}
    sleep  3s
    Designation.Check For Designation Entry In Designation Table  ${value}

Verify Designation Deletion
    [Documentation]  Verifies deletion of designation.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${dataDictionary}
    sleep  3s
    Designation.Check For Designation Deletion In Designation Table  ${dataDictionary}

Open Hospital Empanelment Page
    [Documentation]  Opens hospital empanelment page.
    HospitalEmpanelment.Go To Hospital Empanelment Page

Add New Hospital Empanelment
    [Documentation]  Opens add new hospital empanelment form and fills details into it.
    [Arguments]  ${dataDictionary}
    HospitalEmpanelment.Click On Add New Button  ${dataDictionary}
    HospitalEmpanelment.Fill Hospital Empanelment Details  ${dataDictionary}
    HospitalEmpanelment.Save Details  ${dataDictionary}

Search Hospital Empanelment
    [Documentation]  Searches hospital empanelment entry.
    [Arguments]  ${value}
    HospitalEmpanelment.Search For Hospital Empanelment  ${value}

Edit Hospital Empanelment
    [Documentation]  Edits details of previously created hospital empanelment entry.
    [Arguments]  ${dataDictionary}
    HospitalEmpanelment.Click On Edit Button  ${dataDictionary}
    HospitalEmpanelment.Edit Hospital Empanelment Details  ${dataDictionary}
    HospitalEmpanelment.Save Details  ${dataDictionary}

Delete Hospital Empanelment
    [Documentation]  Deletes hospital entry.
    [Arguments]  ${value}
    HospitalEmpanelment.Select Hospital Empanement  ${value}
    HospitalEmpanelment.Delete Entry

Verify Hospital Empanelment Entry
    [Documentation]  Verifies hospital empanelment entry.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    HospitalEmpanelment.Search For Hospital Empanelment  ${value}
    sleep  3s
    HospitalEmpanelment.Check For Hospital Empanelment Entry In Hospital Empanelment Table  ${value}

Verify Hospital Empanelment Deletion
    [Documentation]  Deletes hsopital empanelment entry.
    [Arguments]  ${value}
    HospitalEmpanelment.Search For Hospital Empanelment  ${value}
    sleep  3s
    HospitalEmpanelment.Check For Hospital Empanelment Deletion In Hospital Empanelment Table  ${value}

Open Qualification Page
    [Documentation]  Opens qualification page.
    Qualification.Go To Qualification Page

Add New Qualification
    [Documentation]  Opens add new qualification form and fills details into it.
    [Arguments]  ${dataDictionary}
    Qualification.Click On Add New Button  ${dataDictionary}
    Qualification.Fill Qualification Details  ${dataDictionary}
    Qualification.Save Details  ${dataDictionary}

Edit Qualification
    [Documentation]  Edits details of previuosly created qualification.
    [Arguments]  ${dataDictionary}  ${qualificationName}
    Qualification.Click On Edit Button  ${qualificationName}
    Qualification.Edit Qualification Details  ${dataDictionary}
    Qualification.Save Details  ${dataDictionary}

Search Qualification
    [Documentation]  Searches qualification entry.
    [Arguments]  ${value}
    Qualification.Search For Qualification  ${value}

Verify Qualification Entry
    [Documentation]  Verifies qualification entry.
    [Arguments]  ${value}
    Qualification.Search For Qualification  ${value}
    sleep   3s
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Check For Qualification Entry In Qualification Table  ${value}

Verify Qualification Deletion
    [Documentation]  Verifies deletion of qualification entry.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Search For Qualification  ${dataDictionary}
    sleep  3s
    Qualification.Check For Qualification Deletion In Qualification Table  ${dataDictionary}

Open Empanelled Officer Page
    [Documentation]  Opens empanelled officer page.
    EmpanelledOfficer.Go To Empanelled Officer Page

Add New Empanelled Officer
    [Arguments]  ${dataDictionary}
    EmpanelledOfficer.Click On Add New Button  ${dataDictionary}
    EmpanelledOfficer.Fill Empanelled Officer Details  ${dataDictionary}
    EmpanelledOfficer.Save Details  ${dataDictionary}

Edit Empanelled Officer
    [Documentation]  Edits details of previously created empanelled officer.
    [Arguments]  ${dataDictionary}  ${officerName}
    EmpanelledOfficer.Click On Edit Button  ${officerName}
    EmpanelledOfficer.Fill Empanelled Officer Details  ${dataDictionary["Edit Empanelled Officer"]}
    EmpanelledOfficer.Save Details  ${dataDictionary}

Search Empanelled Officer
    [Documentation]  Searches empanelled officer entry.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${value}

Verify Empanelled Officer Entry
    [Documentation]  Verifies entry of empanelled officer.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${value}
    EmpanelledOfficer.Check For Empanelled Officer Entry In Empanelled Officer Table  ${value}

Verify Empanelled Officer Deletion
    [Documentation]  Verifies deletion of empanelled officer.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${dataDictionary}
    sleep  3s
    EmpanelledOfficer.Check For Empanelled Officer Deletion In Empanelled Officer Table  ${dataDictionary}

Open Cadre Detail Page
    [Documentation]  Opens cadre detail page.
    CadreDetail.Go To Cadre Detail Page

Add New Cadre
    [Documentation]  Opens add new cadre detail page and fills details into it.
    [Arguments]  ${dataDictionary}
    CadreDetail.Click On Add New Cadre Button  ${dataDictionary}
    CadreDetail.Fill Cadre Details  ${dataDictionary}
    CadreDetail.Save Details  ${dataDictionary}

Edit Cadre Details
    [Documentation]  Edits details of previously created cadre.
    [Arguments]  ${dataDictionary}
    CadreDetail.Click On Edit Button  ${dataDictionary}
    CadreDetail.Fill Cadre Details  ${dataDictionary["Edit Cadre Detail"]}
    CadreDetail.Save Details  ${dataDictionary}

Delete Cadre Entry
    [Documentation]  Deletes cadre entry.
    [Arguments]  ${dataDictionary}  ${value}
    CadreDetail.Select Cadre  ${value}
    CadreDetail.Delete Cadre  ${dataDictionary}

Search For Cadre Entry
    [Documentation]  Search for cadre entry.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${value}

Verify Cadre Detail Entry
    [Documentation]  Verify entry of cadre.
    [Arguments]  ${value}
    HRMS_Keywords.Search For Cadre Entry  ${value}
    sleep  3s
    CadreDetail.Check For Cadre Detail Entry In Cadre Detail Table  ${value}

Verify Cadre Detail Deletion
    [Documentation]  Verify deletion of cadre.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${value}
    sleep  3s
    CadreDetail.Check For Cadre Detail Deletion In Cadre Detail Table  ${value}

Open Payment Type Page
    [Documentation]  Opens payment type page.
    PaymentType.Go To Payment Type Page

Add Payment Type
    [Documentation]  Opens add payment type form and fills details into it.
    [Arguments]  ${dataDictionary}
    PaymentType.Click On Add Payment Type Button  ${dataDictionary}
    PaymentType.Fill Payment Type Details  ${dataDictionary}
    PaymentType.Save Details  ${dataDictionary}

Search Payment Type
    [Documentation]  Search payment type entry.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${value}

Edit Payment Type
    [Documentation]  Edits details of payment type entry.
    [Arguments]  ${dataDictionary}
    PaymentType.Click On Edit Button  ${dataDictionary}
    PaymentType.Fill Payment Type Details  ${dataDictionary["Edit Payment Type"]}
    PaymentType.Save Details  ${dataDictionary}

Delete Payment Type Entry
    [Documentation]  Deletes payment type entry.
    [Arguments]  ${dataDictionary}  ${value}
    PaymentType.Select Payment Type  ${value}
    PaymentType.Delete Payment Type  ${dataDictionary}

Verify Payment Type Entry
    [Documentation]  Verifies entry of payment type.
    [Arguments]  ${value}
    HRMS_Keywords.Search Payment Type  ${value}
    sleep  3s
    PaymentType.Check For Payment Type Entry In Payment Type Table  ${value}

Verify Payment Type Deletion
    [Documentation]  Verifies deletion of payment type.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${value}
    sleep  3s
    PaymentType.Check For Payment Type Deletion In Payment Type Table  ${value}

Open Department Page
    [Documentation]  Opens department page.
    Department.Go To Department Page

Add New Department
    [Documentation]  Opens add new department page and fills details into it.
    [Arguments]  ${dataDictionary}
    Department.Click On Add New Department Button  ${dataDictionary}
    Department.Fill Department Details  ${dataDictionary}
    Department.Save Details  ${dataDictionary}

Edit Department Entry
    [Documentation]  Edits details of previously created department entry.
    [Arguments]  ${dataDictionary}
    Department.Click On Edit Button  ${dataDictionary}
    Department.Fill Department Details  ${dataDictionary["Edit Department"]}
    Department.Save Details  ${dataDictionary}

Search Department Entry
    [Documentation]  Searches department entry.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${value}

Delete Department Entry
    [Documentation]  Deletes department entry.
    [Arguments]  ${value}
    Department.Click On Delete Button  ${value}

Verify Department Entry
    [Documentation]  Verifies entry of department
    [Arguments]  ${value}
    HRMS_Keywords.Search Department Entry  ${value}
    sleep  3s
    Department.Check For Department Entry In Department Table  ${value}

Verify Department Deletion
    [Documentation]  Verifies deletion of department entry.
    [Arguments]  ${value}
    HRMS_Keywords.Search Department Entry  ${value}
    sleep  3s
    Department.Check For Department Deletion In Department Table  ${value}

Open Section Page
    [Documentation]  Opens section page.
    Section.Go To Section Page

Add New Section
    [Documentation]  Opens add new section form, fills details into it.
    [Arguments]  ${dataDictionary}
    Section.Click On Add New Button  ${dataDictionary}
    Section.Fill Section Details  ${dataDictionary}
    Section.Save Details  ${dataDictionary}

Edit Section Details
    [Documentation]  Edits details of previously created section entry.
    [Arguments]  ${dataDictionary}
    Section.Click On Edit Button  ${dataDictionary}
    Section.Fill Section Details  ${dataDictionary["Edit Section"]}
    Section.Save Details  ${dataDictionary}

Search Section Entry
    [Documentation]  Searches section entry in the list.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    Section.Search For Section  ${value}

Delete Section Entry
    [Documentation]  Selects and deletes given section entry.
    [Arguments]  ${dataDictionary}  ${value}
    Section.Select Section  ${value}
    Section.Delete Section  ${dataDictionary}

Verify Section Entry
    [Documentation]  Verifies section entry is created or updated.
    [Arguments]  ${value}
    HRMS_Keywords.Search Section Entry  ${value}
    sleep  3s
    Section.Check For Section Entry In Section Table  ${value}

Verify Section Deletion
    [Documentation] Verifies section entry is deleted.
    [Arguments]  ${value}
    HRMS_Keywords.Search Section Entry  ${value}
    sleep  3s
    Section.Check For Section Deletion In Section Table  ${value}

Open TA/DA Grade Page
    [Documentation]  Opens TA/DA grade page.
    TADAgrade.Go To TA/DA Grade Page

Add New TA/DA Grade
    [Documentation]  Adds new TA/DA grade entry.
    [Arguments]  ${dataDictionary}
    TADAgrade.Click On Add Button
    TADAgrade.Fill Details Into TA/DA Grade Form  ${dataDictionary}
    TADAgrade.Save Details

Edit TA/DA Grade
    [Documentation]  Edits TA/DA grade details.
    [Arguments]  ${dataDictionary}  ${value}
    TADAgrade.Click On Edit Button  ${value}
    TADAgrade.Edits Details Of TA/DA grade  ${dataDictionary}
    TADAgrade.Save Details

Revise TA/DA Grade
    [Documentation]  Revises TA/DA grade.
    [Arguments]  ${dataDictionary}  ${value}
    TADAgrade.Click On Revise Button  ${value}
    TADAgrade.Fill Revised Details  ${dataDictionary}
    TADAgrade.Save Details

Delete TA/DA Grade Entry
    [Documentation]  Deletes TA/DA grade.
    [Arguments]  ${value}
    TADAgrade.Click On Delete Button  ${value}
    TADAgrade.Delete TA/DA Grade

Search For TA/DA Grade Entry
    [Documentation]  Searches TA/DA Grade Entry In Search Box.
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    TADAgrade.Search For TA/DA grade  ${value}

Verify TA/DA grade Entry
    [Documentation]  Verifies that TA/DA grade entry is created or updated.
    [Arguments]  ${value}
    HRMS_Keywords.Search For TA/DA Grade Entry  ${value}
    sleep  3s
    TADAgrade.Check For TA/DA grade Entry In TA/DA grade Table  ${value}

Verify TA/DA grade Deletion
    [Documentation]  Verifies that TA/DA grade entry is deleted.
    [Arguments]  ${value}
    HRMS_Keywords.Search For TA/DA Grade Entry  ${value}
    sleep  3s
    TADAgrade.Check For TA/DA grade Deletion In TA/DA grade Table  ${value}

Open Grade Depandancy Page
    [Documentation]  Opens grade dependancy page.
    GradeDependancy.Go To Grade Dependancy Page

Add New Grade Dependancy
    [Documentation]  Adds new grade dependancy.
    [Arguments]  ${dataDictionary}
    GradeDependancy.Click On Add New Dependancy Button
    GradeDependancy.Fill Details  ${dataDictionary}
    GradeDependancy.Save Details

Edit Grade Dependancy
    [Documentation]  Edits grade dependancy details.
    [Arguments]  ${dataDictionary}
    GradeDependancy.Edit Grade Dependancy Details  ${dataDictionary}
    GradeDependancy.Save Details

Delete Grade Dependancy Entry
    [Documentation]  Deletes grade dependancy.
    [Arguments]  ${dataDictionary}
    GradeDependancy.Delete Grade Dependancy  ${dataDictionary}

Verify Grade Dependancy Entry
    [Documentation]  Verfies that grade dependancy entry is created or updated.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    sleep  3s
    GradeDependancy.Check For Grade Dependancy Entry In Grade Dependancy Table  ${dataDictionary}

Verify GradeDependancy Deletion
    [Documentation]  Verfies that grade dependancy entry is deleted.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    sleep  3s
    GradeDependancy.Check For Grade Dependancy Deletion In Grade Dependancy Table  ${dataDictionary}

Open TA/DA Rule Page
    [Documentation]  Opens TA/DA rule page.
    TADARule.Go To TA/DA Rule Page

Add New TA/DA Rule
    [Documentation]  Adds new TA/DA rule.
    [Arguments]  ${dataDictionary}
    TADARule.Click On Add New Button
    TADARule.Fill Details  ${dataDictionary}
    TADARule.Save Details

Edit TA/DA Rule Entry
    [Documentation]  Edits details of TA/DA rule.
    [Arguments]  ${dataDictionary}  ${value}
    TADARule.Click On Edit Button  ${value}
    TADARule.Edit Details  ${dataDictionary}
    TADARule.Save Details

Delete TA/DA Rule
    [Documentation]  Deletes TA/DA rule enrty.
    [Arguments]  ${value}
    TADARule.Delete Entry  ${value}

Verify TA/DA Rule Entry
    [Documentation]  Verifies that TA/DA rule entry is created or updated.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    #TADARule.Search For TA/DA Rule  ${dataDictionary}
    sleep  3s
    TADARule.Check For TA/DA Rule Entry In TA/DA Rule Table  ${dataDictionary}

Verify TA/DA Rule Deletion
    [Documentation]  Verifies that TA/DA rule entry is deleted.
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    #TADARule.Search For TA/DA Rule  ${dataDictionary}
    sleep  3s
    TADARule.Check For TA/DA Rule Deletion In TA/DA Rule Table  ${dataDictionary}

Open Salary Cycle Page
    [Documentation]  Opens salary cycyle page.
    SalaryCycle.Go To Salary Cycle Page

Add Salary Cycle
    [Documentation]  Opens add new salary cycle page and fills details into it.
    [Arguments]  ${dataDictionary}
    SalaryCycle.Click On Add Button
    SalaryCycle.Fill Salary Cycle Form  ${dataDictionary}
    SalaryCycle.Submit Details

Verify Salary Cycle
    [Documentation]  Check the new salary cycle page.
    SalaryCycle.Verify Salary Cycle Entry

Open Manual Attendance Page
    [Documentation]  Opens manual attendance page.
    ManualAttendance.Go To Manual Attendance Page

Open Review Attendance Page
    [Documentation]  Opens review attendance page.
    ReviewAttendance.Go To Review Attendance Page

Set Mark Attendance Criteria
    [Documentation]  Applies filters for listing of employees.
    [Arguments]  ${dataDictionary}  ${payGroup}=select all
    ManualAttendance.Click On Mark Attendance Button
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Employee Location  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    HRMS_Keywords.Select Designation  ${dataDictionary}
    HRMS_Keywords.Select Division  ${dataDictionary}
    HRMS_Keywords.Select Is Gazetted  ${dataDictionary}
    ManualAttendance.Apply Criteria
    sleep  2s

Set Review Attendance Criteria
    [Documentation]  Applies filters for listing of employees.
    [Arguments]  ${dataDictionary}  ${payGroup}=select all
    ReviewAttendance.Click On Review Attendance Button
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    #HRMS_Keywords.Select Employee Location  ${dataDictionary}      *** Need R&D on issue comes from this line ***
    ReviewAttendance.Apply Criteria
    sleep  2s

Apply Filters For Reviewed Attendance
    [Documentation]  Selects filters for marked attendance so that desired entry is listed.
    switch window   Review Salary Attendance
    ReviewAttendance.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary["Filters"]}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary["Filters"]}
    #HRMS_Keywords.Select Pay Group  ${dataDictionary["Filters"]}  ${payGroup}
    #HRMS_Keywords.Select Employee Location  ${dataDictionary["Filters"]}
    #ManualAttendance.Select Status  ${status}
    ReviewAttendance.Apply Filters
    sleep  15s

Submit Marked Attendance
    [Documentation]  Submits marked attendance of employee/employees.
    ManualAttendance.Select Employees
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Submit Reviewed Attendance
    [Documentation]  Submits reviewed attendance of employee/employees.
    ReviewAttendance.Select Employees
    ReviewAttendance.Click On mark attendance Button
    ReviewAttendance.Verify Submit Popup
    ReviewAttendance.Click On Ok Button

Apply Filters For Marked Attendance
    [Documentation]  Selects filters for marked attendance so that desired entry is listed.
    [Arguments]  ${status}  ${payGroup}=select all
    ReviewAttendance.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary["Filters"]}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary["Filters"]}
    HRMS_Keywords.Select Pay Group  ${dataDictionary["Filters"]}  ${payGroup}
    HRMS_Keywords.Select Employee Location  ${dataDictionary["Filters"]}
    ManualAttendance.Select Status  ${status}
    ManualAttendance.Apply Filters
    sleep  2s

Verify Marked Attendance
    [Documentation]  Does verification of the submitted attendance.
    [Arguments]  ${dataDictionary}  ${payGroup}
    Common_Keywords.Show Maximum Entries On Page
    sleep  3s
    ReviewAttendance.Click On Actions Button  Submitted  ${payGroup}
    ReviewAttendance.Verify Attendance

Verify Reviewed Mark Attendance
    [Documentation]  Does verify for marked attendance.
    Common_Keywords.Show Maximum Entries On Page
    sleep  3s


Approve Marked Attendance
    [Documentation]  Approves verified attendance.
    [Arguments]  ${payGroup}
    Common_Keywords.Show Maximum Entries On Page
    ManualAttendance.Click On Actions Button  Verified  ${payGroup}
    ManualAttendance.Choose Approve

Open Salary Detail Page
    [Documentation]  Opens salary detail page.
    SalaryDetail.Go To Salary Detail Page

Process Salary
    [Documentation]  Filters out the employees whose attendance are approved, process their salary.
    [Arguments]  ${dataDictionary}  ${payGroup}=Select One
    SalaryDetail.Click On Action Button
    sleep  4s
    SalaryDetail.Click On Process
    sleep  3s
    wait until page contains    ${dataDictionary["Financial_Year"]["Locator"]}
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    #SalaryDetail.Select Employee Location  ${dataDictionary}
    #HRMS_Keywords.Select Designation  ${dataDictionary}
    #HRMS_Keywords.Select Division  ${dataDictionary}
    #HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    SalaryDetail.Click On Process button
    SalaryDetail.Select All Employees
    SalaryDetail.Process Salary

Check Request Status
    [Documentation]  Check the Salary Processed status.
    SalaryDetail.Open Check Request Status

View Salary Slip
    [Documentation]  Filter out employee whose salary is processed, Opens his salary slip.
    [Arguments]  ${dataDictionary}
    Open Salary Detail Page
    SalaryDetail.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary}
    SalaryDetail.Select Employee Location  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    HRMS_Keywords.Select Status  Withheld
    SalaryDetail.Apply Filters
    HRMS_Keywords.Search Employee
    SalaryDetail.Click On Actions Button
    SalaryDetail.Open Salary Slip
    switch window  NEW
    SalaryDetail.Verify Salary Slip

Search Employee
    [Documentation]  Searches employee.
    SalaryDetail.Enter Employee Code In Search Box
    SalaryDetail.Click On Search Button

Lock Salary
    [Documentation]  Filter out employee whose salary is processed, Locks his salary.
    [Arguments]  ${dataDictionary}  ${payGroup}=Select One
    SalaryDetail.SearchEmployee
    SalaryDetail.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary}
    #SalaryDetail.Select Employee Location  ${dataDictionary}
    #HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    HRMS_Keywords.Select Status  Withheld
    SalaryDetail.Apply Filters
    #Common_Keywords.Show Maximum Entries On Page
    SalaryDetail.Select Employees  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']//thead//tr//th//input
    SalaryDetail.Click On Action Button
    SalaryDetail.Click On Lock
    SalaryDetail.Lock Salary



#Lock Salary
#    [Documentation]  Filter out employee whose salary is processed, Locks his salary.
#    [Arguments]  ${dataDictionary}  ${payGroup}=Select One
#    SalaryDetail.Open Filters
#    sleep  2s
#    HRMS_Keywords.Select Financial Year  ${dataDictionary}
#    sleep  2s
#    HRMS_Keywords.Select Month  ${dataDictionary}
#    SalaryDetail.Select Employee Location  ${dataDictionary}
#    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
#    HRMS_Keywords.Select Status  Withheld
#    SalaryDetail.Apply Filters
#    Common_Keywords.Show Maximum Entries On Page
#    SalaryDetail.Select Employees  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']//thead//tr//th//input
#    SalaryDetail.Click On Action Button
#    SalaryDetail.Click On Lock
#    SalaryDetail.Lock Salary

Open Salary Paybill Page
    [Documentation]  Opens salary paybill page.
    SalaryPaybill.Go To Salary Paybill Page

Add Salary Paybill
    [Documentation]  Opens add salary paybill form, fills details into it.
    [Arguments]  ${dataDictionary}
    SalaryPaybill.Click On Add Paybill button
    SalaryPaybill.Fill Salary Paybill Form  ${dataDictionary}
    SalaryPaybill.Submit Details

Select Financial Year
    [Documentation]  Selects Financial Year in Mark Attendance Filter. Fills current financial year if not specified by user.
    [Arguments]  ${dataDictionary}
    ${financialYear}  set variable if  ${SALARYFINANCIALYEAR} == None  ${currentFinancialYear}  ${SALARYFINANCIALYEAR}          ###""" If User does not gives Financial Year then current financial year will be selected"""
    set global variable  ${financialYear}
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
    sleep  2s

Select Month
    [Documentation]  Selects Salary Cycle Month in Mark Attendance Filter
    [Arguments]  ${dataDictionary}
    ${salaryCycleName}  set variable if  '${SALARYCYCLE}' == 'None'  ${currentSalaryCycleName}  ${SALARYCYCLE}                   ###""" If User does not gives Salary cycle then Current SAlary Cycle will be selected."""
    set global variable  ${salaryCycleName}
    FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}


Select Employee Location
    [Documentation]  Selects employee location from the dropdown.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field   ${dataDictionary["Employee Location"]}  ${EMPLOYEELOCATION}

Select Pay Group
    [Documentation]  Selects pay group from the dropdown.
    [Arguments]  ${dataDictionary}  ${payGroupName}
    FillFields.Input Value Into Field  ${dataDictionary["Pay Group"]}  ${payGroupName}

Select Payment unit
    [Documentation]  Selects payment unit from the dropdown.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Unit"]}  ${PAYMENTUNIT}

Select Designation
    [Documentation]  Selects designation from the dropdown.
    [Arguments]  ${dataDictionary}
    Run keyword if  '${DESIGNATION}' != 'None'  FillFields.Input Value Into Field  ${dataDictionary["Designation"]}  ${DESIGNATION}

Select Division
    [Documentation]  Selects division from the dropdown.
    [Arguments]  ${dataDictionary}
    Run keyword if  '${DIVISION}' != 'None'  FillFields.Input Value Into Field  ${dataDictionary["Division"]}  ${DIVISION}

Select Status
    [Documentation]  Selects status from the dropdown.
    [Arguments]  ${status}
    select from list by label  ${employeeStatus}  ${status}

Select Is Gazetted
    [Documentation]  Selects employee is gazatted or non gazatted.
    [Arguments]  ${dataDictionary}
    Run keyword if  '${ISGAZETTED}' != 'None'  FillFields.Input Value Into Field  ${dataDictionary["Is Gazetted"]}  ${ISGAZETTED}

#Approve Salary Paybill
#    [Documentation]  Does varofocation of paybill then approves it.
#    [Arguments]  ${dataDictionary}
#    SalaryPaybill.Go To Approve Salary Paybill Page
#    HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Pending
#    SalaryPaybill.Get Latest Paybill Number
#    SalaryPaybill.Search Paybill
#    sleep  3s
#    SalaryPaybill.Verify Paybill
#    sleep  5s
#   reload page
#    HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Verified and Forwarded for Approval
#    sleep  5s
#    SalaryPaybill.Approve Paybill

Approve Salary Paybill
    [Documentation]  Does varofocation of paybill then approves it.
    [Arguments]  ${dataDictionary}
    SalaryPaybill.Go To Approve Salary Paybill Page
    HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Pending
    SalaryPaybill.Get Latest Paybill Number
    SalaryPaybill.Search Paybill
    sleep  3s
    SalaryPaybill.Verify Paybill
    sleep  5s
    reload page
    HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Verified and Forwarded for Approval
    sleep  5s
    SalaryPaybill.Approve Paybill
    #HRMS_Keywords.VerifyApprovePaybill


Set Filters For Paybill
    [Documentation]  Selects filters for the lisiting of desired paybill.
    [Arguments]  ${dataDictionary}      ${status}
    SalaryPaybill.Open Filters
    HRMS_Keywords.Select Month  ${dataDictionary["Filter"]}
    #HRMS_Keywords.Select Pay Group  ${dataDictionary["Filter"]}  ${PAYGROUP}
    #HRMS_Keywords.Select Payment unit  ${dataDictionary["Filter"]}
    SalaryPaybill.Select Status  ${status}
    SalaryPaybill.Apply Filters

Select Multi Paygroups
    [Documentation]  Selects mulitple paybill from the dropdown. Takes locator of the dropdown as argument and selects paybills which are listed in "@{DISBURSEMENT_PAYGROUPS}" list.
    [Arguments]  ${Locator}
    click element  ${Locator}
    FOR  ${item}  IN  @{DISBURSEMENT_PAYGROUPS}
    \   click element  //label[contains(text(),'${item}')]

Select Multi Paybills
    [Documentation]  Selects paybill that is creted most recently from the dropdown.
    [Arguments]  ${Locator}
    click element  ${Locator}
    Sleep  2s
    input text  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[1]/div/input  ${latestPaybillCreated}
    select checkbox  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[2]/a/label/input
    ${status}  run keyword and return status  checkbox should be selected  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[2]/a/label/input
    run keyword if  ${status} == ${False}  Select Multi Paybills  ${Locator}
    capture page screenshot
    sleep  5s

Open Salary Disbursment Page
    [Documentation]  Opens salary disbursement page.
    SalaryDisbursment.Go To Salary Disbursment Page

Add Disbursement
    [Documentation]  Opens pending paybill filter, selects details into it and add disbursement.
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Click On Pending Paybills button
    SalaryDisbursment.Fill Pending Paybills Form  ${dataDictionary}
    SalaryDisbursment.Fill Salary Disbursment Form  ${dataDictionary}
    SalaryDisbursment.Submit Details

Add Disbursment button
    [Documentation]  Opens add salary disbursement form and fills details into it.
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Click On Add Disbursment button
    sleep  3s
    SalaryDisbursment.Fill Salary Disbursment Form  ${dataDictionary}
    SalaryDisbursment.Submit Details

Select Date
    [Documentation]  Selects date.
    [Arguments]  ${Disbursment}  ${currentDate}  ${currentMonth}  ${currentYear}
    Click Element    ${Disbursment}
    Select From List By label  //select[@class='ui-datepicker-year']   ${currentYear}
    Select From List By label  //select[@class='ui-datepicker-month']   ${currentMonth}
    page should contain element  //a[contains(text(),'${currentDate}')]
    page should contain element  //td[contains(@class,'ui-datepicker-today')]/child::a[contains(text(),'${currentDate}')]
    Click element     //td[contains(@class,'ui-datepicker-today')]/child::a[contains(text(),'${currentDate}')]
    sleep  2s

Approve Salary Disbursement
    [Documentation]  Does varification of salary disbursement then approves it.
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Go To Salary Disbursment Page
    SalaryDisbursment.Open Filters
    SalaryDisbursment.Select Filters  Pending
    SalaryDisbursment.Apply Filters
    sleep  4s
    #SalaryDisbursment.Verify Disbursement
    #SalaryDisbursment.Open Filters
    #SalaryDisbursment.Select Filters  Verified
    #SalaryDisbursment.Apply Filters
    #sleep  4s
    SalaryDisbursment.Approve Disbursement

Create Voucher
    [Documentation]  Selects filters for listing approvred salary dibursements and then create voucher.
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Open Filters
    SalaryDisbursment.Select Filters  Approved
    SalaryDisbursment.Apply Filters
    sleep  3s
    SalaryDisbursment.Click On Actions Button
    sleep  3s
    SalaryDisbursment.Select Voucher
    SalaryDisbursment.Save Voucher

Mark Attendance Of One Employee
    [Documentation]  Marks attendance of the top most employee in the list.
    [Arguments]  ${dataDictionary}
    ManualAttendance.Select First Employee
    ManualAttendance.Load Employee Code
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Mark Attendance Of Given Employee
    [Documentation]  Marks attendance of given employee code, employee code can be given from command line.
    [Arguments]  ${EmployeeCode}
    ManualAttendance.Search Employee  ${EmployeeCode}
    ManualAttendance.Select Given Employee  ${EmployeeCode}
    ManualAttendance.Load Employee Code                     ###""" Loads employee code of the enployee whose attendance is marked into a file."""
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Open Manage User Page
    [Documentation]  Opens manage user page.
    ManageUser.Go To Manage User Page

Impersonate into employee ID
    [Documentation]  Impersonates employee whose employee id is given.
    [Arguments]  ${EmployeeCode}
    ManageUser.Search Employee  ${EmployeeCode}
    #Leave_encash.Open Filters
    #Leave_encash.Apply Filters
    #Leave_encash.Select Employee
    ManageUser.Impersonate Employee

Encash Privilege Leave
    [Documentation]  Opens privilage leave encashment page from employee and fills details into it, submits it.
    LeaveEncashmentEmployee.Go To Employee Privilege Leave Encashment Page
    LeaveEncashmentEmployee.Click On Add Leave Encashment Button
    LeaveEncashmentEmployee.Submit Leave Encashment Application

Open Leave Encashment Page
    [Documentation]  Opens leave encashment page from admin.
    LeaveEncashmentAdmin.Go To Leave Encashment Page

Add Leave Encashment
    [Documentation]  Opens add leave encashment page and fills details into it.
    [Arguments]  ${dataDictionary}  ${EMPLOYEENAME}
    LeaveEncashmentAdmin.Click On Add Leave Encashment
    LeaveEncashmentAdmin.Fill Leave Encashment Details  ${dataDictionary}  ${EMPLOYEENAME}
    LeaveEncashmentAdmin.Submit Details

Verify Leave Encashment Entry
    [Documentation]  Verifies that applied leave encashment entry is listed in the table.
    [Arguments]  ${EMPLOYEENAME}
    LeaveEncashmentAdmin.Verify Leave Encashment Entry In Table  ${EMPLOYEENAME}

Open Leave Encashment Proposal Page
    [Documentation]  Opens leave encashment proposal page.
    LeaveEncashmentPropsal.Go To Leave Encashment Proposal Page

Add Leave Encashment Proposal
    [Documentation]  Opens add leave encashment proposal form, fills details into it and submits it.
    [Arguments]  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}
    LeaveEncashmentPropsal.Click On Add Button
    LeaveEncashmentPropsal.Fill Proposal Details  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}
    LeaveEncashmentPropsal.Submit Details
    LeaveEncashmentPropsal.Verify Details

Open Leave Encashment Proposal Approval Page
    [Documentation]  Opens leave encashment proposal approval page.
    ApproveLeaveEncashmentProposal.Go To Leave Encashment Proposal Approval Page

Select Leave Encashment Filters
    [Documentation]  Open and selects leave encashment filters.
    [Arguments]  ${EMPLOYEELOATION}
    ApproveLeaveEncashmentProposal.Open Filters
    sleep  3s
    ApproveLeaveEncashmentProposal.Select Employee Location  ${EMPLOYEELOATION}
    ApproveLeaveEncashmentProposal.Apply Filters

View Leave Encashment Proposal
    [Documentation]  Opens leave encashment proposal entry.
    [Arguments]  ${EMPLOYEENAME}
    ApproveLeaveEncashmentProposal.Search Employee  ${EMPLOYEENAME}
    ApproveLeaveEncashmentProposal.Click On View Button  ${EMPLOYEENAME}

Issue Order For Leave Encashment Proposal
    [Documentation]  Approves leave encashment proposal and then issues order.
    #---Approve The Record---
    ApproveLeaveEncashmentProposal.Edit the record
    ApproveLeaveEncashmentProposal.Click On Action Button
    ApproveLeaveEncashmentProposal.Approve Proposal
    #---Order Issue for Record---
    Open Leave Encashment Proposal Approval Page
    HRMS_Keywords.Select Leave Encashment Filters       ${EMPLOYEELOCATION}
    ApproveLeaveEncashmentProposal.Edit the record
    ApproveLeaveEncashmentProposal.Click On Action Button
    ApproveLeaveEncashmentProposal.Issue Order

Open Leave Encashment Process Page
    [Documentation]  Opens Leave Encashment process page.
    ProcessLeaveEncashment.Open Leave Encashment Process Page

Process Leave Encashment
    [Documentation]  Processes leave encashment.
    [Arguments]  ${currentFinancialYear}  ${currentMonth}  ${employeelocation}  ${paygroup}
    ProcessLeaveEncashment.Click On Action Button
    ProcessLeaveEncashment.Click On Process Link
    ProcessLeaveEncashment.Select Financial year  ${currentFinancialYear}
    Log Many    ${currentFinancialYear}
    ProcessLeaveEncashment.Select Month  ${currentMonth}
    #ProcessLeaveEncashment.Select Employee Location  ${employeelocation}
    #ProcessLeaveEncashment.Select Paygroup  ${paygroup}
    ProcessLeaveEncashment.Click On Process Button
    ProcessLeaveEncashment.Click On Final Process Button

Lock Leave Encshment
    [Documentation]  Locks leave encashment.
    ProcessLeaveEncashment.SearchEmployee
    ProcessLeaveEncashment.SelectEmployee    //div[@class='List']//table//thead//tr//th//input[@type='checkbox']
    ProcessLeaveEncashment.Click On Action Button
    ProcessLeaveEncashment.Click On Lock Button
    ProcessLeaveEncashment.Lock Salary

Open Leave Encashment Paybill Page
    [Documentation]  Opens Leave Emcashment paybill page.
    LeaveEncashmentPaybill.Go To Leave Encashment Paybill Page

Add Leave Encashment Paybill
    [Documentation]  Opens add paybill form and fills details into it.
    LeaveEncashmentPaybill.Click On Add Paybill Link

Do Logout Impersonate
    ManageUser.Go To Logout Link

Select Employee Payment Location
     [Documentation]  Selects employee location.
     set focus to element    //div[@id='s2id_UnitId']
     click element   //div[@id='s2id_UnitId']
     Log Many   ${dataDictionary}  ${Payment Unit}
     Input Text   //body/div[@id='select2-drop']/div[1]/input[1]   ${dataDictionary}  ${Payment Unit}

VerifyApprovePaybill
     [Documentation]  Verify the Approve paybill.
     Wait until page contains      //input[@id='SearchText']
     SalaryPaybill.Search Paybill
     HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Approved
     capture page screenshot

Check LE Request Status
    [Documentation]  Check the LE Processed status.
    ProcessLeaveEncashment.Open Check Request Status