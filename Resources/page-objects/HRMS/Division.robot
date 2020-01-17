*** Settings ***
Documentation    Suite description

*** Keywords ***
Check For Division Entry In Division Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For Division Deletion In Division Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]
