*** Settings ***


*** Variables ***
${pageUrl}  /SMM/PurchaseOrder/RenewPOList

*** Keywords ***
Go To Renew Po Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Search For Purchase Order
    [Arguments]  ${branchName}
    input text  uncontrolled  ${branchName}

Select Purchase Order
    [Arguments]  ${branchName}
    Wait Until Keyword Succeeds    5s    250ms    Select Checkbox    //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//input

Renew Selected Purchase Order
    Input Valid Value    Renew PO Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order New Expiry Date    ${PO["New Expiry Date"]}
    Wait Until Keyword Succeeds    5s    250ms    Click Button    Update Po
    Sleep    5s