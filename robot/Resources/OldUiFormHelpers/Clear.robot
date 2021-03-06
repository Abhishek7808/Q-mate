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
    [Documentation]    Selects the appropriate Input Keyword from the dictionary
    [Arguments]    ${Key}
    Run Keyword    Clear ${Key Description["${Key}"]["Type"]}    ${Key Description["${Key}"]["Locator"]}

Clear AutoSuggest
    [Documentation]    Clear the Content of the Locator.
    [Arguments]    ${Locator}
    Input Text    ${Locator}    ${EMPTY}

Clear Dropdown
    [Documentation]    Selects dropdown value identified by locator.
    [Arguments]    ${Locator}
    ${status}  run keyword and return status  Select From List By Label    ${Locator}    ${EMPTY}
    run keyword if  ${status} == ${False}  Select From List By Label    ${Locator}    None
    log to console  ${EMPTY} empty

Clear Checkbox
    [Documentation]    Selects checkbox value identified by the locator.
    [Arguments]    ${Locator}
    Unselect Checkbox    ${Locator}

Clear Date
    [Documentation]    Input the given date into date field at the locator. Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    [Arguments]    ${Locator}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = false
    Sleep    ${After Disable Readonly}
    Input Text    ${Locator}    ${EMPTY}
    Execute JavaScript    return window.document.getElementById('${Locator}').readOnly = true
    Sleep    ${After Enable Readonly}

Clear File Read Only
    [Documentation]    Uploads a given file after removing the existing file, if any at the given locator.
    [Arguments]    ${Locator}
    #${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[@id='remove-button-file-${Locator}FileObject']
    #${Uploaded File Name}    Get Text    ${Uploaded File Name Path}
    #Run Keyword If    ${Status}    Click Element    //span[@id='remove-button-file-${Locator}FileObject']
    #Sleep    ${After Deleting File}
    Log    ${Locator}

Clear File
    [Documentation]    Uploads a given file after removing the existing file, if any at the given locator.
    [Arguments]    ${Locator}
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[@id='remove-button-file-${Locator}FileObject']|//span[@id='remove-file-${Locator}FileObject']
    #${Uploaded File Name}    Get Text    ${Uploaded File Name Path}
    Run Keyword If    ${Status}    Click Element    //span[@id='remove-button-file-${Locator}FileObject']|//span[@id='remove-file-${Locator}FileObject']
    Sleep    ${After Deleting File}

Clear MultiSelect
    [Documentation]    Selects multiple checkbox value identified by the locator.
    [Arguments]    ${Locator}
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
    [Documentation]    Keyword present for the name sake.
    [Arguments]    ${Locator}
    Log    Inside Clear Read Only

Clear Radio Button
    [Documentation]    Set radio button to the value at the locator.
    [Arguments]    ${Locator}
    Log    Inside Clear Radio Button

Clear Button
    [Documentation]    Logs a message to console.
    [Arguments]    ${Locator}
    Log    Inside Clear Radio Button

Clear Text Value
    [Documentation]    Inputs text at the given locator.
    [Arguments]    ${Locator}
#    Clear Element Text  ${Locator}
    Input Text    ${Locator}    ${EMPTY}
#    Press Keys  ${Locator}  A+BACKSPACE
#    sleep  4s
#    ${value}=     Get Element Attribute   ${Locator}      value
#    ${backspaces count}=    Get Length      ${value}
#    log  ${backspaces count}
#    Run Keyword If    """${value}""" != ''    # if there's no current value - no need to slow down by an extra SE call
#    ...     Repeat Keyword  ${backspaces count +1}  Press Keys  ${Locator}   BACKSPACE    # this is the code for the backspace key; "backspaces count +1" - just too be sure :)

Clear Disabled
    [Documentation]    Keyword preseent for name sake
    [Arguments]    ${Locator}
    Log    Inside Clear Disabled

Clear Search Agent
    [Documentation]    Logs clear message.
    [Arguments]    ${Locator}
    Log    Inside Clear Search Agent

Clear Structure
    [Documentation]    Set Structure button to the value at the locator.
    [Arguments]    ${Locator}
    Log    Inside Clear Structure

Clear Product
    [Documentation]    Set Product button to the value at the locator.
    [Arguments]    ${Locator}
    Log    Inside Clear Product

Clear Customer
    [Arguments]    ${Locator}
    [Documentation]    Set Customer button to the value at the locator.
    Log    Inside Clear Customer

Clear Agreement
    [Documentation]    Set Agreement button to the value at the locator.
    [Arguments]    ${Locator}
    Log    Inside Clear Agreement

Clear Formula
    [Documentation]    Set Formula button to the value at the locator.
    [Arguments]    ${Locator}
    Log    Inside Clear Formula

Clear CheckBoxPopup
    [Arguments]    ${Locator}    @{Values}
    click element  //div[contains(@class,'jss571 jss572 jss583')]
    FOR  ${items}  IN   @{Values}
    \   click element  //span[contains(text(),'${items}')]
    press keys   None  TAB