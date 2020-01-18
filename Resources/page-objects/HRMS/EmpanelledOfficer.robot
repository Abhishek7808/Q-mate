*** Settings ***
Documentation    Suite description


*** Keywords ***
Search For Empanelled Officer
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Empanelled Officer Entry In Empanelled Officer Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For Empanelled Officer Deletion In Empanelled Officer Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]