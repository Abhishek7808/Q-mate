*** Settings ***
Documentation    Suite description

*** Variables ***
${dropdownDefault}

*** Keywords ***
Clear Text Value
    [Documentation]  Fills Empty text into field
    [Arguments]  ${locator}
    input text  ${locator}  ${EMPTY}

Clear Drop down
    [Arguments]  ${locator}
    select value from list by index  ${locator}  0
#    ${labels}  get list items  ${locator}
#    ${status}  run keyword and return status  list should contain value  ${labels}  Select
#    select value from list by index  ${locator}  None

Clear Dropdown-Checkbox
    [Arguments]  ${locator}
