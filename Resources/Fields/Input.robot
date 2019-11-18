*** Settings ***
Library           SeleniumLibrary

*** Variables ***
&{Month Values}    Jan=1    Feb=2    Mar=3    Apr=4    May=5    Jun=6    Jul=7
...               Aug=8    Sep=9    Oct=10    Nov=11    Dec=12
${Before Selecting Year}    0.1
${Before Choosing File}    0.1
${After Choosing File}    0.1
${Before Clicking Open Options}    1s
${Before Opening Options}    0.5
${After Selecting Each Option}    0.5
${After Selecting Options}    0.2
${Before Choosing Photo}    0.1
${After Choosing Photo}    0.1
${Before Choosing Yes In Frame}    0.1
${Before Clicking Get Email}    0.1
${After Clicking Get Email}    1
${Before Selecting From List}    0.5
${After Selecting From List}    0.1

*** Keywords ***
Input Type
    [Arguments]    ${Key}    ${Value}
    [Documentation]    Selects the appropriate Input Keyword from the dictionary
    Log    ${Key Description["${Key}"]["Locator"]}
    Run Keyword    Input ${Key Description["${Key}"]["Type"]}    ${Key Description["${Key}"]["Locator"]}    ${Value}
    Run Keyword And Return Status    Press Key    ${Key Description["${Key}"]["Locator"]}    \\09

Input AutoSuggest
    [Arguments]    ${Locator}    ${Value}
    Input Text    ${Locator}    ${Value["Input"]}
    Sleep    1s
    Click Element    //li[contains(text(),'${Value["Search"]}')]

Input Dropdown
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Selects dropdown value identified by locator.
    #Click Element    ${Locator}
    Sleep    ${Before Selecting From List}
    Select From List By Label    ${Locator}    ${Value}
    Sleep    ${After Selecting From List}

Input Button
    [Arguments]    ${Locator}    ${Value}
    Sleep    1s
    Click Button    ${Locator}

Input Checkbox
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Selects checkbox value identified by the locator.
    Unselect Checkbox    ${Locator}
    Run Keyword If    '${Value}'=='Select'    Select Checkbox    ${Locator}

Input Working Experience Clear
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Clear working experience.
    Log    Inside Input Working Experience Clear

Input Date
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    Click Element    ${Locator}
    Click Element    //div[@role='dialog']//h3
    Click Element    //div[text()='${Value["Year"]}']
    Sleep    0.5s
    ${Dispaly Month}    Get Text    //div[@role='dialog']//h1
    ${Dispaly Month}    Split String    ${Dispaly Month}    ${SPACE}
    ${Dispaly Month}    Get From List    ${Dispaly Month}    1
    ${Display Month Value}    Get From Dictionary    ${Month Values}    ${Dispaly Month}
    ${Month Value}    Get From Dictionary    ${Month Values}    ${Value["Month"]}
    ${Time}    Evaluate    ${Month Value}-${Display Month Value}
    ${nTime}    Evaluate    ${Display Month Value}-${Month Value}
    Run Keyword If    $Time>0    Repeat Keyword    ${Time}    Date Arrow    Right
    ...    ELSE IF    $Time<0    Repeat Keyword    ${nTime}    Date Arrow    Left
    Sleep    1s
    Click Element    //span[text()='${Value["Date"]}']
    Click Element    //span[contains(text(),'OK')]

Date Arrow
    [Arguments]    ${arrow}
    Log    ${arrow}
    Run Keyword If    '${arrow}'=='Right'    Click Element    //span[text()='keyboard_arrow_right']
    ...    ELSE    Click Element    //span[text()='keyboard_arrow_left']
    Sleep    0.3

Input Email From SSO
    [Arguments]    ${Locator}    ${Value}
    Sleep    ${Before Clicking Get Email}
    Click Link    xpath=//input[@id='${Locator}']/preceding-sibling::label/a
    Sleep    ${After Clicking Get Email}

Input File
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Uploads a given file after removing the existing file, if any at the given locator.
    Sleep    1s
    ${Status}    Run Keyword And Return Status    Page Should Not Contain Element    //span[@id='download-button-file-${Locator}FileObject']|//span[@id='download-file-${Locator}FileObject']
    ${Status One}    Run Keyword And Return Status    Page Should Contain Element    outlined-button-file
    Log    ${Status}
    Log    ${Status One}
    Run Keyword If    '${Status}' == 'True' and '${Status One}' == 'False'    Choose File    outlined-button-file-${Locator}FileObject    ${RESOURCES}${/}${Value}
    Run Keyword If    ${Status One}    Choose File    outlined-button-file    ../${Value}
    Sleep    ${After Choosing File}
    #Set Focus To Element    ${Locator}

