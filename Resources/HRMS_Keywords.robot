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

*** Keywords ***
Open Post Class Page
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
    [Arguments]  ${formField}
    PostClass.Click Add New Post Class Button  ${formField}
    PostClass.Fill Post Class Details  ${formField}
    PostClass.Submit Details  ${formField}

Filter Post Classes By Class Group
    [Arguments]  ${formField}  ${value}
    PostClass.Click On Filter Button  ${formField}
    PostClass.Select Type In Dropdown  ${formField}  ${value}
    PostClass.Apply Filter  ${formField}

Search Post Class By Name
    [Arguments]  ${formField}  ${value}
    PostClass.Search Post Class  ${formField}  ${value}

Update Post Class Details
    [Arguments]  ${formField}
    PostClass.Click On Update Button  ${formField}
    PostClass.Fill Post Class Details  ${formField["Update Post Class"]}
    PostClass.Submit Details  ${formField}

Delete Post Class
    [Arguments]  ${formField}
    PostClass.Click On Delete Button  ${formField}
    PostClass.Confirm Delete Entry Popup Appeared
    PostClass.Delete Selected Entry  ${formField}

Open Entertainment Declaration Page
    EntertainmentDeclaration.Go To Entertainment Declaration Page

Declare Tea Rate Definition
    [Arguments]  ${formField}
    EntertainmentDeclaration.Click On Declare Button  ${formField}
    EntertainmentDeclaration.Fill Entertainment Declaration Details  ${formField}
    EntertainmentDeclaration.Submit Details  ${formField}

Search Tea Rate Definition
    [Arguments]  ${formField}
    EntertainmentDeclaration.Search Tea Rate Definition In Entertainment Declaration Table  ${formField}

Apply Tea Rate Filter
    [Arguments]  ${formField}
    EntertainmentDeclaration.Click On Filter  ${formField}
    EntertainmentDeclaration.Select Type In Dropdown  ${formField}
    EntertainmentDeclaration.Apply Filter  ${formField}

Edit Tea Rate Definition
    [Arguments]  ${formField}
    EntertainmentDeclaration.Click On Edit Button  ${formField}
    EntertainmentDeclaration.Fill Entertainment Declaration Details  ${formField["Edit Tea Rate Definition"]}
    EntertainmentDeclaration.Submit Details  ${formField}

Delete Tea Rate Definition
    [Arguments]  ${formField}
    EntertainmentDeclaration.Click On Delete Button  ${formField}
    EntertainmentDeclaration.Confirm Delete Entry Popup Appeared
    EntertainmentDeclaration.Delete Selected Entry  ${formField}

Verify Tea Rate Entry
    [Arguments]  ${formField}
    EntertainmentDeclaration.Check For The New Entry In Entertainment Declaration Table  ${formField}

Verify Tea Rate Deletion
    [Arguments]  ${formField}
    EntertainmentDeclaration.Check For The Deletion In Entertainment Declaration Table  ${formField}

Verify Post Class Creation
    [Arguments]  ${formField}
    PostClass.Check For The Post Class Entry In The Post Class Table  ${formField}

Verify Post Class deletion
    [Arguments]  ${formField}
    PostClass.Check For The Post Class Entry In The Post Class Table  ${formField}

Open Enquiry Decision Page
    EnquiryDecision.Go To Enquiry Decision Page

Add New Enquiry Decision Type
    [Arguments]  ${formField}
    EnquiryDecision.Click On Add New Button  ${formField}
    EnquiryDecision.Fill Enquiry Decision Details  ${formField}
    EnquiryDecision.Submit Details  ${formField}

Verify Enquiry Decision Type Creation
    [Arguments]  ${formField}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${formField}

Edit Enquiry Decision Type
    [Arguments]  ${formField}
    EnquiryDecision.Click On Edit Button  ${formField}
    EnquiryDecision.Fill Enquiry Decision Details  ${formField["Edit Enquiry Decision Type"]}
    EnquiryDecision.Submit Details  ${formField}

