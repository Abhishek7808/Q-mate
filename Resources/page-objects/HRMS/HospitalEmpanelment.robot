*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Hospital Empanelment
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Hospital Empanelment Entry In Hospital Empanelment Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For Hospital Empanelment Deletion In Hospital Empanelment Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]