Input File Read Only
    [Arguments]    ${Locator}    ${Value}
    Log    ${Value}

Input Hindi Text
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Inputs hindi text at the given locator
    Click Element    ${Locator}
    : FOR    ${Hindi Char}    IN    @{Value}
    \    Click Button    xpath=//input[@name='${Locator}']/ancestor::div//button[@data-value='${Hindi Char}']
    Click Button    xpath=//input[@name='${Locator}']/ancestor::div//button[@data-value='Accept']

Input Select
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Selects dropdown value identified by locator.
    Click Element    ${Locator}    # To be removed....
    Sleep    ${Before Selecting From List}
    Run Keyword And Return Status    Select From List By Label    ${Locator}    ${Value}
    Sleep    ${After Selecting From List}
    Click Element    ${Locator}    # To be removed....
    #Click Element    //select[@id='${Locator}']/option[contains(text(),'${Value}')]

Input MultiCheckbox
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Selects multiple checkbox values identified by the locator.
    : FOR    ${Unselected Value}    IN    @{Value["UnSelect"]}
    \    Unselect Checkbox    ${Locator}/label[contains(text(),'${Unselected Value}')]/preceding-sibling::input
    : FOR    ${Selected Value}    IN    @{Value["Select"]}
    \    Select Checkbox    ${Locator}/label[contains(text(),'${Selected Value}')]/preceding-sibling::input

Input MultiSelect
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Check previous checked checkbox and deselect the value.
    ...    Selects multiple checkbox value identified by the locator.
    Sleep    ${Before Clicking Open Options}
    : FOR    ${Val}    IN    @{Value}
    \    Select Checkbox    //li[@data-value='${Val}']//input[@type='checkbox']
    Press Key    //li[@data-value='${Val}']//input[@type='checkbox']    \\09

Input Photo
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Upload a given file after removing the existing file, if any at the given locator.
    ${Uploaded Photo Locator}    Set Variable    xpath=//input[@id='${Locator}']/following-sibling::div
    ${Uploaded Photo Name Path}    Set Variable    ${Uploaded Photo Locator}//div
    Sleep    ${Before Choosing Photo}
    Choose File    ${Locator}    ${CURDIR}${/}data${/}UserInfo${/}${Value}
    Sleep    ${After Choosing Photo}

Input Frame
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Verifies whether the field's selected value from the confirmation alert.
    Select From List    ${Locator}    ${Value}
    Sleep    ${Before Choosing Yes In Frame}
    Run Keyword If    '${Value}'=='Yes'    Click Button    Yes

Input Read Only
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Keyword present for the name sake
    Click Element    ${Locator}

Input Radio Button
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Set radio button to the value at the locator.
    Select Radio Button    ${Locator}    ${Value}

Input Text Value
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Inputs text at the given locator
    Input Text    ${Locator}    ${Value}

Input Disabled
    [Arguments]    ${Locator}    ${Value}
    [Documentation]    Keyword present for the name sake
    Log    In ${Value}

Input Search Agent
    [Arguments]    ${Locator}    ${Value}
    Input Text    ${Locator}    ${Value}
    Press Key    ${Locator}    \\13
    Sleep    1s

Input Structure
    [Arguments]    ${Locator}    ${Value}
    Click Button    ${Locator["First"]}
    Input Dropdown    ${Locator["Dropdown"]}    ${Value}

Input Product
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator["First"]}
    Sleep    1s
    Run Keyword If    '${Value["Type"]'=='Product'    Click Button    ${Locator["Product"]}
    ...    ELSE    Click Button    ${Locator["Group"]}
    Input Dropdown    ${Locator["Dropdown"]}    ${Value["Value"]}

Input Customer
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator["First"]}
    Run Keyword If    '${Value["Type"]'=='Customer'    Click Element    ${Locator["Customer"]}
    ...    ELSE    Click Element    ${Locator["Group"]}
    Input Text    ${Locator["Text"]}    ${Value["Value"]}

Input Agreement
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator["First"]}
    Input Dropdown    ${Locator["Dropdown"]}    ${Value}

Input Formula
    [Arguments]    ${Locator}    ${Value}
    : FOR    ${Element}    IN    @{Value}
    \    Run Keyword If    '${Element["Type"]}'=='Keyword'    Input Dropdown    ${Locator["Keyword"]}    ${Element["Value"]}
    \    ...    ELSE IF    '${Element["Type"]}'=='Amount'    Input Text Value    ${Locator["Amount"]}    ${Element["Value"]}
    \    ...    ELSE    Click Button    ${Locator["${Element["Value"]}"]}
