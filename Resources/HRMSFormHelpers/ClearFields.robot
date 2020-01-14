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
    [Arguments]  ${locator}
    click element  ${locator["Locator1"]}
    sleep  3s
    #click element  ${locator["Locator2"]}
    #${status}  run keyword and return status  checkbox should be selected  ${locator["Locator2"]}
    unselect checkbox  ${locator["Locator2"]}
    click element  ${locator["Locator1"]}

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

Clear Link
    [Arguments]  ${Locator}
    page should contain link  ${Locator}

Clear Element
    [Arguments]  ${Locator}
    log  element cleared