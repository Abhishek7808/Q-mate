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
# TODO: increase product quantity required in CRO 1, CRO 2, CRO 3 and hanece increase amount also
Check Request CRO process
    [Tags]  requestcro  requestcro1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2   FI=FI 2    PO=PO 1    CRO=CRO 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    #Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    Sleep    3s
    Click Element    dropdownOpen
    Select From List By Label    status    Approved
    Click Button    btnApplyFillter
    Sleep    1s
    ${Product}    Get Substring    ${PO["Select Product"]}    0    -8
    log to console  ${Product}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s
    click element  //span[contains(text(),'CRO List')]
    click element  //button[@id='btnRequestCRO']
    Fill CRO
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 2
    Fill CRO
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 3
    Fill CRO
    sleep  5s
    Wait Until Keyword Succeeds    5s    200ms    Page should contain element    //span[contains(text(),'Request CRO')]

View CRO request status
    [Tags]  requestcro  requestcro2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 1    PO=PO 1    CRO=CRO 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    1s
    Fill CRO
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 2
    Fill CRO
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 3
    Fill CRO
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${SSO ID["Name"]}')]/../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    5s    200ms    Element Should Be Visible    //span[text()='Pending']

Check edit functionality when CRO is pending
    [Tags]  requestcro  requestcro3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${SSO ID["Name"]}')]/../following-sibling::td/i[@title='View']
    Set Test Variable    ${CRO}    ${Test Data["${CONFIG["CRO 1"]}"]}
    Sleep    1s
    Fill CRO
    Wait Until Keyword Succeeds    10s    200ms    Page should contain element    //span[contains(text(),'Request CRO')]
    Sleep    3s

Check that financial instrument available balance should be more than or equal to CRO amount when CRO is approved
    [Tags]  requestcro  requestcro4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    #Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../following-sibling::td/i[@title='View']
    #Wait Until Keyword Succeeds    5s    200ms    Click Element    span[contains(text(),'Approved')]/../preceding-sibling::span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    #${text}  Get text    //span[contains(text(),'Approved')]/../../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    #/preceding-sibling::span[contains(text(),'${FI["BG/LC Number"]}')]
    #/../following-sibling::td/i[@title='View']
    #log to console  ${text} text
    Wait Until Keyword Succeeds    5s    200ms    Click Element   //span[contains(text(),'Approved')]/../../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    Sleep    5s
    ${Available Value}    Get Text    //button[@id='btnHourglassEmpty']//div[text()='Available Value']/preceding-sibling::div
    ${Available Value}  remove string  ${Available Value}  ,
#    ${Available Value}    Split String    ${Available Value}    ,
#    ${Available Value}    Catenate    ${Available Value}
    ${Status}    Evaluate    ${Available Value}>=${CRO["Amount"]}
    Should Be Equal    '${Status}'    'True'

Check that CRO quantity cannot be greater than PO remaining balance
    [Tags]  requestcro  requestcro5
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]
    Sleep    2s
    ${List Item}    Get List Items    purchaseOrderId
    ${List Item}    Catenate    ${List Item}
    ${List Item}    Split String    ${List Item}    ,
    ${List Item}    Get From List    ${List Item}    1
    ${List Item}    Split String    ${List Item}    '
    ${PO No}    Get From List    ${List Item}    1
    Wait Until Keyword Succeeds    5s    200ms    Input Select    purchaseOrderId    ${PO No}
    Wait Until Element Is Visible    availableQuantity
    ${Amount}    Get Value    availableQuantity
    ${Amount}    Evaluate    ${Amount}+1
    Wait Until Keyword Succeeds    5s    200ms    Input Text    productQuantityRequired    ${Amount}
    Press Key    productQuantityRequired    \\09
    Sleep    1s
    ${Available Quantity}    Get Text    availableQuantity
    Page Should Contain    Enter Qty less than    ${Available Quantity}
