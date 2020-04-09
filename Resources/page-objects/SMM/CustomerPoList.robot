*** Settings ***

*** Keywords ***
Open Purchase Order List
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder

Request Purchase Order
     Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[(text()='Request PO')]

Apply Purchase Order Filter
    [Arguments]  ${poStatus}
    Click Element    dropdownOpen
    Select From List By Label    status    ${poStatus}
    Click Button    btnApplyFillter

Get Purchase Order Details By Product
    [Arguments]  ${productName}
    ${Product}    Get Substring     ${productName}    0    -8
    log to console  ${Product}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s


Fetch PO Number From Pending PO
    [Arguments]  ${productName}
    ${PO No}  get text  //span[contains(text(),'Pending')]/../../preceding-sibling::td/span[@title='${productName}']/../preceding-sibling::td[2]
    return from keyword  ${PO No}

Search Purchase Order By PO Number
    [Arguments]  ${poNumber}
    input text  searchText  ${poNumber}

Open Purchase Order By PO Number
    [Arguments]  ${poNumber}
     Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${poNumber}')]/../following-sibling::td/i[contains(text(),'visibility')]