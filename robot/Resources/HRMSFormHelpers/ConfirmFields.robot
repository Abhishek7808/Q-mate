*** Settings ***
Documentation    Suite description

*** Keywords ***
Confirm Text Value
    [Arguments]  ${locator}  ${value}
    ${filledValue}  get text  ${locator}
    should be equal  ${filledValue}  ${value}

Confirm Dropdown
    [Arguments]  ${locator}  ${value}
    get selected list label  ${locator}

Confirm Dropdown-Checkbox
    [Arguments]  ${locator1}  ${locator2}  ${value}
    click element  ${locator1}
    checkbox should be selected  ${locator2}

Confirm Date
    [Arguments]    ${Locator}    ${Value}
    ${filledDate}  get value  ${Locator}
    should be equal  ${filledDate}  ${Value}