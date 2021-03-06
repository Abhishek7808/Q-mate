*** Settings ***
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Input.robot
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Clear.robot
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Confirm.robot
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}ConfirmXpath.robot

*** Keywords ***
Input Valid Value
    [Documentation]   Calls another keyword for input value into field.
    [Arguments]    ${Key}    ${Value}=${EMPTY}
    run keyword and continue on failure  wait until keyword succeeds  5s    100ms  Input Valid Value With Wait    ${Key}    ${Value}

Input Valid Value With Wait
    [Documentation]  Calls keywords for clearing the field, entering value into field and shows an error if there is an error while confirming the value written into field.
    [Arguments]    ${Key}    ${Value}
    sleep  500ms
    Clear Type    ${Key}
    Input Type    ${Key}    ${Value}
    ${status}  run keyword and return status  Confirm Type    ${Key}    ${Value}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Error in confirming the field

Input Valid Values
    [Documentation]  Fills values in respective fields.
    [Arguments]    ${Key}    ${Values}
    : FOR    ${Value}    IN    @{Values}
    \    Input Valid Value    ${Key}    ${Value}

Input User Value
    [Arguments]    ${Key}
    ${Key Is Disabled}    Run Keyword And Return Status    Validate Disabled Field    ${Key}
    ${Key Is Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${User}    ${Key}
    Run Keyword If    ${Key Is Present}    Input Valid Value    ${Key}    ${User["${Key}"]}
        ELSE IF    ${Key Is Disabled}==${FALSE}    Clear Field    ${Key}

Input Multiple Valid Value
    [Arguments]    ${Keys}    ${Values}
    : FOR    ${Key}    IN    @{Keys}
    \    ${Key Is Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values}    ${Key}
    \    Run Keyword If    ${Key Is Present}    Input Valid Value    ${Key}    ${Values["${Key}"]}

Input User Multiple Value
    [Arguments]    @{Keys}
    : FOR    ${Key}    IN    @{Keys}
    \    Input User Value    ${Key}

Input Invalid Value
    [Arguments]    ${Key}    ${Value}    ${Popup Message}=${EMPTY}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Invalid Value With Wait    ${Key}    ${Value}    ${Popup Message}

Input Invalid Value With Wait
    [Arguments]    ${Key}    ${Value}    ${Popup Message}
    Clear Type    ${Key}
    Run Keyword And Return Status    Input Type    ${Key}    ${Value}
    Run Keyword If    '${Popup Message}'!='${EMPTY}'    Alert Should Be Present    ${Popup Message}
    Confirm Type    ${Key}    ${Value}    ${FALSE}

Input Invalid Values
    [Arguments]    ${Key}    ${Values}    ${Popup Message}=${EMPTY}
    : FOR    ${Value}    IN    @{Values}
    \    Input Invalid Value    ${Key}    ${Value}    ${Popup Message}

Clear Field
    [Arguments]    ${Key}
    Clear Type    ${Key}

Valid Value at Xpath
    [Arguments]    ${Xpath}    ${Key}
    Confirm Xpath Type    ${Xpath}    ${Key}

Get Data From Type To Keyword Map
    [Documentation]    Get Input Keywords From the json file at the start of Form Tests.
    ${Type To Keyword Obj}    Load Json File    ${Type To Keyword File}
    Set Global Variable    ${TYPE TO KEYWORD}    ${Type To Keyword Obj}

Fill Form
    [Documentation]
    : FOR    ${Page Obj}    IN    @{Form["Pages"]}
    \    set test variable    ${Page}    ${Page Obj}
    \    ${Status}    Run Keyword And Return Status    Fill Page
    \    Sleep    2s
    \    ${Status1}    Run Keyword And Return Status    Page should contain Button    ${Page["Button"]}
    \    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Run Keyword If    ${Status1}    Click Button
    \        ${Page["Button"]}
    \    Sleep    3s
    \    Run Keyword If    ${Status}==${FALSE}    FAIL

Fill Page
    [Documentation]    Fill page details for a user.
    : FOR    ${Element Key}    IN    @{Page["Elements"].keys()}
    \    Run Keyword And Continue On Failure    Input User Value    ${Element Key}

Confirm Form

    : FOR    ${Page Obj}    IN    @{Form["Pages"]}
    \    set test variable    ${Page}    ${Page Obj}
    \    ${Status}    Run Keyword And Return Status    Confirm Page
    \    Sleep    2s
    \    Run Keyword If    ${Status}==${FALSE}    FAIL

Confirm Page
    [Documentation]    Fill page details for a user.
    : FOR    ${Element Key}    IN    @{Page["Elements"].keys()}
    \    Run Keyword And Continue On Failure    Confirm Type    ${Element Key}    ${User["${Element Key}"]}

Partial Form
    : FOR    ${Page Obj}    IN    @{Form["Pages"]}
    \    set test variable    ${Page}    ${Page Obj}
    \    ${Status}    Run Keyword And Return Status    Partial Page
    \    Sleep    2s
    \    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${Page["Button"]}
    \    Sleep    3s
    \    Exit For Loop If    '${Element Key}'=='Your Name'
    \    Run Keyword If    ${Status}==${FALSE}    FAIL

Partial Page
    : FOR    ${Element Key}    IN    @{Page["Elements"].keys()}
    \    Run Keyword And Continue On Failure    Input User Value    ${Element Key}
    \    Exit For Loop If    '${Element Key}'=='Your Name'