Verify Enquiry Decision Type Updatation
    [Arguments]  ${formField}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${formField}

Select Enquiry Decision Type
    [Arguments]  ${formField}
    EnquiryDecision.Search Enquiry Decision  ${formField}
    EnquiryDecision.Select Enquiry Decision Checkbox  ${formField}

Delete Enquiry Decision Type
    [Arguments]  ${formField}
    EnquiryDecision.Click On Delete Button  ${formField}
    EnquiryDecision.Confirm Delete Entry Popup Appeared
    EnquiryDecision.Delete Selected Entry  ${formField}

Verify Enquiry Decision Type Deletion
    [Arguments]  ${formField}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${formField}

Open Deputation Department Page
    DeputationDepartment.Go To Deputation Department Page

Add New Deputation Department
    [Arguments]  ${formField}
    DeputationDepartment.Click On Add New Button  ${formField}
    DeputationDepartment.Fill Deputation Department Details  ${formField}
    DeputationDepartment.Submit Details  ${formField}

Filter Deputation Departments
    [Arguments]  ${formField}  ${value}=${formField}
    DeputationDepartment.Open Deputation Department Filters  ${formField}
    DeputationDepartment.Select Governing Authorities Filter  ${formField}  ${value["Governing Authorities"]["Value"]}
    DeputationDepartment.Select State Filter  ${formField}  ${value["State"]["Value"]}
    DeputationDepartment.Select City Filter  ${formField}  ${value["City"]["Value"]}
    DeputationDepartment.Apply Filters  ${formField}

Edit Deputation Department Details
    [Arguments]  ${formField}
    DeputationDepartment.Click On Edit Button  ${formField}
    switch window  NEW
    DeputationDepartment.Fill Deputation Department Details  ${formField["Edit Deputation Department"]}
    DeputationDepartment.Submit Details  ${formField}

Search Deputaion Department
    [Arguments]  ${formField}  ${value}
    DeputationDepartment.Search Deputaion Department In Deputation Department table  ${formField}  ${value}

Delete Deputation Department
    [Arguments]  ${formField}  ${entity}
    DeputationDepartment.Click On Delete Button  ${formField}  ${entity}
    DeputationDepartment.Confirm Delete Entry Popup Appeared
    DeputationDepartment.Delete Selected Entry  ${formField}

Verify Deputation Department Creation
    [Arguments]  ${formField}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${formField}

Verify Deputation Department Updation
    [Arguments]  ${formField}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${formField}

Verify Deputation Department Deletion
    [Arguments]  ${formField}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${formField}

Open Pay Slip Configuration Page
    PaySlipConfiguration.Go To pay Slip Configuration Page

Configure Pay Slip Details
    [Arguments]  ${formField}
    PaySlipConfiguration.Configure Page/View Name  ${formField}
    PaySlipConfiguration.Configure Show Other Details  ${formField}
    PaySlipConfiguration.Configure Show Net Payable In Words  ${formField}
    PaySlipConfiguration.Configure Show DDO Details  ${formField}
    PaySlipConfiguration.Configure Show Birthday Message  ${formField}
    PaySlipConfiguration.Configure Show PF Balance  ${formField}
    PaySlipConfiguration.Configure Show Net Payable Rounded Off  ${formField}
    PaySlipConfiguration.Configure Show Gross Salary with Employer Contribution  ${formField}
    PaySlipConfiguration.Configure Show Loan Details  ${formField}
    PaySlipConfiguration.Configure Show Leave Balances  ${formField}
    PaySlipConfiguration.Configure Show LWP Days  ${formField}
    PaySlipConfiguration.Configure Language  ${formField}
    PaySlipConfiguration.Configure Show Salary Annexure  ${formField}

Save Pay Slip Configurations
    [Arguments]  ${formField}
    PaySlipConfiguration.Save Configurations  ${formField}

