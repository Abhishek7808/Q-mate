*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Hospital Empanelment
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Hospital Empanelment Entry In Division Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For Hospital Empanelment Deletion In Division Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]