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
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing


*** Variables ***
@{Branches}       ${Test Data["${CONFIG["Branch Customer 1"]}"]["Name"]}    ${Test Data["${CONFIG["Branch Customer 3"]}"]["Name"]}

*** Test Cases ***
To check the Transfer of LC/BG
    [Tags]    transferlcbg  transferlcbg1
    Switch To    Customer
    Set Test Variable    ${SSO ID}    ${Test Data["${CONFIG["SSOID 1"]}"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Set Test Variable    ${Company}    ${Test Data["${CONFIG["Company Customer 1"]}"]}
    Set Test Variable    ${FI}    ${Test Data["${CONFIG["FI 2"]}"]}
    Set Test Variable    ${PO}    ${Test Data["${CONFIG["PO 1"]}"]}
    Set Test Variable    ${CRO}    ${Test Data["${CONFIG["CRO 2"]}"]}
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    sleep  5s
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Transfer History')]
    sleep  2s
    Wait Until Keyword Succeeds    5s    500ms    Click Button    btnTransferInstrument
    Sleep    1s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Wait Until Keyword Succeeds    5s    200ms    Select From List By Label    //select[@id='member']    ${Branch["Name"]}
    Wait Until Keyword Succeeds    5s    200ms    Input Text    Amount    5000
    Click Button    btnRequestTransfer
    Sleep    2s
    Switch To    Verify
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Finance/InstrumentList
    Sleep    1s
    Input Text    searchText    ${FI["BG/LC Number"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    sleep  4s
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Transfer${SPACE}History')]
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${FI["Transfer Amount"]}')]/../preceding-sibling::td//span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'Pending')]/../../following-sibling::td/i[contains(@title,'Edit')]
    Wait Until Keyword Succeeds    5s    200ms    Click Button    actionName-Approve
    Sleep    2s
    Switch To    Customer
#    Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
#    Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Sleep    2s
    Element Should Be Visible    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']

To check that the transfer of FI can only be done within group members.
    [Tags]    transferlcbg  transferlcbg2
    Switch To    Customer
    Set Test Variable    ${SSO ID}    ${Test Data["${CONFIG["SSOID 1"]}"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Set Test Variable    ${Company}    ${Test Data["${CONFIG["Company Customer 1"]}"]}
    Set Test Variable    ${FI}    ${Test Data["${CONFIG["FI 2"]}"]}
    Set Test Variable    ${PO}    ${Test Data["${CONFIG["PO 1"]}"]}
    Set Test Variable    ${CRO}    ${Test Data["${CONFIG["CRO 2"]}"]}
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    500ms    Wait Until Keyword Succeeds    5s    200ms    Click Link  \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    Sleep    5s
    Click Element    //span[contains(text(),'Transfer History')]
    Sleep    2s
    Click Button    btnTransferInstrument
    Sleep    2s
    Click Element    member
    ${Labels}    Wait Until Keyword Succeeds    5s    200ms    Get Text    member
    ${Labels}    Split String    ${Labels}    \n
    Log    ${Labels}
    set test variable  ${Branch}   ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Should Be Equal    ${Labels}[0]    ${Branch["Name"]}
    set test variable  ${Branch}   ${Test Data["${CONFIG["Branch Customer 3"]}"]}
    Should Be Equal    ${Labels}[1]    ${Branch["Name"]}

To check that the transfer amount cannot exceed available amount of FI
    [Tags]    transferlcbg  transferlcbg3
    Switch To    Customer
    Set Test Variable    ${SSO ID}    ${Test Data["${CONFIG["SSOID 1"]}"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Set Test Variable    ${Company}    ${Test Data["${CONFIG["Company Customer 1"]}"]}
    Set Test Variable    ${FI}    ${Test Data["${CONFIG["FI 2"]}"]}
    Set Test Variable    ${PO}    ${Test Data["${CONFIG["PO 1"]}"]}
    Set Test Variable    ${CRO}    ${Test Data["${CONFIG["CRO 2"]}"]}
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Sleep    2s
    Click Element    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    Sleep    2s
    ${Amount}    Get Text    //button[@id='btnHourglassEmpty']//div[text()='Available Value']/preceding-sibling::div
    ${Amount}    Remove String    ${Amount}    ,
    ${Amount}    Evaluate    ${Amount}+1
    Click Element    //span[contains(text(),'Transfer History')]
    Sleep    2s
    Click Button    btnTransferInstrument
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Wait Until Keyword Succeeds    5s    200ms    Select From List By Label    member    ${Branch["Name"]}
    Wait Until Keyword Succeeds    5s    200ms    Input Text    Amount    ${Amount}
    Click Button    btnRequestTransfer
    Element Text Should Be    //span[@class='error-message']    Value Should be Less Than available value
