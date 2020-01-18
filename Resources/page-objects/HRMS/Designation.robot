*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Designation
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Designation Entry In Division Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For Designation Deletion In Division Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]