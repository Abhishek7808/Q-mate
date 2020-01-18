*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For Department
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Description"]["Value"]}
    click button  BtnSearchfilter

Check For Department Entry In Department Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Description"]["Value"]}')]

Check For Department Deletion In Department Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Description"]["Value"]}')]