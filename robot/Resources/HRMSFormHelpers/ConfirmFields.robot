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
    run keyword and ignore error  click element  ${locator["Locator1"]}
    ${count}  get length  ${value}
    FOR  ${item}  IN RANGE  2  ${count}+2
    \   set focus to element  ${locator["Locator${item}"]}
    \   checkbox should be selected  ${locator["Locator${item}"]}


Confirm Date
    [Arguments]  ${Locator}  ${value}
    ${filledDate}  get value  ${Locator}
    ${dateValue}  set variable  ${value["Day"]}-${value["Month"]}-${value["Year"]}
    ${dateValue}  run keyword if  ${value["Day"]}<10  set variable  0${dateValue}  ELSE  set variable  ${dateValue}
    #${dateValue}  set variable if  ${value["Day"]}<10  0${dateValue}  ELSE  ${dateValue}
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

Confirm Actions
    [Arguments]  ${Locator}  ${value}=None
    log  Action clicked

Confirm Checkbox
    [Arguments]  ${Locator}  ${value}
    run keyword if  '${value}' == 'select'  checkbox should be selected  ${Locator}  ELSE  checkbox should not be selected  ${Locator}
    #checkbox should be selected  ${Locator}

Confirm SearchSelectDropdown
    [Arguments]  ${Locator}  ${value}
    log  Option Selected