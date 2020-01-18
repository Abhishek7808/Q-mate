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
    Designation.Search For Designation  ${formField}
    sleep  3s
    Designation.Check For Designation Entry In Designation Table  ${formField}

Verify Designation Deletion
    [Arguments]  ${formField}
    Designation.Search For Designation  ${formField}
    sleep  3s
    Designation.Check For Designation Deletion In Designation Table  ${formField}

Verify Hospital Empanelment Entry
    [Arguments]  ${formField}
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
    Qualification.Search For Qualification  ${formField}
    sleep  3s
    Qualification.Check For Qualification Entry In Qualification Table  ${formField}