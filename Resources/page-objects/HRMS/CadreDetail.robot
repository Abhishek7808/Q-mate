*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Cadre Detail
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Cadre Detail Entry In Cadre Detail Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For Cadre Detail Deletion In Cadre Detail Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]