Verify Division Entry
    [Arguments]  ${formField}
    Division.Check For Division Entry In Division Table  ${formField}

Verify Division Deletion
    [Arguments]  ${formField}
    Division.Check For Division Deletion In Division Table  ${formField}

Verify Designation Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${formField}
    sleep  3s
    Designation.Check For Designation Entry In Designation Table  ${formField}

Verify Designation Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${formField}
    sleep  3s
    Designation.Check For Designation Deletion In Designation Table  ${formField}

Verify Hospital Empanelment Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    HospitalEmpanelment.Search For Hospital Empanelment  ${formField}
    sleep  3s
    HospitalEmpanelment.Check For Hospital Empanelment Entry In Hospital Empanelment Table  ${formField}

Verify Hospital Empanelment Deletion
    [Arguments]  ${formField}
    Designation.Search For Hospital Empanelment  ${formField}
    sleep  3s
    Designation.Check For Hospital Empanelment Deletion In Hospital Empanelment Table  ${formField}

Verify Qualification Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Search For Qualification  ${formField}
    sleep  3s
    Qualification.Check For Qualification Entry In Qualification Table  ${formField}

Verify Qualification Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Search For Qualification  ${formField}
    sleep  3s
    Qualification.Check For Qualification Deletion In Qualification Table  ${formField}

Verify Empanelled Officer Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${formField}
    sleep  3s
    EmpanelledOfficer.Check For Empanelled Officer Entry In Empanelled Officer Table  ${formField}

Verify Empanelled Officer Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${formField}
    sleep  3s
    EmpanelledOfficer.Check For Empanelled Officer Deletion In Empanelled Officer Table  ${formField}

Verify Cadre Detail Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${formField}
    sleep  3s
    CadreDetail.Check For Cadre Detail Entry In Cadre Detail Table  ${formField}

Verify Cadre Detail Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${formField}
    sleep  3s
    CadreDetail.Check For Cadre Detail Deletion In Cadre Detail Table  ${formField}

Verify Payment Type Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${formField}
    sleep  3s
    PaymentType.Check For Payment Type Entry In Payment Type Table  ${formField}

Verify Payment Type Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${formField}
    sleep  3s
    PaymentType.Check For Payment Type Deletion In Payment Type Table  ${formField}

Verify Department Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${formField}
    sleep  3s
    Department.Check For Department Entry In Department Table  ${formField}

Verify Department Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${formField}
    sleep  3s
    Department.Check For Department Deletion In Department Table  ${formField}

Verify Section Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Section.Search For Section  ${formField}
    sleep  3s
    Section.Check For Section Entry In Section Table  ${formField}

Verify Section Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    Section.Search For Section  ${formField}
    sleep  3s
    Section.Check For Section Deletion In Section Table  ${formField}

Verify TA/DA grade Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    TADAgrade.Search For TA/DA grade  ${formField}
    sleep  3s
    TADAgrade.Check For TA/DA grade Entry In TA/DA grade Table  ${formField}

Verify TA/DA grade Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    TADAgrade.Search For TA/DA grade  ${formField}
    sleep  3s
    TADAgrade.Check For TA/DA grade Deletion In TA/DA grade Table  ${formField}

Verify Grade Dependancy Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    sleep  3s
    GradeDependancy.Check For Grade Dependancy Entry In Grade Dependancy Table  ${formField}

Verify GradeDependancy Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    sleep  3s
    GradeDependancy.Check For Grade Dependancy Deletion In Grade Dependancy Table  ${formField}

Verify TA/DA Rule Entry
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    #TADARule.Search For TA/DA Rule  ${formField}
    sleep  3s
    TADARule.Check For TA/DA Rule Entry In TA/DA Rule Table  ${formField}

Verify TA/DA Rule Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    #TADARule.Search For TA/DA Rule  ${formField}
    sleep  3s
    TADARule.Check For TA/DA Rule Deletion In TA/DA Rule Table  ${formField}