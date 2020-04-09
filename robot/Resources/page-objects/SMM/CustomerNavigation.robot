*** Settings ***

*** Variables ***
${CitizenServices}   \#CitizenServices
${CustomerViewRegistration}  /ERP-DEMO/RSMML/Customer/ViewRegistration
${groupList}  /ERP-DEMO/RSMML/Customer/GroupList
${agentList}  /ERP-DEMO/RSMML/Customer/AgentList
${purchaseOrderList}  /ERP-DEMO/RSMML/PurchaseOrder
${financialInstrumentList}  /ERP-DEMO/RSMML/Finance/InstrumentList

*** Keywords ***
Open Customer Registration Form
    [Documentation]  Opens customer registration form.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    ${CitizenServices}
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    ${CustomerViewRegistration}

Open Group List Page
    [Documentation]  Opens group list page.
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${groupList}

Open Agent List Page
    [Documentation]  Opens agent list page.
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${agentList}

Open Purchase Order List Page
    [Documentation]  Opens purchase order list page.
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${purchaseOrderList}

Open Financial Instrument List
    [Documentation]  Opens financial instrument page.
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${financialInstrumentList}