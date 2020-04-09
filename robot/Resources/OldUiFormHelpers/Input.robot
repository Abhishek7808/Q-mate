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
    [Documentation]    Selects the appropriate Input Keyword from the dictionary.
    [Arguments]    ${Key}    ${Value}
    Log    ${Key Description["${Key}"]["Locator"]}
    Run Keyword    Input ${Key Description["${Key}"]["Type"]}    ${Key Description["${Key}"]["Locator"]}    ${Value}
    Run Keyword And Return Status    Press Key  ${Key Description["${Key}"]["Locator"]}  \\09

Input AutoSuggest
    [Documentation]  Enters values itno search field.
    [Arguments]    ${Locator}    ${Value}
    Input Text    ${Locator}    ${Value["Input"]}
    Sleep    1s
    Click Element    //li[contains(text(),'${Value["Search"]}')]

Input Dropdown
    [Documentation]    Selects dropdown value identified by locator.
    [Arguments]    ${Locator}    ${Value}
    #Click Element    ${Locator}
    Sleep    ${Before Selecting From List}
    Select From List By Label    ${Locator}    ${Value}
    Sleep    ${After Selecting From List}

Input Button
    [Documentation]  Clicks button of given locator.
    [Arguments]    ${Locator}    ${Value}
    Sleep    1s
    Click Button    ${Locator}

Input Checkbox
    [Documentation]    Selects checkbox value identified by the locator.
    [Arguments]    ${Locator}    ${Value}
    Unselect Checkbox    ${Locator}
    Run Keyword If    '${Value}'=='Select'    Select Checkbox    ${Locator}

Input Working Experience Clear
    [Documentation]    Clear working experience.
    [Arguments]    ${Locator}    ${Value}
    Log    Inside Input Working Experience Clear

Input Date
    [Documentation]    Input the given date into date field at the locator.
    ...    Date Format : {"Date": "9", "Month": "Feb", "Year": "1993"}
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator}
    Click Element    //div[@role='dialog']//h3
    Click Element    //div[text()='${Value["Year"]}']
    Sleep    1s
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
    ${status}  run keyword and return status  Click Element    //span[text()='${Value["Date"]}']
    run keyword if  ${status} == ${False}  click element  //div[contains(@class,'jss1186')]//button[2]
    run keyword if  ${status} == ${False}  click element  Input Date  ${Locator}    ${Value}
    wait until keyword succeeds  5s    250ms  Click Element    //span[contains(text(),'OK')]

Date Arrow
    [Documentation]  Clicks on arrow buttons in date fields.
    [Arguments]    ${arrow}
    Log    ${arrow}
    Run Keyword If    '${arrow}'=='Right'    Click Element    //span[text()='keyboard_arrow_right']
    ...    ELSE    Click Element    //span[text()='keyboard_arrow_left']
    Sleep    0.3

Input Email From SSO
    [Documentation]  Clicks on the link of the given locator.
    [Arguments]    ${Locator}    ${Value}
    Sleep    ${Before Clicking Get Email}
    Click Link    xpath=//input[@id='${Locator}']/preceding-sibling::label/a
    Sleep    ${After Clicking Get Email}

Input File
    [Documentation]    Uploads a given file after removing the existing file, if any at the given locator.
    [Arguments]    ${Locator}    ${Value}
    Sleep    1s
    ${Status}    Run Keyword And Return Status    Page Should Not Contain Element    //span[@id='download-button-file-${Locator}FileObject']|//span[@id='download-file-${Locator}FileObject']
    ${Status One}    Run Keyword And Return Status    Page Should Contain Element    outlined-button-file
    Log    ${Status}
    Log    ${Status One}
    Run Keyword If    '${Status}' == 'True' and '${Status One}' == 'False'    Choose File    outlined-button-file-${Locator}FileObject    ${RESOURCES}${/}${Value}
    Run Keyword If    ${Status One}    Choose File    outlined-button-file    ${SMM_DATA_FILES}${/}${Value}
    Sleep    ${After Choosing File}
    #Set Focus To Element    ${Locator}

Input File Read Only
    [Documentation]  Logs given value.
    [Arguments]    ${Locator}    ${Value}
    Log    ${Value}

Input Hindi Text
    [Documentation]    Inputs hindi text at the given locator
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator}
    : FOR    ${Hindi Char}    IN    @{Value}
    \    Click Button    xpath=//input[@name='${Locator}']/ancestor::div//button[@data-value='${Hindi Char}']
    Click Button    xpath=//input[@name='${Locator}']/ancestor::div//button[@data-value='Accept']

Input Select
    [Documentation]    Selects dropdown value identified by locator.
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator}    # To be removed....
    Sleep    ${Before Selecting From List}
    Run Keyword And Return Status    Select From List By Label    ${Locator}    ${Value}
    Sleep    ${After Selecting From List}
    Click Element    ${Locator}    # To be removed....
    #Click Element    //select[@id='${Locator}']/option[contains(text(),'${Value}')]

