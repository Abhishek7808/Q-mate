*** Keywords ***
Convert To String Date
    [Arguments]    ${Value}
    ${Date Int}    Convert To Integer    ${Value["Date"]}
    Return From Keyword If    ${Date Int}<10    0${Value["Date"]}-${Value["Month"]}-${Value["Year"]}
    Return From Keyword If    ${Date Int}>9    ${Value["Date"]}-${Value["Month"]}-${Value["Year"]}

Convert To String Hindi Text
    [Arguments]    ${Value}
    ${Value}    Catenate    SEPARATOR=${EMPTY}    @{Value}
    ${Value}    Replace String    ${Value}    &nbsp;    ${SPACE}
    [Return]    ${Value}

Convert To String MultiSelect
    [Arguments]    ${Value}    ${Sep}=,
    ${Value}    Catenate    SEPARATOR=${Sep}    @{Value}
    [Return]    ${Value}

Convert To String Photo
    [Arguments]    ${Value}
    ${Value Photo Path}    Split String    ${Value}    \\
    ${Value Photo Name}    Get From List    ${Value Photo Path}    -1
    [Return]    ${Value Photo Name}

Convert To String File
    [Arguments]    ${Value}
    ${Value File Path}    Split String    ${Value}    \\
    ${Value File Name}    Get From List    ${Value File Path}    -1
    [Return]    ${Value File Name}
