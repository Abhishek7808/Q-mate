*** Settings ***
Documentation    Suite description

*** Keywords ***
Clear Text Value
    [Documentation]  Fills Empty text into field
    [Arguments]  ${locator}  ${value}=None
    input text  ${locator}  ${EMPTY}

Clear Dropdown
    [Arguments]  ${locator}  ${value}=None
    select from list by index  ${locator}  0

Clear Dropdown-Checkbox
    [Arguments]  ${locator}  ${value}
    click element  ${locator["Locator1"]}
    sleep  3s
    ${count}  get length  ${value}
    FOR  ${item}  IN RANGE  2  ${count}+2
    \   unselect checkbox  ${locator["Locator${item}"]}
    click element  ${locator["Locator1"]}

Clear Date
    [Arguments]    ${Locator}  ${value}=None
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = false
    Sleep    ${After Disable Readonly}
    Input Text    ${Locator}    ${EMPTY}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = true
    Sleep    ${After Enable Readonly}

Clear Button
    [Arguments]  ${Locator}  ${value}=None
    log  button cleared

Clear Link
    [Arguments]  ${Locator}  ${value}=None
    page should contain link  ${Locator}

Clear Element
    [Arguments]  ${Locator}  ${value}=None
    log  element cleared

Clear Actions
    [Arguments]  ${Locator}  ${value}=None
    log  Actions are ready to be clicked