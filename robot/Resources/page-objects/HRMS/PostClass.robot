*** Settings ***
Documentation    Add, edit and delete post class. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-post-class/

*** Variables ***
${PostClass_URL} =  HRM/PostConfig/PostClassIndex
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
Go To ERP Page Post Class Page
    [Documentation]  Opens Post class page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click Add New Post Class
    [Documentation]  Clicks on add new button.
    wait until page contains  Post Class
    Click link  ${Add_New}

Fill Post Class Name
    [Documentation]  Takes employee name as argument and fills it in the name field.
    [Arguments]  ${Employee_Name}
    wait until element is visible  ${Name_Entry}
    click element  ${Name_Entry}
    sleep  1s
    input text  id=Name  ${Employee_Name}
    sleep  1s

Select Class Group
    [Documentation]  Takes class group as argument and fills it in the class group field.
    [Arguments]  ${Class_Group}
    select from list by index  ${Class_Group_URL}  ${Class_Group}

Fill Seniority Level
    [Documentation]  Takes seniority level as argument and fills it in the seniority level field.
    [Arguments]  ${Seniority_Level}
    input text  ${Seniority_Level_URL}  ${Seniority_Level}
    click button  ${Save_Button}

Check Post Class Is Added
    [Documentation]  Takes post class name as argument and checks that it is visible on the current page.
    [Arguments]  ${Name}
    wait until page contains  Action
    sleep  2s
    page should contain  ${Name}

Get Number of Rows of Post Class Table
    [Documentation]  Gets total number of rows in the post class entries table.
    ${rows}  get element count  ${Table_URL}/tbody/tr
    set global variable  ${rows}

Update The Post Class Entry
    [Documentation]  Takes post class name, seniority level and class group as argument. Opens details of given post class and edits given details.
    [Arguments]  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${rows}]/td[6]/div/a
    Fill Post Class Name  ${New_Post_Class_Name}
    Select Class Group  ${Class_Group}
    Fill Seniority Level  ${Seniority_Level}

Delete the Post Class Entry
    [Documentation]  Click on delete buttonn then clicks on OK button.
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${rows}]/td[6]/a
    wait until page contains  Delete
    sleep  1s
    click button  ${OK_Button}

Verify The Deleted Element
    [Documentation]  Takes post class name as argument and checks that it is not visible on the current page.
    [Arguments]  ${Name}
    wait until page contains  Action
    sleep  2s
    page should not contain  ${Name}

Click Add New Post Class Button
    [Documentation]  Clicks on add new post class button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Post Class"]}

Click On Filter Button
    [Documentation]  Clicks on open filter button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Filter"]}

Select Type In Dropdown
    [Documentation]  Takes class group as argument and selects it from the dropdown.
    [Arguments]  ${dataDictionary}  ${classGroup}
    FillFields.Input Value Into Field  ${dataDictionary["Filter Type"]}  ${classGroup}

Apply Filter
    [Documentation]  Clicks on apply filter button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Apply Filter"]}

Search Post Class
    [Documentation]  Takes post class name
    [Arguments]  ${dataDictionary}   ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}   ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Click On Update Button
    [Documentation]  Clicks on update button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Update"]}

Fill Post Class Details
    [Documentation]  Fills details in post class form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Class Group"]}  ${dataDictionary["Class Group"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Seniority Level"]}  ${dataDictionary["Seniority Level"]["Value"]}

Submit Details
    [Documentation]  Clicks on submit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Click On Delete Button
    [Documentation]  Clicks on delete button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete Post Class"]}

Confirm Delete Entry Popup Appeared
    [Documentation]  Checks that delete entry popup text is appeared on the page.
    page should contain   Do you really want to Delete this Post Class ??

Delete Selected Entry
    [Documentation]  Clicks on Ok button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Check For The Post Class Entry In The Post Class Table
    [Documentation]  Checks that post class entry is listed on the page.
    [Arguments]  ${dataDictionary}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]