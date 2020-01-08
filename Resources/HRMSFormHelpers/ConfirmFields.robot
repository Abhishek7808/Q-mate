*** Settings ***
Documentation    Suite description

*** Keywords ***
Confirm Text Value
    [Arguments]  ${locator}  ${value}
    ${filledValue}  get text  ${locator}
    should be equal  ${filledValue}  ${value}