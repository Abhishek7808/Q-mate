*** Variables ***
${pageUrl}  /SMM/PurchaseOrder/RenewPOList

*** Keywords ***
Go To Renew Po Page
    [Documentation]  Opens renew purchase order form.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Search For Purchase Order
    [Documentation]  Searchs purchase order by name.
    [Arguments]  ${branchName}
    input text  uncontrolled  ${branchName}

Select Purchase Order
    [Documentation]  Takes branch name of the purchase order as argument and selects checkbox of the purchase order.
    [Arguments]  ${branchName}
    Wait Until Keyword Succeeds    5s    250ms    Select Checkbox    //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//input

Renew Selected Purchase Order
    [Documentation]  Does renewal process of the selected purchase order.
    Input Valid Value    Renew PO Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order New Expiry Date    ${PO["New Expiry Date"]}
    Wait Until Keyword Succeeds    5s    250ms    Click Button    Update Po
    Sleep    5s