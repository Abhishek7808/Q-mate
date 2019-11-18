*** Settings ***
Resource          ${RESOURCES}${/}Fields${/}Input.robot
Resource          ${RESOURCES}${/}Fields${/}Clear.robot
Resource          ${RESOURCES}${/}Fields${/}Confirm.robot
Resource          ${RESOURCES}${/}Fields${/}ConfirmXpath.robot

*** Keywords ***
Input Valid Value
    [Arguments]    ${Key}    ${Value}=${EMPTY}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value With Wait    ${Key}    ${Value}

Input Valid Value With Wait
    [Arguments]    ${Key}    ${Value}
    Clear Type    ${Key}
    Input Type    ${Key}    ${Value}
    Confirm Type    ${Key}    ${Value}

Input Valid Values
    [Arguments]    ${Key}    ${Values}
    : FOR    ${Value}    IN    @{Values}
    \    Input Valid Value    ${Key}    ${Value}

Input User Value
    [Arguments]    ${Key}
    ${Key Is Disabled}    Run Keyword And Return Status    Validate Disabled Field    ${Key}
    ${Key Is Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${User}    ${Key}
    Run Keyword If    ${Key Is Present}    Input Valid Value    ${Key}    ${User["${Key}"]}
    ...    ELSE IF    ${Key Is Disabled}==${FALSE}    Clear Field    ${Key}

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
    : FOR    ${Page Obj}    IN    @{Form["Pages"]}
    \    set test variable    ${Page}    ${Page Obj}
    \    ${Status}    Run Keyword And Return Status    Fill Page
    \    Sleep    2s
    \    ${Status1}    Run Keyword And Return Status    Page should contain Button    ${Page["Button"]}
    \    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Run Keyword If    ${Status1}    Click Button
    \    ...    ${Page["Button"]}
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
