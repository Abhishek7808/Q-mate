*** Settings ***

*** Variables ***
${After Working Experience Clear}    0.1
${After Disable Readonly}    0.1
${After Enable Readonly}    0.1
${After Deleting File}    0.1
${Before Clicking Open Options Clear}    0.5
${Before Opening Options Clear}    0.2
${After Unselecting Options}    0.1
${After Deleting Photo}    0.1

*** Keywords ***
Clear Type
    [Arguments]    ${Key}
    [Documentation]    Selects the appropriate Input Keyword from the dictionary
    Run Keyword    Clear ${Key Description["${Key}"]["Type"]}    ${Key Description["${Key}"]["Locator"]}

Clear AutoSuggest
    [Arguments]    ${Locator}
    [Documentation]    Clear the Content of the Locator
    Input Text    ${Locator}    ${EMPTY}

Clear Dropdown
    [Arguments]    ${Locator}
    [Documentation]    Selects dropdown value identified by locator.
    Select From List By Label    ${Locator}    ${EMPTY}
    log to console  ${EMPTY} empty
Clear Checkbox
    [Arguments]    ${Locator}
    [Documentation]    Selects checkbox value identified by the locator.
    Unselect Checkbox    ${Locator}

Clear Date
    [Arguments]    ${Locator}
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    #Can't be executed
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = false
    Sleep    ${After Disable Readonly}
    Input Text    ${Locator}    ${EMPTY}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = true
    Sleep    ${After Enable Readonly}

Clear File Read Only
    [Arguments]    ${Locator}
    [Documentation]    Uploads a given file after removing the existing file, if any at the given locator.
    #${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[@id='remove-button-file-${Locator}FileObject']
    #${Uploaded File Name}    Get Text    ${Uploaded File Name Path}
    #Run Keyword If    ${Status}    Click Element    //span[@id='remove-button-file-${Locator}FileObject']
    #Sleep    ${After Deleting File}
    Log    ${Locator}

Clear File
    [Arguments]    ${Locator}
    [Documentation]    Uploads a given file after removing the existing file, if any at the given locator.
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[@id='remove-button-file-${Locator}FileObject']|//span[@id='remove-file-${Locator}FileObject']
    #${Uploaded File Name}    Get Text    ${Uploaded File Name Path}
    Run Keyword If    ${Status}    Click Element    //span[@id='remove-button-file-${Locator}FileObject']|//span[@id='remove-file-${Locator}FileObject']
    Sleep    ${After Deleting File}

Clear MultiSelect
    [Arguments]    ${Locator}
    [Documentation]    Check previous checked checkbox and deselect the value.
    ...    Selects multiple checkbox value identified by the locator.
    Sleep    ${Before Clicking Open Options Clear}
    ${Box Attr}    Get Element Attribute    xpath=//a[@id='${Locator}']/ancestor::dt/following-sibling::dd//ul    style
    ${Box Attr List}    Split String    ${Box Attr}    ;
    ${Block Not Displayed}    Run Keyword And Return Status    List Should Not Contain Value    ${Box Attr List}    display: block
    Run Keyword If    ${Block Not Displayed}    Click Link    ${Locator}
    Sleep    ${Before Opening Options Clear}
    ${All Options Count}    Get Matching Xpath Count    xpath=//a[@id='${Locator}']/ancestor::dt/following-sibling::dd//li//input
    ${Box Attr}    Get Element Attribute    xpath=//a[@id='${Locator}']/ancestor::dt/following-sibling::dd//ul    style
    : FOR    ${Option}    IN RANGE    1    ${All Options Count} + 1
    \    Unselect Checkbox    xpath=(//a[@id='${Locator}']/ancestor::dt/following-sibling::dd//li)[${Option}]//input
    Sleep    ${After Unselecting Options}

Clear Read Only
    [Arguments]    ${Locator}
    [Documentation]    Keyword present for the name sake
    Log    Inside Clear Read Only

Clear Radio Button
    [Arguments]    ${Locator}
    [Documentation]    Set radio button to the value at the locator.
    Log    Inside Clear Radio Button

Clear Button
    [Arguments]    ${Locator}
    [Documentation]    Logs a message to console
    Log    Inside Clear Radio Button

Clear Text Value
    [Arguments]    ${Locator}
    [Documentation]    Inputs text at the given locator
    Input Text    ${Locator}    ${EMPTY}

Clear Disabled
    [Arguments]    ${Locator}
    [Documentation]    Keyword preseent for name sake
    Log    Inside Clear Disabled

Clear Search Agent
    [Arguments]    ${Locator}
    Log    Inside Clear Search Agent

Clear Structure
    [Arguments]    ${Locator}
    [Documentation]    Set Structure button to the value at the locator.
    Log    Inside Clear Structure

Clear Product
    [Arguments]    ${Locator}
    [Documentation]    Set Product button to the value at the locator.
    Log    Inside Clear Product

Clear Customer
    [Arguments]    ${Locator}
    [Documentation]    Set Customer button to the value at the locator.
    Log    Inside Clear Customer

Clear Agreement
    [Arguments]    ${Locator}
    [Documentation]    Set Agreement button to the value at the locator.
    Log    Inside Clear Agreement

Clear Formula
    [Arguments]    ${Locator}
    [Documentation]    Set Formula button to the value at the locator.
    Log    Inside Clear Formula
