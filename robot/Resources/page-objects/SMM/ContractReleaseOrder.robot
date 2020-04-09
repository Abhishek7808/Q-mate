*** Keywords ***
Forward CRO To ME
    [Documentation]  Forwards CRO to Marketing Executive
    Input Valid Value    Contract Release Order Forward to ME Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Next Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Expiry Date    ${CRO["Expiry Date"]}
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Forward To Marketing Executive Button

Forward CRO To SE
    [Documentation]  Forwards CRO to Sales Executive
    Forward CRO
    Input Valid Value    Contract Release Order Forward to SE Button
    Wait Until Keyword Succeeds    5s    500ms    click button  btnSE

Approve CRO
    [Documentation]  Clicks on approve button.
    Input Valid Value    Contract Release Order Approve Button
    reload page
    sleep  4s

Reject CRO
    [Documentation]  Clicks on reject button and fills remarks in it.
    Input Valid Value    Contract Release Order Reject Button    rejectRemarks
    Input Valid Value    Contract Release Order Reject Remarks    ${CRO["Reject Remarks"]}
    Input Valid Value    Contract Release Order Reject Remarks Submit Button

Fetch CRO Remaining Quantity
    [Documentation]  Fetches and returns CRO remaining quantity.
    ${Remaining Quantity}    Get Text    //button[@id='btneditquantity']//div[contains(text(),'Remaining Quantity')]/following-sibling::div
    return from keyword  ${Remaining Quantity}