*** Settings ***

*** Keywords ***
Verify Presence Of Agent
    [Documentation]  Takes agent name as argument and verifies that it is visible on the page.
    [Arguments]  ${agentName}
    Element Should Be Visible    //*[contains(text(),'${agentName}')]

Open Agent Details
    [Documentation]  Takes agent name as argument and opens its details.
    [Arguments]  ${aganetName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${aganetName}')]/../following-sibling::td/i[@title='View']