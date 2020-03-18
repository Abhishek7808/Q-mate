*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot


*** Variables ***
${Agent Description File}    AgentCustomerSideKeyDescription.json
${Agent FormInfo File}    AgentCustomerFormInfo.json
${Agent User File}    AgentCustomerUserInfo.json
${Type To Keyword File}    TypeToKeyword.json
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
Check the agent registration process through agent tab
    [Documentation]  Opens Agent list page and checks for an agent.
    [Tags]  SMM  agentregistration  addagent  registration
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Agent List
    Sleep    2s
    SMM_Keywords.Check For an Agent On Agent List Page  ${SSO ID["Name"]}

Check the agent registration process through PO form
    [Documentation]  Registers an agent through purchase order regstration form.
    [Tags]  SMM  agentregistration  addagent  registrationthroughpo
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 3    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Purchase Order List As A Customer
    SMM_Keywords.Request Purchase Order By Customer
    Sleep    2s
    SMM_Keywords.Add Agent Details
    Sleep    5s
    SMM_Keywords.Add Purchase Order Details

To check the edit functionality of agent details from agent tab when PO pending or approved
    [Documentation]  Edits agent details.
    [Tags]  SMM  agentregistration  addagent  editdetailspopending
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Agent List
    SMM_Keywords.View Agent Details  ${SSO ID["Name"]}
    Sleep    2s
    SMM_Keywords.Edit Agent Details  ${SSO ID["Name"]} UDAIPUR
    Sleep    2s
    SMM_Keywords.View Purchase Order List By Customer
    SMM_Keywords.Select Purchase Order By Product  ${PO["Select Product"]}
    SMM_Keywirds.Verify Agent Name In Purchase Order  ${SSO ID["Name"]} UDAIPUR

To check the edit functionality of agent details from CRO form when CRO pending
    [Documentation]  Edits agent details when CRO is pending.
    [Tags]  SMM  agentregistration  addagent  editdetailscropending
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep  2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep  2s
    SMM_Keywords.View Agent List
    SMM_Keywords.View Agent Details  ${SSO ID["Name"]}
    Sleep  2s
    SMM_Keywords.Edit Agent Details  ${SSO ID["Name"]}
    Sleep  2s
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    SMM_Keywords.Approve Pending Purchase Order  ${PO["Select Product"]}
    sleep  4s
    SMM_Keywords.Filter Purchase Order List By Status  Approved
    sleep  3s
    ${poNumber}  SMM_Keywords.Get Purchase Order Number  ${PO["Select Product"]}
    BrowserControl.Switch To    Customer
    Sleep    1s
    SMM_Keywords.View Purchase Order List By Customer
    SMM_Keywords.Select Purchase Order By Product  ${PO["Select Product"]}
    Sleep    2s
    SMM_Keywords.Request CRO From PO Form
    SMM_Keywords.Select Purchase Order In CRO Form  ${poNumber}
    SMM_Keywords.Verify Agent Name In Contract Release Order  ${SSO ID["Name"]}

To check the validations applied when agent selected in CRO request form
    #TODO : waiting for Request CRO button
    [Documentation]  Search for agent name in CRO registration form.
    [Tags]  SMM  agentregistration  addagent  validations
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View CRO List By Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    5s
    SMM_Keywords.Select Purchase Order In CRO Form
    Sleep    2s
    SMM_Keywords.Verify Agent Name In Contract Release Order  ${SSO ID["Name"]}