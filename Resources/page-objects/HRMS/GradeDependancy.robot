*** Settings ***
Documentation    Suite description

*** Keywords ***
Check For Grade Dependancy Entry In Grade Dependancy Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Effective From"]["Value"]["Day"]}-${formField["Effective From"]["Value"]["Month"]}-${formField["Effective From"]["Value"]["Year"]}')]

Check For Grade Dependancy Deletion In Grade Dependancy Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Effective From"]["Value"]["Day"]}-${formField["Effective From"]["Value"]["Month"]}-${formField["Effective From"]["Value"]["Year"]}')]