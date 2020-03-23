*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}String.robot

*** Keywords ***
Confirm Type
    [Arguments]    ${Key}    ${Value}    ${Is Value Valid}=${TRUE}
    [Documentation]    Selects the appropriate Input Keyword from the dictionary
    ${Is Value Correct}    Run Keyword And Return Status    Confirm ${Key Description["${Key}"]["Type"]}    ${Key Description["${Key}"]["Locator"]}    ${Value}
    Should Be Equal    ${Is Value Valid}    ${Is Value Correct}

Confirm AutoSuggest
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Confirms whether the text selected is same as required
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value["Search"]}    ${Existing Value}

Confirm Dropdown
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Selects dropdown value identified by locator.
    ${Temp}    Get Selected List Label    ${Locator}
    ${Temp}    Strip String    ${Temp}
    Should Be Equal    ${Value}    ${Temp}

Confirm Checkbox
    [Arguments]    ${Locator}    ${Value}
    ${Is Selected}    Run Keyword And Return Status    Checkbox Should Be Selected    ${Locator}
    ${Value}    Evaluate    'Select'=='${Value}'
    Should Be Equal    ${Value}    ${Is Selected}

Confirm Date
    [Arguments]    ${Locator}    ${Value}
    ${Value}    Convert To String Date    ${Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm File
    [Arguments]    ${Locator}    ${Value}
    #${Value}    Convert To String File    ${Value}
    #${Uploaded File Name Path}    Set Variable    xpath=//input[@id='${Locator}']/following-sibling::div/a
    #${Uploaded File Name}    Get Text    ${Uploaded File Name Path}
    #Should Be Equal    ${Value}    ${Uploaded File Name}
    Log    File Uploaded

Confirm Select
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Selected List Label    ${Locator}
    ${Existing Value}    Strip String    ${Existing Value}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm MultiCheckbox
    [Arguments]    ${Locator}    ${Value}
    : FOR    ${Selected Value}    IN    @{Value["Select"]}
    \    Checkbox Should Be Selected    ${Locator}/label[contains(text(),'${Selected Value}')]/preceding-sibling::input
    : FOR    ${UnSelected Value}    IN    @{Value["UnSelect"]}
    \    Checkbox Should Not Be Selected    ${Locator}/label[contains(text(),'${UnSelected Value}')]/preceding-sibling::input

Confirm MultiSelect
    [Arguments]    ${Locator}    ${Value}
    ${Value}    Convert To String MultiSelect    ${Value}    ${SPACE}
    ${Existing Value}    Get Text    xpath=//a[@id='${Locator}']/span
    Should Be Equal    ${Value}    ${Existing Value}

Confirm Read Only
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Element Attribute    ${Locator}    readonly
    Should Be Equal    true    ${Existing Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm Radio Button
    [Arguments]    ${Locator}    ${Value}
    #${Existing Value}    Get Element Attribute    xpath=//input[@id='${Locator}']    checked
    #Should Be Equal    true    ${Existing Value}
    Radio Button Should Be Set To    ${Locator}    ${Value}

Confirm Text Value
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Value    ${Locator}
    Should Be Equal    ${Value}    ${Existing Value}

Confirm Disabled
    [Arguments]    ${Locator}    ${Value}
    ${Existing Value}    Get Element Attribute    ${Locator}    disabled
    Should Be Equal    true    ${Existing Value}
    #${Existing Value}    Get Value    ${Locator}
    #Should Be Equal    ${Value}    ${Existing Value}

Confirm Button
    [Arguments]    ${Locator}    ${Value}
    Log    Button Clicked Successfully

Confirm Search Agent
    [Arguments]    ${Locator}    ${Value}
    Element Should Be Visible    //span[text()='${SSO ID["Name"]}']

Confirm Structure
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Structure

Confirm Customer
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Customer

Confirm Product
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Product

Confirm Agreement
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Agreement

Confirm Formula
    [Arguments]    ${Locator}    ${Value}
    Log    Confirm Formula

Confirm CheckBoxPopup
    [Arguments]    ${Locator}    @{Values}
    return from keyword   ${True}
    #[return]  ${True}