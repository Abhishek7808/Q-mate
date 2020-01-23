*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For TA/DA Rule
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Allowance Type"]["Value"]}
    click button  BtnSearchfilter

Check For TA/DA Rule Entry In TA/DA Rule Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]/following-sibling:://td[contains(text(),'${formField["Effective From"]["Value"]["Day"]}-${formField["Effective From"]["Value"]["Month"]}-${formField["Effective From"]["Value"]["Year"]}')]

Check For TA/DA Rule Deletion In TA/DA Rule Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]/following-sibling:://td[contains(text(),'${formField["Effective From"]["Value"]["Day"]}-${formField["Effective From"]["Value"]["Month"]}-${formField["Effective From"]["Value"]["Year"]}')]