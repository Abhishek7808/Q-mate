*** Settings ***


*** Test Cases ***


*** Keywords ***
Open Purchase Order List
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/PurchaseOrder

Request Purchase Order
     Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[(text()='Request PO')]

Get Purchase Order Details By Product
    [Arguments]  ${productName}
    ${Product}    Get Substring     ${productName}    0    -8
    log to console  ${Product}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //*[contains(text(),'${Product}')]/../following-sibling::td/i[contains(@title,'View')]
    Sleep    2s

