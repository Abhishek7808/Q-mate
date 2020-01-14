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
    [Arguments]  ${locator}  ${value}
    click element  ${locator["Locator1"]}
    checkbox should be selected  ${locator["Locator2"]}

Confirm Date
    [Arguments]  ${Locator}  ${value}
    ${filledDate}  get value  ${Locator}
    ${dateValue}  set variable  ${value["Day"]}-${value["Month"]}-${value["Year"]}
    ${dateValue}  set variable if  ${value["Day"]}<10  0${dateValue}  ELSE  ${dateValue}
    should be equal  ${filledDate}  ${dateValue}

Confirm Button
    [Arguments]  ${Locator}  ${value}
    log  Button clicked confirmation

Confirm Link
    [Arguments]  ${Locator}  ${value}
    log  clicked on link
    #page should not contain link  ${Locator}

Confirm Element
    [Arguments]  ${Locator}  ${value}
    log  Element clicked confirmation