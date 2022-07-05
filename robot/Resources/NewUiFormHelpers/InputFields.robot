*** Keywords ***
Input Text Value
    [Documentation]  Takes locator and value as arguments, Fills the value into the field of the given locator.
    [Arguments]  ${locator}  ${value}
    input text  ${locator}  ${value}

Input Dropdown
    [Documentation]  Takes locator and value as arguments and selects given value from the dropdown of the given locator.
    [Arguments]  ${locator}  ${value}
    Log to console      TEST1-${locator}
    Log to console      TEST2-${value}
    select from list by label  ${locator}  ${value}

Input Dropdown-Checkbox
    [Documentation]  Takes locator of dropdown and list of values as arguments. Selects checkboxes of the given values.
    [Arguments]  ${locator}  ${value}
    run keyword and ignore error  click element  ${locator["Locator1"]}
    sleep  2s
    ${count}  get length  ${value}
    FOR  ${item}  IN RANGE  2  ${count}+2
    \   set focus to element  ${locator["Locator${item}"]}
    \   click element  ${locator["Locator${item}"]}

Input Date
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    [Arguments]  ${Locator}  ${Value}
    Click Element    ${Locator}
    select from list by label  //select[@class='ui-datepicker-year']  ${Value["Year"]}
    select from list by label  //select[@class='ui-datepicker-month']  ${Value["Month"]}
    click element  //a[contains(text(),'${Value["Day"]}')]

Input Button
    [Documentation]  Clicks the button of given locator.
    [Arguments]  ${Locator}  ${Value}
    wait until element is enabled  ${Locator}
    click button  ${Locator}

Input Link
    [Documentation]  Clicks on the given link.
    [Arguments]  ${Locator}  ${Value}
    click link  ${Locator}
    sleep  4s

Input Element
    [Documentation]  Clicks on the given element.
    [Arguments]  ${Locator}  ${Value}
    click element  ${Locator}

Input Actions
    [Documentation]  Clicks on the action button dropdown and selects appropriate given option.
    [Arguments]  ${Locator}  ${Value}=None
    click element  ${Locator["Locator1"]}
    sleep  2s
    click element  ${Locator["Locator2"]}

Input Checkbox
    [Documentation]  Takes 'Select' or 'unselect' as argument and selects or unselects the checkbox.
    [Arguments]  ${Locator}  ${value}
    log  ${value}
    run keyword if  '${value}' == 'select'  select checkbox  ${Locator}  ELSE  unselect checkbox  ${Locator}

Input SearchSelectDropdown
    [Documentation]  Takes locator of the dropdown and value that has to be selectd, as argument. Fills the value into the search field of the dropdown and press enter key.
    [Arguments]  ${Locator}  ${value}
    click element  ${Locator["Locator1"]}
    input text  ${Locator["Locator2"]}  ${value}
    press keys  ${Locator["Locator2"]}  ENTER