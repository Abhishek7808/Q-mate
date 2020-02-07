*** Settings ***


*** Variables ***
${pageUrl}  SMM/PurchaseOrder

*** Keywords ***
Go To Purchase Order List Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Apply Purchase Order Filter
    [Arguments]  ${poStatus}
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    ${poStatus}
    Click Button    btnApplyFillter

Open Details Of Purchase Order Selected By Product Name
    [Arguments]  ${productName}
    Click Element    //span[contains(text(),'${productName}')]/../following-sibling::td/i[contains(text(),'visibility')]

Fetch Purchase Order Number
    [Arguments]  ${productName}
    ${PO No}  Get Text    //span[contains(text(),'30% P205 Crushed Rock phosphate')]/../preceding-sibling::td[2]
    [Return]    ${PO No}

Generate Purchase Order
    Input Valid Value    Add Purchase Order

Open Details Of Purchase Order Selected By Purchase Order Number
    [Arguments]  ${poNumber}
    Click Element    //span[contains(text(),'${PO No}')]/../following-sibling::td/i[contains(text(),'visibility')]

Open Details Of Purchase Order Selected By Branch Name
    [Arguments]  ${branchName}
    Wait Until Keyword Succeeds    5s    250ms    click element  //span[contains(text(),'${branchName}')]/../following-sibling::td/i[@title='View']

Search For Purchase Order
    [Arguments]  ${branchName}
    input text  searchText  ${branchName}

#Search Purchase Order By PO Number
#    [Arguments]  ${poNumber}
