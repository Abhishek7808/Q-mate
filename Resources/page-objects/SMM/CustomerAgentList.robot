*** Settings ***


*** Test Cases ***


*** Keywords ***
Verify Presence Of Agent
    [Arguments]  ${agentName}
    Element Should Be Visible    //*[contains(text(),'${agentName}')]

Open Agent Details
    [Arguments]  ${aganetName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${aganetName}')]/../following-sibling::td/i[@title='View']