*** Settings ***


*** Variables ***
${pageUrl}  SMM/PurchaseOrder

*** Keywords ***
Go To Purchase Order List Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Apply Purchase Order Filter
    [Arguments]  ${poStatus}
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    Pending
    Click Button    btnApplyFillter

Open Details Of Purchase Order Selected By Product Name
    [Arguments]  ${productName}
    Click Element    //span[contains(text(),'${productName}')]/../following-sibling::td/i[contains(text(),'visibility')]