Input MultiCheckbox
    [Documentation]    Selects multiple checkbox values identified by the locator.
    [Arguments]    ${Locator}    ${Value}
    : FOR    ${Unselected Value}    IN    @{Value["UnSelect"]}
    \    Unselect Checkbox    ${Locator}/label[contains(text(),'${Unselected Value}')]/preceding-sibling::input
    : FOR    ${Selected Value}    IN    @{Value["Select"]}
    \    Select Checkbox    ${Locator}/label[contains(text(),'${Selected Value}')]/preceding-sibling::input

Input MultiSelect
    [Documentation]    Check previous checked checkbox and deselect the value.
    ...    Selects multiple checkbox value identified by the locator.
    [Arguments]    ${Locator}    ${Value}
    Sleep    ${Before Clicking Open Options}
    : FOR    ${Val}    IN    @{Value}
    \    Select Checkbox    //li[@data-value='${Val}']//input[@type='checkbox']
    Press Keys    //li[@data-value='${Val}']//input[@type='checkbox']    \\09

Input Photo
    [Documentation]    Upload a given file after removing the existing file, if any at the given locator.
    [Arguments]    ${Locator}    ${Value}
    ${Uploaded Photo Locator}    Set Variable    xpath=//input[@id='${Locator}']/following-sibling::div
    ${Uploaded Photo Name Path}    Set Variable    ${Uploaded Photo Locator}//div
    Sleep    ${Before Choosing Photo}
    Choose File    ${Locator}    ${CURDIR}${/}data${/}UserInfo${/}${Value}
    Sleep    ${After Choosing Photo}

Input Frame
    [Documentation]    Verifies whether the field's selected value from the confirmation alert.
    [Arguments]    ${Locator}    ${Value}
    Select From List    ${Locator}    ${Value}
    Sleep    ${Before Choosing Yes In Frame}
    Run Keyword If    '${Value}'=='Yes'    Click Button    Yes

Input Read Only
    [Documentation]    Keyword present for the name sake.
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator}

Input Radio Button
    [Documentation]    Set radio button to the value at the locator.
    [Arguments]    ${Locator}    ${Value}
    wait until keyword succeeds  5s    250ms  Select Radio Button    ${Locator}    ${Value}


Input Text Value
    [Documentation]    Inputs text at the given locator.
    [Arguments]    ${Locator}    ${Value}
    Input Text    ${Locator}    ${Value}

Input Disabled
    [Documentation]    Keyword present for the name sake.
    [Arguments]    ${Locator}    ${Value}
    Log    In ${Value}

Input Search Agent
    [Documentation]  Enters value into search agemt field
    [Arguments]    ${Locator}    ${Value}
    Input Text    ${Locator}    ${Value}
    Press Key    ${Locator}    \\13
    Sleep    1s

Input Structure
    [Documentation]  Enters values into structure.
    [Arguments]    ${Locator}    ${Value}
    Click Button    ${Locator["First"]}
    Input Dropdown    ${Locator["Dropdown"]}    ${Value}

Input Product
    [Documentation]  Selects product.
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator["First"]}
    Sleep    1s
    Run Keyword If    '${Value["Type"]'=='Product'    Click Button    ${Locator["Product"]}
    ...    ELSE    Click Button    ${Locator["Group"]}
    Input Dropdown    ${Locator["Dropdown"]}    ${Value["Value"]}

Input Customer
    [Documentation]  Selects customer.
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator["First"]}
    Run Keyword If    '${Value["Type"]'=='Customer'    Click Element    ${Locator["Customer"]}
    ...    ELSE    Click Element    ${Locator["Group"]}
    Input Text    ${Locator["Text"]}    ${Value["Value"]}

Input Agreement
    [Documentation]  Enters values into agreement dropdown.
    [Arguments]    ${Locator}    ${Value}
    Click Element    ${Locator["First"]}
    Input Dropdown    ${Locator["Dropdown"]}    ${Value}

Input Formula
    [Documentation]  Enters formula.
    [Arguments]    ${Locator}    ${Value}
    : FOR    ${Element}    IN    @{Value}
    \    Run Keyword If    '${Element["Type"]}'=='Keyword'    Input Dropdown    ${Locator["Keyword"]}    ${Element["Value"]}
    \        ELSE IF    '${Element["Type"]}'=='Amount'    Input Text Value    ${Locator["Amount"]}    ${Element["Value"]}
    \        ELSE    Click Button    ${Locator["${Element["Value"]}"]}

Input CheckBoxPopup
    [Documentation]  Enters values into checkbox popups.
    [Arguments]    ${Locator}    ${Values}
    log  ${values}
    log to console  ${values}
    ${first}  get from list  ${values}  0
    log to console  ${first}
    wait until keyword succeeds  5s    100ms  click element  //div[contains(@class,'jss571 jss572 jss583')]
    FOR  ${item}  IN   @{Values}
    \   click element  //span[contains(text(),'${item}')]
    press keys   None  TAB