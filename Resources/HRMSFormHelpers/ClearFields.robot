*** Settings ***
Documentation    Suite description

*** Keywords ***
Clear Text Value
    [Documentation]  Fills Empty text into field
    [Arguments]  ${locator}
    input text  ${locator}  ${EMPTY}

Clear Dropdown
    [Arguments]  ${locator}
    select from list by index  ${locator}  0

Clear Dropdown-Checkbox
    [Arguments]  ${locator1}  ${locator2}
    click element  ${locator1}
    unselect checkbox  ${locator2}

Clear Date
    [Arguments]    ${Locator}
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = false
    Sleep    ${After Disable Readonly}
    Input Text    ${Locator}    ${EMPTY}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = true
    Sleep    ${After Enable Readonly}

Clear Button
    [Arguments]  ${Locator}
    log  button cleared