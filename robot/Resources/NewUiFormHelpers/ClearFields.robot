*** Keywords ***
Clear Text Value
    [Documentation]  Fills Empty text into field
    [Arguments]  ${locator}  ${value}=None
    input text  ${locator}  ${EMPTY}

Clear Dropdown
    [Documentation]  Sets None value into the dropdown of the given locator.
    [Arguments]  ${locator}  ${value}=None
    select from list by index  ${locator}  0

Clear Dropdown-Checkbox
    [Documentation]  Unselects all the checkboxes of the dropdown of the given locator.
    [Arguments]  ${locator}  ${value}
    click element  ${locator["Locator1"]}
    sleep  3s
    ${count}  get length  ${value}
    FOR  ${item}  IN RANGE  2  ${count}+2
    \   set focus to element  ${locator["Locator${item}"]}
    \   unselect checkbox  ${locator["Locator${item}"]}
    #click element  ${locator["Locator1"]}

Clear Date
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    [Arguments]    ${Locator}  ${value}=None
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = false
    Sleep    ${After Disable Readonly}
    Input Text    ${Locator}    ${EMPTY}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = true
    Sleep    ${After Enable Readonly}

Clear Button
    [Documentation]  Logs appropriate message.
    [Arguments]  ${Locator}  ${value}=None
    log  button cleared

Clear Link
    [Documentation]  Takes link as argument. Checks that given page contains that link.
    [Arguments]  ${Locator}  ${value}=None
    page should contain link  ${Locator}

Clear Element
    [Documentation]  Logs appropriate message.
    [Arguments]  ${Locator}  ${value}=None
    log  element cleared

Clear Actions
    [Documentation]  Logs appropriate message.
    [Arguments]  ${Locator}  ${value}=None
    log  Actions are ready to be clicked

Clear Checkbox
    [Documentation]  Takes locator of checkbox as argument and unselects it.
    [Arguments]  ${Locator}  ${value}=None
    unselect checkbox  ${Locator}

Clear SearchSelectDropdown
    [Documentation]  Sets None value into the dropdown of the given locator.
    [Arguments]  ${Locator}  ${value}
    click element  ${Locator["Locator1"]}
    input text  ${Locator["Locator2"]}  Select
    press keys  ${Locator["Locator2"]}  ENTER