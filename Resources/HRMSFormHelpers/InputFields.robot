*** Settings ***
Documentation    Suite description

*** Keywords ***
Input Text Value
    [Arguments]  ${locator}  ${value}
    input text  ${locator}  ${value}

Input Dropdown
    [Arguments]  ${locator}  ${value}
    select from list by label  ${locator}  ${value}

Input Dropdown-Checkbox
    [Arguments]  ${locator}  ${value}
    click element  ${locator["Locator1"]}
    sleep  2s
    ${count}  get length  ${value}
    FOR  ${item}  IN RANGE  2  ${count}+2
    \   click element  ${locator["Locator${item}"]}

Input Date
    [Arguments]  ${Locator}  ${Value}
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    Click Element    ${Locator}
    select from list by label  //select[@class='ui-datepicker-year']  ${Value["Year"]}
    select from list by label  //select[@class='ui-datepicker-month']  ${Value["Month"]}
    click element  //a[contains(text(),'${Value["Day"]}')]

Input Button
    [Arguments]  ${Locator}  ${Value}
    click button  ${Locator}

Input Link
    [Arguments]  ${Locator}  ${Value}
    click link  ${Locator}
    sleep  4s

Input Element
    [Arguments]  ${Locator}  ${Value}
    click element  ${Locator}

Input Actions
    [Arguments]  ${Locator}  ${Value}=None
    click element  ${Locator["Locator1"]}
    sleep  2s
    click element  ${Locator["Locator2"]}

Input Checkbox
    [Arguments]  ${Locator}  ${value}
    log  ${value}
    run keyword if  '${value}' == 'select'  select checkbox  ${Locator}  ELSE  unselect checkbox  ${Locator}