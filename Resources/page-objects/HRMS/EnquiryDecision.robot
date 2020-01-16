*** Settings ***
Documentation    Suite description

*** Keywords ***
Check For The Enquiry Decision Entry in Enquiry Decision Table
    [Arguments]  ${formField}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${formField["Decision Name"]["Value"]}')]/following-sibling::td[contains(text(),'${formField["Enquiry Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formField["Impact On"]["Value"]}')]