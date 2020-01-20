*** Settings ***
Documentation    Suite description

*** Keywords ***
Search For TA/DA grade
    [Arguments]  ${formField}
    input text  SearchText  ${formField["Name"]["Value"]}
    click button  BtnSearchfilter

Check For TA/DA grade Entry In TA/DA grade Table
    [Arguments]  ${formField}
    Page should contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]

Check For TA/DA grade Deletion In TA/DA grade Table
    [Arguments]  ${formField}
    Page should not contain element  //td[contains(text(),'${formField["Name"]["Value"]}')]