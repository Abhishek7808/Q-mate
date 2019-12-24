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



*** Test Cases ***
Add Financial Instrument
    [Tags]  Financial  Financial1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument
    Fill FI
    Sleep    3s
    Element Should Be Visible    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    SMM_Keywords.Go To Profile Selection Page
    Common_Keywords.Set Test Variables    Branch=Branch Customer 1    FI=FI 1
    Wait Until Keyword Succeeds    5s    200ms    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument
    Fill FI
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument
    Common_Keywords.Set Test Variables    FI=FI 2
    Fill FI
    Sleep    2s

Check the edit process for pending FI
    [Tags]  Financial  Financial2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
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
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    FI=FI 2   PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
SMM_Keywords.View Purchase Order List By Customer
    Sleep    3s
    Click Element    dropdownOpen
    Select From List By Label    status    Approved
    Click Button    btnApplyFillter
    Sleep    1s
    ${Product}    Get Substring    ${PO["Select Product"]}    0    -8
    log to console  ${Product}
    sleep  3s
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s
    click element  //span[contains(text(),'CRO List')]
    click element  //button[@id='btnRequestCRO']
    ${List Item}    Get List Items    purchaseOrderId
    Log    ${List Item}
    ${List Item}    Catenate    ${List Item}
    ${List Item}    Split String    ${List Item}    ,
    ${List Item}    Get From List    ${List Item}    1
    Log to console  ${List Item}
    ${List Item}    Split String    ${List Item}    '
    ${List Item}    Get From List    ${List Item}    1
    Log to console  ${List Item}
    Wait Until Keyword Succeeds    5s    200ms    Select From List By Label    purchaseOrderId    ${List Item}
    Press Key    purchaseOrderId    //09
    Sleep    2s
    Input Valid Value    Contract Release Order Product Quantity Required  12
    Input Valid Value    Contract Release Order Select Dispatch Point    JHAMARKOTRA
    Select From List By Label    paymentMode    Credit
    Simulate Event    paymentMode    blur
    Select From List By Label    paymentMode    Credit
    Sleep    3s

    Wait Until Keyword Succeeds    10s    200ms    Select From List By Label    instrumentType    Letter of Credit (LC)
    Sleep    2s
    ${Value}    Get List Items    instrument
    : FOR    ${Val}    IN    @{Value}
    \    Should Not Be Equal    ${Val}    ${FI["BG/LC Number"]}

Check edit functionality for approved FI
    [Tags]  Financial  Financial4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Approve FI
    BrowserControl.Switch To    Customer
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    Sleep    2s
    Click Element   //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    Sleep    5s
    ${status}  run keyword and return status  Page Should Not Contain Button    btnUpdate
    log  ${status}