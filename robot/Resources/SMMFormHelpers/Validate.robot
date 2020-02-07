*** Settings ***
Resource          ${CURDIR}${/}Keywords${/}Fields${/}Field.robot

*** Keywords ***
Validate Same As Above
    [Arguments]    ${Same As Above}
    : FOR    ${Element Key}    IN    @{Same As Above["Compare"].keys()}
    \    Input Valid Value    ${Element Key}    ${User["${Element Key}"]}
    : FOR    ${Element Key}    IN    @{Same As Above["Compare"].keys()}
    \    Clear Field    ${Same As Above["Compare"]["${Element Key}"]}
    Input Valid Value    ${Same As Above["Element Key"]}    Select
    : FOR    ${Element Key}    IN    @{Same As Above["Compare"].keys()}
    \    Confirm Type    ${Same As Above["Compare"]["${Element Key}"]}    ${User["${Element Key}"]}

Validate Field
    [Arguments]    ${Key}
    [Documentation]    Check whether the field is dependent or not.
    : FOR    ${Validation}    IN    @{KEY TO VALIDATE["${Key}"]["Validations"]}
    \    ${Dependent Field Count}    Get Length    ${KEY TO VALIDATE["${Key}"]["Depends On"]}
    \    Run Keyword If    ${Dependent Field Count}>0    Input Multiple Valid Value    ${KEY TO VALIDATE["${Key}"]["Depends On"]}    ${Validation["Dependencies"]}
    \    Validate Field Data    ${Key}    ${Validation}
    [Teardown]    Input User Multiple Value    @{KEY TO VALIDATE["${Key}"]["Depends On"]}    ${Key}

Validate Field Data
    [Arguments]    ${Key}    ${Values To Validate}
    ${Disabled Field}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values To Validate}    Disabled
    Run Keyword If    ${Disabled Field}    Validate Disabled Field    ${Key}
    Return From Keyword If    ${Disabled Field}
    Validate Invalid Data    ${Key}    ${Values To Validate}
    Run Keyword If    '${Page["Elements"]["${Key}"]}'=='True'    Validate Mandatory Field    ${Key}    ${Values To Validate}
    ${Validate On Next Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values To Validate}    Not Allowed Values On Next
    Run Keyword If    ${Validate On Next Present}    Validate Invalid Data On Next    ${Key}    ${Values To Validate}
    ${Error Message On Next Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values To Validate}    Error Message On Next
    Run Keyword If    ${Error Message On Next Present}    Validate Error Message On Next    ${Key}    ${Values To Validate}
    Validate Valid Data    ${Key}    ${Values To Validate}

Validate Invalid Data
    [Arguments]    ${Key}    ${Values To Validate}
    ${Status}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values To Validate}    Pop Up Present On Invalid Values
    Run Keyword If    ${Status}    Input Invalid Values    ${Key}    ${Values To Validate["Not Allowed Values"]}    ${Values To Validate["Pop Up Present On Invalid Values"]}
    ...    ELSE    Input Invalid Values    ${Key}    ${Values To Validate["Not Allowed Values"]}

Validate Valid Data
    [Arguments]    ${Key}    ${Values To Validate}
    Input Valid Values    ${Key}    ${Values To Validate["Allowed Values"]}

Validate Disabled Field
    [Arguments]    ${Key}
    Confirm Disabled    ${KEY TO LOCATOR["${Key}"]}

Validate Mandatory Field
    [Arguments]    ${Key}    ${Values To Validate}
    ${Mandatory Pop Up Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values To Validate}    Mandatory Pop Up
    ${Highlighted Pop Up Present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${Values To Validate}    Highlighted Pop Up
    Run Keyword If    ${Mandatory Pop Up Present}    Validate Mandatory Pop Up    ${Key}    ${Values To Validate["Mandatory Pop Up"]}
    Run keyword if    ${Highlighted Pop Up Present}    Validate Highlighted Pop Up    ${Key}    ${Values To Validate["Highlighted Pop Up"]}

Validate Mandatory Pop Up
    [Arguments]    ${Key}    ${Mandatory Pop Up}
    Clear Field    ${Key}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    Next
    Run Keyword And Continue On Failure    Alert Should Be Present    ${Mandatory Pop Up}

Validate Highlighted Pop Up
    [Arguments]    ${Key}    ${Highlighted Pop Up}
    Clear Field    ${Key}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    Next
    ${Highlighted Field Attr}    Get Element Attribute    ${KEY TO LOCATOR["${Highlighted Pop Up}"]}    style
    ${Highlighted Field Attr List}    Split String    ${Highlighted Field Attr}    ;
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${Highlighted Field Attr List}    display: none

Validate Invalid Data On Next
    [Arguments]    ${Key}    ${Values To Validate}
    : FOR    ${Not Allowed Value}    IN    @{Values To Validate["Not Allowed Values On Next"]}
    \    Input Valid Value    ${Key}    ${Not Allowed Value}
    \    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    Next
    \    Run Keyword And Continue On Failure    Alert Should be Present    ${Values To Validate["Not Allowed Values On Next Pop Up"]}

Validate Error Message On Next
    [Arguments]    ${Key}    ${Values To Validate}
    : FOR    ${Not Allowed Value}    IN    @{Values To Validate["Error Message On Next"].keys()}
    \    Input Valid Value    ${Key}    ${Not Allowed Value}
    \    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    Next
    \    Run Keyword And Continue On Failure    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page Should Contain Element    //div[@class='imgs_error_']//li[contains(text(),'${Values To Validate["Error Message On Next"]["${Not Allowed Value}"]}')]
