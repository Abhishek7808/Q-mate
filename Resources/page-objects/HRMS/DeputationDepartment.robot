*** Settings ***
Documentation    Suite description

*** Keywords ***
Go To Deputation Department Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/DeputationDepartment

Click On Add New Button
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Add New"]}

Search Deputaion Department In Deputation Department table
    [Arguments]  ${formField}  ${value}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${Value}
    FillFields.Input Value Into Field  ${formField["Search button"]}

Open Deputation Department Filters
    [Arguments]  ${formField}
    click element  ${formField["Filter Button"]["Locator1"]}
    ${status}  run keyword and return status  page should contain  Search Filter
    run keyword if  ${status} == ${False}  click element  ${formField["Filter Button"]["Locator2"]}

Select Governing Authorities Filter
    [Arguments]  ${formField}  ${value}
    FillFields.Input Value Into Field  ${formField["Governing Authorities Filter"]}  ${value}

Select State Filter
    [Arguments]  ${formField}  ${value}
    FillFields.Input Value Into Field  ${formField["State"]}  ${value}

Select City Filter
    [Arguments]  ${formField}  ${value}
    FillFields.Input Value Into Field  ${formField["City"]}  ${value}

Apply Filters
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Apply Filter Button"]}

Select Deputation Department Checkbox
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Action Checkbox"]}  ${formField["Action Checkbox"]["Value"]}

Click On Edit Button
    [Arguments]  ${formField}
    Wait Until Keyword Succeeds    5s    250ms  click element  //td[contains(text(),'${formField["Name"]["Value"]}')]/following-sibling::${formField["Edit"]["Locator"]["Locator1"]}
    sleep  1s
    click element  //td[contains(text(),'${formField["Name"]["Value"]}')]/following-sibling::${formField["Edit"]["Locator"]["Locator2"]}

Click On Delete Button
    [Arguments]  ${formField}  ${entity}
    Wait Until Keyword Succeeds    5s    250ms  click element  //td[contains(text(),'${entity}')]/following-sibling::${formField["Delete"]["Locator"]["Locator1"]}
    sleep  1s
    click element  //td[contains(text(),'${entity}')]/following-sibling::${formField["Delete"]["Locator"]["Locator2"]}

Confirm Delete Entry Popup Appeared
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Ok"]}

Fill Deputation Department Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Governing Authorities"]}  ${formField["Governing Authorities"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Address"]}  ${formField["Address"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Email"]}  ${formField["Email"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Contact No"]}  ${formField["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${formField["State"]}  ${formField["State"]["Value"]}
    FillFields.Input Value Into Field  ${formField["City"]}  ${formField["City"]["Value"]}

Submit Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Save"]}

Check For The Deputation Department Entry in Enquiry Decision Table
    [Arguments]  ${formField}
    ${status}  run keyword and return status  Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]
    log  ${status}