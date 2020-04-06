*** Settings ***
Documentation    Add, edit, delete enquiry decision. For more info visit http://support.e-connectsolutions.com/erp/how-to/enquiry-decision-type/

*** Keywords ***
Go To Enquiry Decision Page
    [Documentation]  Opens decision page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Documentation]  Clicks on add new button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Search Enquiry Decision
    [Documentation]  Searches given decision name in the list.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Select Enquiry Decision Checkbox
    [Documentation]  Selects checkbox related to the given enquiry decision type.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Action Checkbox"]}  ${dataDictionary["Action Checkbox"]["Value"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    click element  //td[contains(text(),'${dataDictionary["Decision Name"]["Value"]}')]/following-sibling::${dataDictionary["Edit Button"]["Locator"]}

Click On Delete Button
    [Documentation]  Clicks on delete button.
    [Arguments]  ${dataDictionary}
    Wait Until Keyword Succeeds    10s    250ms  click element  //td[contains(text(),'${dataDictionary["Edit Enquiry Decision Type"]["Decision Name"]["Value"]}')]/following-sibling::${dataDictionary["Delete Button"]["Locator"]}

Confirm Delete Entry Popup Appeared
    [Documentation]  Checks that delete confirmation popup is appeared.
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Documentation]  Clicks on Ok button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Fill Enquiry Decision Details
    [Documentation]  Fills details into enquiry decision form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Decision Name"]}  ${dataDictionary["Decision Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Enquiry Type"]}  ${dataDictionary["Enquiry Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Impact On"]}  ${dataDictionary["Impact On"]["Value"]}

Submit Details
    [Documentation]  Clicks on submit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Check For The Enquiry Decision Entry in Enquiry Decision Table
    [Documentation]  Checks that enquiry decision entry is listed.
    [Arguments]  ${dataDictionary}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${dataDictionary["Decision Name"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Enquiry Type"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Impact On"]["Value"]}')]