*** Settings ***
Documentation    Suite description

*** Keywords ***
Confirm Text Value
    [Arguments]  ${locator}  ${value}
    ${filledValue}  get value  ${locator}
    should be equal  ${filledValue}  ${value}

Confirm Dropdown
    [Arguments]  ${locator}  ${value}
    get selected list label  ${locator}

Confirm Dropdown-Checkbox
    [Arguments]  ${locator1}  ${locator2}  ${value}
    click element  ${locator1}
    checkbox should be selected  ${locator2}

Confirm Date
    [Arguments]    ${Locator}    ${value}
    ${filledDate}  get value  ${Locator}
    ${dateValue}  set variable  ${value["Day"]}-${value["Month"]}-${value["Year"]}
    ${dateValue}  set variable if  ${value["Day"]}<10  0${dateValue}  ELSE  ${dateValue}
    should be equal  ${filledDate}  ${dateValue}

Confirm Button
    [Arguments]    ${Locator}    ${value}
    log  Button clicked confirmation