*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}String.robot

*** Keywords ***
Confirm Type
    [Documentation]    Selects the appropriate Input Keyword from the dictionary.
    [Arguments]    ${Key}    ${Value}    ${Is Value Valid}=${TRUE}
    ${Is Value Correct}    Run Keyword And Return Status    Confirm ${Key Description["${Key}"]["Type"]}    ${Key Description["${Key}"]["Locator"]}    ${Value}
    Should Be Equal    ${Is Value Valid}    ${Is Value Correct}

Confirm AutoSuggest
    [Documentation]    Confirms whether the text selected is same as required.
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value["Search"]}    ${Existing Value}

Confirm Dropdown
    [Documentation]    Selects dropdown value identified by locator.
    [Arguments]    ${Locator}    ${Value}
    ${Temp}    Get Selected List Label    ${Locator}
    ${Temp}    Strip String    ${Temp}
    Should Be Equal    ${Value}    ${Temp}

Confirm Checkbox
    [Documentation]   Confirms that checkbox is selected.
    [Arguments]    ${Locator}    ${Value}
    ${Is Selected}    Run Keyword And Return Status    Checkbox Should Be Selected    ${Locator}
    ${Value}    Evaluate    'Select'=='${Value}'
    Should Be Equal    ${Value}    ${Is Selected}

Confirm Date
    [Documentation]  Confirms that desired date is filled in the field.
    [Arguments]    ${Locator}    ${Value}
    ${Value}    Convert To String Date    ${Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm File
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    #${Value}    Convert To String File    ${Value}
    #${Uploaded File Name Path}    Set Variable    xpath=//input[@id='${Locator}']/following-sibling::div/a
    #${Uploaded File Name}    Get Text    ${Uploaded File Name Path}
    #Should Be Equal    ${Value}    ${Uploaded File Name}
    Log    File Uploaded

Confirm Select
    [Documentation]  Confirms that desired value is selected from the dropdown.
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Selected List Label    ${Locator}
    ${Existing Value}    Strip String    ${Existing Value}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm MultiCheckbox
    [Documentation]  Confirms that desired checkbox is selected or deselected.
    [Arguments]    ${Locator}    ${Value}
    : FOR    ${Selected Value}    IN    @{Value["Select"]}
    \    Checkbox Should Be Selected    ${Locator}/label[contains(text(),'${Selected Value}')]/preceding-sibling::input
    : FOR    ${UnSelected Value}    IN    @{Value["UnSelect"]}
    \    Checkbox Should Not Be Selected    ${Locator}/label[contains(text(),'${UnSelected Value}')]/preceding-sibling::input

Confirm MultiSelect
    [Documentation]  Confirms desired values are selected.
    [Arguments]    ${Locator}    ${Value}
    ${Value}    Convert To String MultiSelect    ${Value}    ${SPACE}
    ${Existing Value}    Get Text    xpath=//a[@id='${Locator}']/span
    Should Be Equal    ${Value}    ${Existing Value}

Confirm Read Only
    [Documentation]  Confirms that element is read only.
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Element Attribute    ${Locator}    readonly
    Should Be Equal    true    ${Existing Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm Radio Button
    [Documentation]  Confirms that radio button is correctly set.
    [Arguments]    ${Locator}    ${Value}
    #${Existing Value}    Get Element Attribute    xpath=//input[@id='${Locator}']    checked
    #Should Be Equal    true    ${Existing Value}
    Radio Button Should Be Set To    ${Locator}    ${Value}

Confirm Text Value
    [Documentation]  Confirms that desired text value is written in the field.
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm Disabled
    [Documentation]  Confirms that element is disabled.
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Element Attribute    ${Locator}    disabled
    Should Be Equal    true    ${Existing Value}
    #${Existing Value}    Get Value    ${Locator}
    #Should Be Equal    ${Value}    ${Existing Value}

Confirm Button
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    Log    Button Clicked Successfully

Confirm Search Agent
    [Documentation]  Confirms that agent is visible on the page.
    [Arguments]    ${Locator}    ${Value}
    Element Should Be Visible    //span[text()='${SSO ID["Name"]}']

Confirm Structure
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Structure

Confirm Customer
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Customer

Confirm Product
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Product

Confirm Agreement
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Agreement

Confirm Formula
    [Documentation]  Logs confirmation message.
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Formula

Confirm CheckBoxPopup
    [Documentation]  Returns true message.
    [Arguments]    ${Locator}    @{Values}
    return from keyword   ${True}
    #[return]  ${True}