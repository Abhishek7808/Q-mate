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

*** Test Cases ***
Add Financial Instrument
    [Tags]  Financial  Financial1
    Switch To    Customer
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument
    Fill FI
    Sleep    3s
    Element Should Be Visible    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    Set Test Variables    Branch=Branch Customer 1    FI=FI 1
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument
    Fill FI
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument
    Set Test Variables    FI=FI 2
    Fill FI
    Sleep    2s

Check the edit process for pending FI
    [Tags]  Financial  Financial2
    Switch To    Customer
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Sleep    2s
    Click Element     //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    Sleep    2s
    Set Test Variable    ${FI}    ${Test Data["${CONFIG["FI 2"]}"]}
    Fill FI
    Sleep    2s

Check that only after Financial Instrument approval, CRO can be generated
    [Tags]  Financial  Financial3
    Switch To    Customer
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    5s
    ${List Item}    Get List Items    purchaseOrderId
    Log    ${List Item}
    ${List Item}    Catenate    ${List Item}
    ${List Item}    Split String    ${List Item}    ,
    ${List Item}    Get From List    ${List Item}    1
    Log    ${List Item}
    ${List Item}    Split String    ${List Item}    '
    ${List Item}    Get From List    ${List Item}    0
    Select From List By Label    purchaseOrderId    ${List Item}
    Press Key    purchaseOrderId    //09
    Sleep    2s
    Select From List By Label    paymentMode    Credit
    Simulate Event    paymentMode    blur
    Select From List By Label    paymentMode    Credit
    Sleep    1s
    Select From List By Label    instrumentType    Letter of Credit (LC)
    Sleep    2s
    ${Value}    Get List Items    instrument
    : FOR    ${Val}    IN    @{Value}
    \    Should Not Be Equal    ${Val}    ${FI["BG/LC Number"]}

Check edit functionality for approved FI
    [Tags]  Financial  Financial4
    Switch To    Customer
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Approve FI
    Switch To    Customer
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Sleep    2s
    Click Element   //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    Sleep    5s
    ${status}  run keyword and return status  Page Should Not Contain Button    btnUpdate
    log  ${status}