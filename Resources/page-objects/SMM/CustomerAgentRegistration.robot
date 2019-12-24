*** Settings ***
Documentation    Suite description

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Edit Agent Name
    [Arguments]  ${newName}
    Wait Until Keyword Succeeds    5s    200ms    Clear Text Value    agentName
    Wait Until Keyword Succeeds    5s    200ms    Input Text Value    agentName    ${newName}
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnSaveUpdate

Fill Agent