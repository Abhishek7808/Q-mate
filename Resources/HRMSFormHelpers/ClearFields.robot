*** Settings ***
Documentation    Suite description

*** Keywords ***
Clear Text Value
    [Arguments]  ${locator}
    input text  ${locator}  ${EMPTY}