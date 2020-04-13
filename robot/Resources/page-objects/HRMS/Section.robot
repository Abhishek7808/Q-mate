*** Settings ***
Documentation    Add, edit and delete sections. For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/

*** Keywords ***
Go To Section Page
    [Documentation]  Opens section page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Documentation]  Clicks on add new button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add Section"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Fill Section Details
    [Documentation]  Fills details in the section form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Code"]}  ${dataDictionary["Code"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Active"]}  ${dataDictionary["Is Active"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Section
    [Documentation]  Takes section name as argument and searches it.
    [Arguments]  ${sectionName}
    input text  SearchText  ${sectionName}
    click button  BtnSearchfilter

Select Section
    [Documentation]  Takes section name as argument and selects it.
    [Arguments]  ${sectionName}
    sleep  3s
    select checkbox  //td[contains(text(),'${sectionName}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Section
    [Documentation]  Clicks on delete button and then clicks on OK button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page

Check For Section Entry In Section Table
    [Documentation]  Takes section name as argument and checks that it is visible on the current page.
    [Arguments]  ${sectionName}
    Page should contain element  //td[contains(text(),'${sectionName}')]

Check For Section Deletion In Section Table
    [Documentation]  Takes section name as argument and checks that it is not visible on the current page.
    [Arguments]  ${sectionName}
    Page should not contain element  //td[contains(text(),'${sectionName}')]

