*** Variables ***
${pageUrl}  SMM/PurchaseOrder

*** Keywords ***
Go To Purchase Order List Page
    [Documentation]  Opens purchase order page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Apply Purchase Order Filter
    [Documentation]  Takes purchase order status(pending, approved etc.) and selects given filter from the filter menu.
    [Arguments]  ${poStatus}
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    ${poStatus}
    Click Button    btnApplyFillter

Open Details Of Purchase Order Selected By Product Name
    [Documentation]  Takes product name as argument and open details of corresponding purchase order.
    [Arguments]  ${productName}
    Click Element    //span[contains(text(),'${productName}')]/../following-sibling::td/i[contains(text(),'visibility')]

Fetch Purchase Order Number
    [Documentation]  Takes product name as argument and and fetches PO number of the corresponding purchase order. Returns the same.
    [Arguments]  ${productName}
    ${PO No}  Get Text    //span[contains(text(),'30% P205 Crushed Rock phosphate')]/../preceding-sibling::td[2]
    [Return]    ${PO No}

Generate Purchase Order
    [Documentation]  Clicks on generate purchase order button.
    Input Valid Value    Add Purchase Order

Open Details Of Purchase Order Selected By Purchase Order Number
    [Documentation]   Takes PO number as argument and open details of corresponding purchase order.
    [Arguments]  ${poNumber}
    Click Element    //span[contains(text(),'${PO No}')]/../following-sibling::td/i[contains(text(),'visibility')]

Open Details Of Purchase Order Selected By Branch Name
    [Documentation]  Takes branch name as argument and open details of corresponding purchase order.
    [Arguments]  ${branchName}
    Wait Until Keyword Succeeds    5s    250ms    click element  //span[contains(text(),'${branchName}')]/../following-sibling::td/i[@title='View']

Search For Purchase Order
    [Documentation]  Searches of purchase order by branch name.
    [Arguments]  ${branchName}
    input text  searchText  ${branchName}

#Search Purchase Order By PO Number
#    [Arguments]  ${poNumber}
