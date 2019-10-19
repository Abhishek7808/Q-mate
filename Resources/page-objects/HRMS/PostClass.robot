*** Variables ***
${PostClass_URL} =  /PostConfig/PostClassIndex
${Table_URL} =  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']
${Add_New} =  id=modals-bootbox-custom
${Name_Entry} =  xpath=//input[@id='Name']
${Name_Employee} =  Sitaram
${Name_Employee_Update} =  ramadheer
${Class_Group_URL} =  //select[@id='CLASS_GROUP_ID']
${Seniority_Level_URL} =  //input[@id='SeniorityLevel']
${Save_Button} =  //input[@id='btnSave']
${OK_Button} =  //button[contains(text(),'OK')]

*** Keywords ***
Go To Post Class Page
     go to  ${BASE_URL.${ENVIRONMENT}}${HRMS.link}${PostClass_URL}


Click Add New Post Class
     wait until page contains  Post Class
     Click link  ${Add_New}

Fill Post Class Name
    [Arguments]  ${Employee_Name}
    wait until element is visible  ${Name_Entry}
    click element  ${Name_Entry}
    sleep  1s
    input text  id=Name  ${Employee_Name}
    sleep  1s

Select Class Group
     [Arguments]  ${Class_Group}
     select from list by index  ${Class_Group_URL}  ${Class_Group}

Fill Seniority Level
    [Arguments]  ${Seniority_Level}
    input text  ${Seniority_Level_URL}  ${Seniority_Level}
    click button  ${Save_Button}

Check Post Class Is Added
    [Arguments]  ${Name}
    wait until page contains  Action
    sleep  2s
    page should contain  ${Name}

Get Number of Rows of Post Class Table
    ${rows}  get element count  ${Table_URL}/tbody/tr
    set global variable  ${rows}

Update The Post Class Entry
    [Arguments]  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${rows}]/td[6]/div/a
    Fill Post Class Name  ${New_Post_Class_Name}
    Select Class Group  ${Class_Group}
    Fill Seniority Level  ${Seniority_Level}

Delete the Post Class Entry
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${rows}]/td[6]/a
    wait until page contains  Delete
    sleep  1s
    click button  ${OK_Button}

Verify The Deleted Element
    [Arguments]  ${Name}
    wait until page contains  Action
    sleep  2s
    page should not contain  ${Name}



