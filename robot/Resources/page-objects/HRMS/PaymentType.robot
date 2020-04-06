*** Settings ***
Documentation    Add edit and delete Payment type. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/

*** Keywords ***
Go To Payment Type Page
    [Documentation]  Opens payment type page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Payment Type Button
    [Documentation]  Clicks on add payment button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add Payment Type"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Select Payment Type
    [Documentation]  Takes payment type as argument and selects checkbox related to it.
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Payment Type
    [Documentation]  Clicks on delete button, waits for the popup to be appeared and then clicks on OK button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Fill Payment Type Details
    [Documentation]  Fills details on payment type form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Description"]}  ${dataDictionary["Description"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Payment Type
    [Documentation]  Takes payment type as argument and searches it in the list.
    [Arguments]  ${value}
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Check For Payment Type Entry In Payment Type Table
    [Documentation]  Takes payment type as argument and checks that it is visible in the current page.
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Payment Type Deletion In Payment Type Table
    [Documentation]  Takes payment type as argument and checks that it is not visible in the current page.
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Description"]["Value"]}')]