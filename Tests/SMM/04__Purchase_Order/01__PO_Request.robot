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
Request for Purchase Order(PO)
    [Tags]  requestpurchaseorder  rqpo1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Purchase Order List By Customer
    SMM_Keywords.Generate Purchase Order By Customer

Get notification after PO request approved/rejected
    [Tags]  requestpurchaseorder  rqpo2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Purchase Order List By Customer
    Sleep  2s
    SMM_Keywords.Get Purchase Order Number From Pending PO  ${PO["Select Product"]}
    ${poNumber}  SMM_Keywords.Get Purchase Order Number From Pending PO
    Sleep    3s
    BrowserControl.Switch To    Verify
    SMM_Keywords.Approve Pending PO By PO Number  ${poNumber}
    BrowserControl.Switch To    Customer
    Sleep    1s
    SMM_Keywords.Filter Purchase Order List By Status  Approved
    SMM_Keywords.Search Purchase Order in Purchase Order List By Customer  ${poNumber}
    Sleep    1s
    SMM_Keywords.View Purchase Order By PO Number  ${PO No}
    Sleep    3s
    Verify Approval Of Purchase Order

Check edit functionality when status of PO is approved/rejected.
    [Tags]  requestpurchaseorder  rqpo3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    Sleep    3s
    Click Element    dropdownOpen
    Select From List By Label    status    Approved
    Click Button    btnApplyFillter
    Sleep    1s
    ${Product}    Get Substring    ${PO["Select Product"]}    0    -8
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${Product}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Sleep    2s
    Click Button    btnEditPo
    Input Text    newPoQuantity    4500
    Input Text    newPinCode    313002
    Input Search Agent    react-select-2-input    YUVRAJ SINGH CHAUHAN
    Click Button    btnSubmitChangeReq
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[text()='Update History']
    Sleep    2s
    Page Should Contain Element    //td/i[contains(text(),'visibility')]

Check that signed copy of End User Agreement is mandatory for PO approval
    [Tags]  requestpurchaseorder  rqpo4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    5s    200ms    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request PO')]
    Sleep    2s
    Fill PO
    Sleep    3s
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request PO')]
    #TODO: couldnot understand the use of code below
#    Sleep    2s
#    Select From List By Label    unit    ...Nagaur(07)
#    Sleep    2s
#    Click Button    submitpo
#    Sleep    3s
#    Page Should Contain    Upload File

Request for Purchase Order(PO) for auctionable products
    [Tags]  requestpurchaseorder  rqpo5
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 3
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    5s    200ms    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request PO')]
    Sleep    2s
    Fill PO
    Sleep    3s
