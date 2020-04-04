*** Settings ***

*** Variables ***
${viewString}  following-sibling::td/i[@title='View']

*** Keywords ***
Open CRO List By Customer
    [Documentation]  Opens CRO list page.
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder

Request CRO
    [Documentation]  Clicks on request CRO button.
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]

Open CRO Details
    [Documentation]  Takes agent name, branch name and required quantity as argument and opens CRO details correspoding to it.
    [Arguments]  ${agentName}  ${branchName}  ${quantityReq}
    run keyword if  ${agentName} != None  Click Element  //span[contains(text(),'${agentName}')]/../${viewString}
    run keyword if  ${branchName} != None  Click Element  //span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'${quantityReq}')]/../${viewString}


