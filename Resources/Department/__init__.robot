*** Keywords ***
Nested FOR Loop
    [Arguments]    ${Key}    ${Value}
    ${Size}    Get Length    ${Value}
    Run keyword If    '${Size}'=='0'    Input Type    ${Key}    ${EMPTY}
    ...    ELSE    Run Keyword    InputVal    ${Key}    ${Value}    ${Size}

InputVal
    [Arguments]    ${Key}    ${Value}    ${Size}
    ${tempConfig}    Set Variable    ${testData}
    : FOR    ${temp}    IN RANGE    0    ${Size}
    \    ${Temp Value}    Get From List    ${Value}    ${temp}
    \    ${tempConfig}    Set Variable    ${tempConfig["${Temp Value}"]}
    #${Temp Value}    Get From List    ${Value}    -1
    Run Keyword And Continue On Failure    Input Valid Value    ${Key}    ${tempConfig}
    Log    ${Key} ${tempConfig}
