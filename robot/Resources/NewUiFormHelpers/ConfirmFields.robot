*** Keywords ***
Confirm Text Value
    [Documentation]  Takes a value that was to be filled in the field. Gets the value that is already filled in it. Checks that both the values are same.
    [Arguments]  ${locator}  ${value}
    ${filledValue}  get value  ${locator}
    should be equal  ${filledValue}  ${value}

Confirm Dropdown
    [Documentation]  Takes a value that was to be selected in the dropdown. Gets the value that is already selected. Checks that both the values are same.
    [Arguments]  ${locator}  ${value}
    ${selectedValue}  get selected list label  ${locator}
    should be equal  ${selectedValue}  ${value}

Confirm Dropdown-Checkbox
    [Documentation]  Takes list of values which were to be selected from the dropdown. Checks that all the checkboxes with the given values are selected.
    [Arguments]  ${locator}  ${value}
    run keyword and ignore error  click element  ${locator["Locator1"]}
    ${count}  get length  ${value}
    FOR  ${item}  IN RANGE  2  ${count}+2
    \   set focus to element  ${locator["Locator${item}"]}
    \   checkbox should be selected  ${locator["Locator${item}"]}


Confirm Date
    [Documentation]  Takes date as argument and checks that given date is selected.
    [Arguments]  ${Locator}  ${value}
    ${filledDate}  get value  ${Locator}
    ${dateValue}  set variable  ${value["Day"]}-${value["Month"]}-${value["Year"]}
    ${dateValue}  run keyword if  ${value["Day"]}<10  set variable  0${dateValue}  ELSE  set variable  ${dateValue}
    #${dateValue}  set variable if  ${value["Day"]}<10  0${dateValue}  ELSE  ${dateValue}
    should be equal  ${filledDate}  ${dateValue}

Confirm Button
    [Documentation]  Logs confirmation message.
    [Arguments]  ${Locator}  ${value}
    log  Button clicked confirmation

Confirm Link
    [Documentation]  Logs confirmation message.
    [Arguments]  ${Locator}  ${value}
    log  clicked on link
    #page should not contain link  ${Locator}

Confirm Element
    [Documentation]  Logs confirmation message.
    [Arguments]  ${Locator}  ${value}
    log  Element clicked confirmation

Confirm Actions
    [Documentation]  Logs confirmation message.
    [Arguments]  ${Locator}  ${value}=None
    log  Action clicked

Confirm Checkbox
    [Documentation]  Takes 'Select' or 'unselect' as argument and checks that checkbox of given locator is selected or unselected.
    [Arguments]  ${Locator}  ${value}
    run keyword if  '${value}' == 'select'  checkbox should be selected  ${Locator}  ELSE  checkbox should not be selected  ${Locator}

Confirm SearchSelectDropdown
    [Documentation]  Logs confirmation message.
    [Arguments]  ${Locator}  ${value}
    log  Option Selected