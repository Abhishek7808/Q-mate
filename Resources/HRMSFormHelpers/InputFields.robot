*** Settings ***
Documentation    Suite description

*** Keywords ***
Input Text Value
    [Arguments]  ${locator}  ${value}
    input text  ${locator}  ${value}