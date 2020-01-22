*** Settings ***
Documentation    Suite description

*** Keywords ***
Check For TA/DA grade Entry In TA/DA grade Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Effective From"]["Value"]["Day"]}-${formField["Effective From"]["Value"]["Month"]}-${formField["Effective From"]["Value"]["Year"]}')]

Check For TA/DA grade Deletion In TA/DA grade Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Effective From"]["Value"]["Day"]}-${formField["Effective From"]["Value"]["Month"]}-${formField["Effective From"]["Value"]["Year"]}')]