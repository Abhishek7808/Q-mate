*** Settings ***

*** Variables ***
${CitizenServices}   \#CitizenServices
${CustomerViewRegistration}  /ERP-DEMO/RSMML/Customer/CustomerViewRegistration
${groupList}  /ERP-DEMO/RSMML/Customer/GroupList
${agentList}  /ERP-DEMO/RSMML/Customer/AgentList
${purchaseOrderList}  /ERP-DEMO/RSMML/PurchaseOrder
${financialInstrumentList}  /ERP-DEMO/RSMML/Finance/InstrumentList
*** Keywords ***
Open Customer Registration Form
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    ${CitizenServices}
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    ${CustomerViewRegistration}

Open Group List Page
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${groupList}

Open Agent List Page
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${agentList}

Open Purchase Order List Page
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${purchaseOrderList}

Open Financial Instrument List
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${financialInstrumentList}