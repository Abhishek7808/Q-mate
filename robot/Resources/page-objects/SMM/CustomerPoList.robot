*** Settings ***

*** Keywords ***
Open Purchase Order List
    [Documentation]  Opens purchase order list page.
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder

Request Purchase Order
    [Documentation]  Clicks on request purchase order button.
     Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[(text()='Request PO')]

Apply Purchase Order Filter
    [Documentation]  Takes purchase order status as argument and selects status filter.
    [Arguments]  ${poStatus}
    Click Element    dropdownOpen
    Select From List By Label    status    ${poStatus}
    Click Button    btnApplyFillter

Get Purchase Order Details By Product
    [Documentation]  Takes product name as argument and opens purchase order related to it.
    [Arguments]  ${productName}
    ${Product}    Get Substring     ${productName}    0    -8
    log to console  ${Product}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s

Fetch PO Number From Pending PO
    [Documentation]  Takes product name as argument, fetches and return Po number corresponding to it.
    [Arguments]  ${productName}
    ${PO No}  get text  //span[contains(text(),'Pending')]/../../preceding-sibling::td/span[@title='${productName}']/../preceding-sibling::td[2]
    return from keyword  ${PO No}

Search Purchase Order By PO Number
    [Documentation]  Takes PO number as argument and searchs for it.
    [Arguments]  ${poNumber}
    input text  searchText  ${poNumber}

Open Purchase Order By PO Number
    [Documentation]  Takes PO number as argument, fetches and return Po number corresponding to it.
    [Arguments]  ${poNumber}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${poNumber}')]/../following-sibling::td/i[contains(text(),'visibility')]