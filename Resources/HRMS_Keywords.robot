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
Resource  ${PAGE OBJECTS}/HRMS/TADARule.robot


*** Keywords ***
Open Post Class Page
    PostClass.Go To ERP Page Post Class Page

Add New Class
    PostClass.Click Add New Post Class
    
Fill Post Class Details
    [Arguments]  ${Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
    PostClass.Fill Post Class Name  ${Post_Class_Name}
    PostClass.Select Class Group  ${Class_Group}
    PostClass.Fill Seniority Level  ${Seniority_Level}
    
Check Post Class Entry
    [Arguments]  ${Post_Class_Name}
    PostClass.Check Post Class Is Added  ${Post_Class_Name}

Update The Added Post Class Element
    [Arguments]  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
    PostClass.Get Number of Rows of Post Class Table
    PostClass.Update The Post Class Entry  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
    Check Post Class Entry  ${New_Post_Class_Name}

Delete The Added Post Class Element
    [Arguments]  ${New_Post_Class_Name}
    PostClass.Get Number of Rows of Post Class Table
    PostClass.Delete The Post Class Entry
    PostClass.Verify The Deleted Element  ${New_Post_Class_Name}
    #Check Post Class Entry  ${New_Post_Class_Name}

HRMS_Keywords.Verify Tea Rate Entry
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

Verify Enquiry Decision Type Creation
    [Arguments]  ${formField}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${formField}

Verify Enquiry Decision Type Updatation
    [Arguments]  ${formField}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${formField}

Verify Enquiry Decision Type Deletion
    [Arguments]  ${formField}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${formField}

Verify Deputation Department Creation
    [Arguments]  ${formField}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${formField}

Verify Deputation Department Updation
    [Arguments]  ${formField}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${formField}

Verify Deputation Department Deletion
    [Arguments]  ${formField}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${formField}

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
    TADARule.Search For TA/DA Rule  ${formField}
    sleep  3s
    TADARule.Check For TA/DA Rule Entry In TA/DA Rule Table  ${formField}

Verify TA/DA Rule Deletion
    [Arguments]  ${formField}
    Common_Keywords.Show Maximum Entries on Page
    TADARule.Search For TA/DA Rule  ${formField}
    sleep  3s
    TADARule.Check For TA/DA Rule Deletion In TA/DA Rule Table  ${formField}