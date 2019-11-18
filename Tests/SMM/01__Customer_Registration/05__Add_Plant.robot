*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ${CURDIR}${/}Keywords${/}browser.robot
Resource          ${CURDIR}${/}Keywords${/}Fields${/}Field.robot
Resource          ${CURDIR}${/}Keywords${/}Department${/}Registration.robot
Resource          ${CURDIR}${/}Keywords${/}Customer${/}Customer.robot

*** Variables ***
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
Check_Add_Plant_process
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    Plant=Plant 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Plant Details')]
    Fill Plants
    Sleep    3s

Add_Plant_at_the_time_of_PO_request
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    Plant=Plant 1    PO=PO 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/AgentList
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[text()='Add Agent']/ancestor::button
    Fill Agent
    Sleep    5s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request PO')]
    Fill PO
    Sleep    1s
    Input Valid Value    Plant Button PO Form
    Fill Plants
    Sleep    2s
