*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Payment Type
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Description"]["Value"]}
    click button  BtnSearchfilter

Check For Payment Type Entry In Payment Type Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Description"]["Value"]}')]

Check For Payment Type Deletion In Payment Type Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Description"]["Value"]}')]