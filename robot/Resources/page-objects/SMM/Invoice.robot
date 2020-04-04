*** Settings ***
Documentation    Suite description


*** Variables ***
${pageUrl}  SMM/Invoice/InvoiceList

*** Keywords ***
Go To Invoice Page
    [Documentation]  Opens invoice page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Print Invoice
    [Documentation]  Takes invoice number as argument and clicks on print button correspondig ro the invoice number.
    [Arguments]  ${invoiceNumber}
    set test variable  ${Invoice Number}   ${invoiceNumber}
    Click Element    //span[contains(text(),'${Invoice Number}')]/../following-sibling::td/i[@title='Print']
    Sleep    25s
    ${Moisture Rebate}    Get Text    //span[contains(text(),'${Invoice Number}')]/../following-sibling::td