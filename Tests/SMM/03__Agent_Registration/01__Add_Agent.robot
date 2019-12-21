*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot



*** Variables ***
${Agent Description File}    AgentCustomerSideKeyDescription.json
${Agent FormInfo File}    AgentCustomerFormInfo.json
${Agent User File}    AgentCustomerUserInfo.json
${Type To Keyword File}    TypeToKeyword.json
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
Check the agent registration process through agent tab
    [Tags]  Addagent  Addagent1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/AgentList
    Sleep    2s
    ${status}  run keyword and return status  Element Should Be Visible    //*[contains(text(),'${SSO ID["Name"]}')]
    log  ${status}
    run keyword if  ${status} == ${False}  fail  //span[contains(text(),'${SSO ID["Name"]}')] element is not visible

Check the agent registration process through PO form
    [Tags]  Addagent  Addagent2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 3    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[(text()='Request PO')]
    Sleep    2s
    Click Button    btnAddAgentPo
    Fill Agent
    Sleep    5s
    Fill PO
    Sleep    2s

To check the edit functionality of agent details from agent tab when PO pending or approved
    [Tags]  Addagent  Addagent3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/AgentList
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${SSO ID["Name"]}')]/../following-sibling::td/i[@title='View']
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Clear Text Value    agentName
    Wait Until Keyword Succeeds    5s    200ms    Input Text Value    agentName    ${SSO ID["Name"]} UDAIPUR
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnSaveUpdate
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    ${Product}    Get Substring    ${PO["Select Product"]}    0    -8
    log to console  ${Product}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s
    Element Should Be Visible    //span[contains(text(),'${SSO ID["Name"]} UDAIPUR')]

To check the edit functionality of agent details from CRO form when CRO pending
    [Tags]  Addagent  Addagent4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/AgentList
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${SSO ID["Name"]}')]/../following-sibling::td/i[@title='View']
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Clear Text Value    agentName
    Wait Until Keyword Succeeds    5s    200ms    Input Text Value    agentName    ${SSO ID["Name"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnSaveUpdate
    Sleep    2s
    ${PO No}  run keyword and ignore error    Approve PO By Product
    BrowserControl.Switch To    Customer
    Sleep    1s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    ${Product}    Get Substring    ${PO["Select Product"]}    0    -8
    log to console  ${Product}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s
    click element  //span[contains(text(),'CRO List')]
    click element  //button[@id='btnRequestCRO']
    Select From List By index    purchaseOrderId    1
    Press Key    purchaseOrderId    //09
    Sleep    2s
    Element Should Be Visible    //span[contains(text(),'${SSO ID["Name"]}')]

To check the validations applied when agent selected in CRO request form
    #TODO : waiting for Request CRO button
    [Tags]  Addagent  Addagent5
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    5s
    ${List Item}    Get List Items    purchaseOrderId
    ${List Item}    Catenate    ${List Item}
    ${List Item}    Split String    ${List Item}    ,
    ${List Item}    Get From List    ${List Item}    1
    ${List Item}    Split String    ${List Item}    '
    ${List Item}    Get From List    ${List Item}    1
    Select From List By Label    purchaseOrderId    ${List Item}
    Press Key    purchaseOrderId    //09
    Sleep    2s
    ${Count}    Get Element Count    //div[@role='button']
    Run Keyword If    ${Count}==1    Element Should Be Visible    //span[contains(text(),'${SSO ID["Name"]}')]
