*** Settings ***
Documentation    Suite description

*** Keywords ***
Go To Enquiry Decision Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryDecision

Click On Add New Button
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Add New"]}

Search Enquiry Decision
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}

Select Enquiry Decision Checkbox
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Action Checkbox"]}  ${formField["Action Checkbox"]["Value"]}

Click On Edit Button
    [Arguments]  ${formField}
    click element  //td[contains(text(),'${formField["Decision Name"]["Value"]}')]/following-sibling::${formField["Edit Button"]["Locator"]}

Click On Delete Button
    [Arguments]  ${formField}
    Wait Until Keyword Succeeds    10s    250ms  click element  //td[contains(text(),'${formField["Edit Enquiry Decision Type"]["Decision Name"]["Value"]}')]/following-sibling::${formField["Delete Button"]["Locator"]}

Confirm Delete Entry Popup Appeared
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Ok"]}


Fill Enquiry Decision Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Decision Name"]}  ${formField["Decision Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enquiry Type"]}  ${formField["Enquiry Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Impact On"]}  ${formField["Impact On"]["Value"]}

Submit Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Save"]}

Check For The Enquiry Decision Entry in Enquiry Decision Table
    [Arguments]  ${formField}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${formField["Decision Name"]["Value"]}')]/following-sibling::td[contains(text(),'${formField["Enquiry Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formField["Impact On"]["Value"]}')]