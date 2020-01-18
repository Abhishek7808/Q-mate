*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Qualification
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Qualification Name"]["Value"]}
    click button  BtnSearchfilter

Check For Qualification Entry In Qualification Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Qualification Name"]["Value"]}')]

Check For Qualification Deletion In Qualification Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Qualification Name"]["Value"]}')]