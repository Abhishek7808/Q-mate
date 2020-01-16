*** Settings ***
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
#Resource  ${PAGE OBJECTS}/LeftNavigation.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ./ERP_Keywords.robot
Resource  ${PAGE OBJECTS}/HRMS/EntertainmentDeclaration.robot
Resource  ${PAGE OBJECTS}/HRMS/EnquiryDecision.robot


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
    DeputationDepartment.