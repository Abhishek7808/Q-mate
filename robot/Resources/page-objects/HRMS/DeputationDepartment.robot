*** Settings ***
Documentation    Create, edit, delete deputation department. For more info visit http://support.e-connectsolutions.com/erp/how-to/deputation-department/

*** Keywords ***
Go To Deputation Department Page
    [Documentation]  Opens deputation department page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Documentation]  Clicks on add new button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Search Deputaion Department In Deputation Department table
    [Documentation]  Takes department name as argument and searches it in the list.
    [Arguments]  ${dataDictionary}  ${departmentName}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${departmentName}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Open Deputation Department Filters
    [Documentation]  Clicks on open filters button.
    [Arguments]  ${dataDictionary}
    click element  ${dataDictionary["Filter Button"]["Locator1"]}
    ${status}  run keyword and return status  page should contain  Search Filter
    run keyword if  ${status} == ${False}  click element  ${dataDictionary["Filter Button"]["Locator2"]}

Select Governing Authorities Filter
    [Documentation]  Takes governing authority name as argument and selects it from the dropdown.
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Governing Authorities Filter"]}  ${value}

Select State Filter
    [Documentation]  Takes state name as argument and selects it from the dropdown.
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["State"]}  ${value}

Select City Filter
    [Documentation]  Takes city name as argument and selects it from the dropdown.
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${value}

Apply Filters
    [Documentation]  Clicks on apply filter button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Apply Filter Button"]}

Select Deputation Department Checkbox
    [Documentation]  Selects checkbox of the desired department from the listing.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Action Checkbox"]}  ${dataDictionary["Action Checkbox"]["Value"]}

Click On Edit Button
    [Documentation]  Clicks on the edit button of the desired deputation
    [Arguments]  ${dataDictionary}
    Wait Until Keyword Succeeds    5s    250ms  click element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]/following-sibling::${dataDictionary["Edit"]["Locator"]["Locator1"]}
    sleep  1s
    click element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]/following-sibling::${dataDictionary["Edit"]["Locator"]["Locator2"]}

Click On Delete Button
    [Documentation]  Takes name of the deputation department as argument and clicks on actions button and then clicks on delete button.
    [Arguments]  ${dataDictionary}  ${entity}
    Wait Until Keyword Succeeds    5s    250ms  click element  //td[contains(text(),'${entity}')]/following-sibling::${dataDictionary["Delete"]["Locator"]["Locator1"]}
    sleep  1s
    click element  //td[contains(text(),'${entity}')]/following-sibling::${dataDictionary["Delete"]["Locator"]["Locator2"]}

Confirm Delete Entry Popup Appeared
    [Documentation]  Checks that current page contains Delete Entry Popup text.
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Documentation]  Clicks on OK button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Fill Deputation Department Details
    [Documentation]  Fills details into deputation department form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Governing Authorities"]}  ${dataDictionary["Governing Authorities"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Address"]}  ${dataDictionary["Address"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Email"]}  ${dataDictionary["Email"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Contact No"]}  ${dataDictionary["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["State"]}  ${dataDictionary["State"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${dataDictionary["City"]["Value"]}

Submit Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Check For The Deputation Department Entry in Enquiry Decision Table
    [Documentation]  Checks that current page contains name of the deputation department.
    [Arguments]  ${dataDictionary}
    ${status}  run keyword and return status  Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]
    log  ${status}