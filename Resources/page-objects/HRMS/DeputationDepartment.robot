*** Settings ***
Documentation    Suite description

*** Keywords ***
Check For The Deputation Department Entry in Enquiry Decision Table
    [Arguments]  ${formField}
    ${status}  run keyword and return status  Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]
    log  ${status}