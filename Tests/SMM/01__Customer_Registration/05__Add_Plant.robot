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
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
Check_Add_Plant_process
    [Tags]  Addplant  Addplant1
    BrowserControl.Switch To    Customer
#    set test variable    ${ssoId}    chauhan.yuvi
#    Delete Data Of SSOID    ${ssoId}
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 3    SSO ID=SSOID 2    Plant=Plant 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //button[@id='plantDetail']
    sleep  3s
    run keyword and ignore error  click button  btnView
    run keyword and ignore error  click element   //i[contains(text(),'add_circle')]
    Fill Plants
    Sleep    3s


#TODO: Process is not logical
#Add_Plant_at_the_time_of_PO_request
#    [Tags]  Addplant  Addplant2
#    BrowserControl.Switch To    Customer
#    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    Plant=Plant 1    PO=PO 2
#    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
#    Sleep    2s
#    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
#    Sleep    2s
#    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
#    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/AgentList
#    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[text()='Add Agent']/ancestor::button
#    Fill Agent
#    Sleep    5s
#    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
#    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
#    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request PO')]
#    Fill PO
#    Sleep    1s
#    Input Valid Value    Plant Button PO Form
#    Fill Plants
#    Sleep    2s
