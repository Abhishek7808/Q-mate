*** Settings ***
Documentation    Create, edit and delete cadre, For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/

*** Keywords ***
Go To Cadre Detail Page
    [Documentation]  Opens cadre detail page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Cadre Button
    [Documentation]  Clicks on add cadre button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add Cadre"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Select Cadre
    [Documentation]  Takes cadre name as argument and selects it from the list.
    [Arguments]  ${cadreName}
    click element  //td[contains(text(),'${cadreName}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Cadre
    [Documentation]  Clicks on delete button then clicks on ok button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}


Fill Cadre Details
    [Documentation]  Fills details into cadre detail form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Cadre Detail
    [Documentation]  Takes cadre name as arguement and searches it.
    [Arguments]  ${cadreName}
    input text  SearchText  ${cadreName}
    click button  BtnSearchfilter

Check For Cadre Detail Entry In Cadre Detail Table
    [Documentation]  Takes cadre name as arguement checks that it is visible in the table.
    [Arguments]  ${cadreName}
    Page should contain element  //td[contains(text(),'${cadreName}')]

Check For Cadre Detail Deletion In Cadre Detail Table
    [Documentation]  Takes cadre name as arguement checks that it is not visible in the table.
    [Arguments]  ${cadreName}
    Page should not contain element  //td[contains(text(),'${cadreName}')]