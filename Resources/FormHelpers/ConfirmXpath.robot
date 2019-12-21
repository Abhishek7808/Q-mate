*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ${RESOURCES}${/}FormHelpers${/}String.robot

*** Keywords ***
Confirm Xpath Type
    [Arguments]    ${Xpath}    ${Key}
    ${Key Is Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${User}    ${Key}
    Run Keyword If    ${Key Is Present}    Confirm Xpath ${TYPE TO KEYWORD["${KEY TO TYPE["${Key}"]}"]["Preview"]}    ${Xpath}    ${User["${Key}"]}
    ...    ELSE    Confirm Xpath Empty    ${Xpath}    NA    0    ${EMPTY}

Confirm Xpath Empty
    [Arguments]    ${Xpath}    @{Values}
    ${Xpath Value}    Get Text    ${Xpath}
    List Should Contain Value    ${Values}    ${Xpath Value}

Confirm Xpath Checkbox
    [Arguments]    ${Xpath}    ${Value}
    ${Xpath Value}    Get Text    xpath=${Xpath}
    ${Value}    Run Keyword If    '${Value}'=='Select'    Set Variable    Yes
    ...    ELSE    Set Variable    No
    Should Be Equal    ${Value}    ${Xpath Value}

Confirm Xpath Date
    [Arguments]    ${Xpath}    ${Value}
    ${Xpath Value}    Get Text    xpath=${Xpath}
    ${Value}    Convert To String Date    ${Value}
    Should Be Equal    ${Value}    ${Xpath Value}

Confirm Xpath Text Value
    [Arguments]    ${Xpath}    ${Value}
    ${Xpath Value}    Get Text    xpath=${Xpath}
    Should Be Equal    ${Value}    ${Xpath Value}

Confirm Xpath Hindi Text
    [Arguments]    ${Xpath}    ${Value}
    ${Xpath Value}    Get Text    xpath=${Xpath}
    ${Value}    Convert To String Hindi Text    ${Value}
    Should Be Equal    ${Value}    ${Xpath Value}

Confirm Xpath MultiCheckbox
    [Arguments]    ${Xpath}    ${Value}
    ${All Options Count}    Get Element Count    xpath=${Xpath}
    @{Xpath List}    Create List
    : FOR    ${Option}    IN RANGE    1    ${All Options Count} + 1
    \    ${Xpath Value}    Get Text    ${Xpath}[${Option}]
    \    Append To List    ${Xpath List}    ${Xpath Value}
    Should Be Equal    ${Xpath List}    ${Value["Select"]}

Confirm Xpath MultiSelect
    [Arguments]    ${Xpath}    ${Value}
    ${Xpath Value}    Get Text    xpath=${Xpath}
    ${Value}    Convert To String MultiSelect    ${Value}
    Should Be Equal    ${Value}    ${Xpath Value}

Confirm Xpath Photo
    [Arguments]    ${Xpath}    ${Value}
    ${Xpath Value}    Get Element Attribute    xpath=${Xpath}    src
    Compare Images    ${Xpath Value}    ${CURDIR}${/}data${/}UserInfo${/}${Value}    0.1
