*** Settings ***
Documentation    Add, edit, delete enquiry decision. For more info visit http://support.e-connectsolutions.com/erp/how-to/enquiry-decision-type/

*** Variables ***
${pageUrl}  HRM/EnquiryDecision

*** Keywords ***
Go To Enquiry Decision Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Search Enquiry Decision
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Select Enquiry Decision Checkbox
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Action Checkbox"]}  ${dataDictionary["Action Checkbox"]["Value"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    click element  //td[contains(text(),'${dataDictionary["Decision Name"]["Value"]}')]/following-sibling::${dataDictionary["Edit Button"]["Locator"]}

Click On Delete Button
    [Arguments]  ${dataDictionary}
    Wait Until Keyword Succeeds    10s    250ms  click element  //td[contains(text(),'${dataDictionary["Edit Enquiry Decision Type"]["Decision Name"]["Value"]}')]/following-sibling::${dataDictionary["Delete Button"]["Locator"]}

Confirm Delete Entry Popup Appeared
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}


Fill Enquiry Decision Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Decision Name"]}  ${dataDictionary["Decision Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Enquiry Type"]}  ${dataDictionary["Enquiry Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Impact On"]}  ${dataDictionary["Impact On"]["Value"]}

Submit Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Check For The Enquiry Decision Entry in Enquiry Decision Table
    [Arguments]  ${dataDictionary}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${dataDictionary["Decision Name"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Enquiry Type"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Impact On"]["Value"]}')]