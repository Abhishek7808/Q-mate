*** Settings ***
Documentation    Create, edit, delete deputation department. For more info visit http://support.e-connectsolutions.com/erp/how-to/deputation-department/

*** Variables ***
${pageUrl}  HRM/DeputationDepartment

*** Keywords ***
Go To Deputation Department Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Search Deputaion Department In Deputation Department table
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${Value}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Open Deputation Department Filters
    [Arguments]  ${dataDictionary}
    click element  ${dataDictionary["Filter Button"]["Locator1"]}
    ${status}  run keyword and return status  page should contain  Search Filter
    run keyword if  ${status} == ${False}  click element  ${dataDictionary["Filter Button"]["Locator2"]}

Select Governing Authorities Filter
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Governing Authorities Filter"]}  ${value}

Select State Filter
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["State"]}  ${value}

Select City Filter
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${value}

Apply Filters
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Apply Filter Button"]}

Select Deputation Department Checkbox
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Action Checkbox"]}  ${dataDictionary["Action Checkbox"]["Value"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    Wait Until Keyword Succeeds    5s    250ms  click element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]/following-sibling::${dataDictionary["Edit"]["Locator"]["Locator1"]}
    sleep  1s
    click element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]/following-sibling::${dataDictionary["Edit"]["Locator"]["Locator2"]}

Click On Delete Button
    [Arguments]  ${dataDictionary}  ${entity}
    Wait Until Keyword Succeeds    5s    250ms  click element  //td[contains(text(),'${entity}')]/following-sibling::${dataDictionary["Delete"]["Locator"]["Locator1"]}
    sleep  1s
    click element  //td[contains(text(),'${entity}')]/following-sibling::${dataDictionary["Delete"]["Locator"]["Locator2"]}

Confirm Delete Entry Popup Appeared
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Fill Deputation Department Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Governing Authorities"]}  ${dataDictionary["Governing Authorities"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Address"]}  ${dataDictionary["Address"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Email"]}  ${dataDictionary["Email"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Contact No"]}  ${dataDictionary["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["State"]}  ${dataDictionary["State"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${dataDictionary["City"]["Value"]}

Submit Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Check For The Deputation Department Entry in Enquiry Decision Table
    [Arguments]  ${dataDictionary}
    ${status}  run keyword and return status  Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]
    log  ${status}