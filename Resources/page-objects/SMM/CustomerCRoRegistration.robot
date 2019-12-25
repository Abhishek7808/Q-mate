*** Settings ***


*** Test Cases ***


*** Keywords ***
Select Purchase Order for CRO
    [Arguments]  ${poNumber}
    ${finalPoNumber}  run keyword if  ${poNumber} == None  Get Purchase Order Number From Dropdown  ELSE  ${poNumber}
    Select From List By Label    purchaseOrderId    ${finalPoNumber}
    Press Key    purchaseOrderId    //09
    Sleep    2s

Get Purchase Order Number From Dropdown
    ${List Item}    Get List Items    purchaseOrderId
    ${List Item}    Catenate    ${List Item}
    ${List Item}    Split String    ${List Item}    ,
    ${List Item}    Get From List    ${List Item}    1
    ${List Item}    Split String    ${List Item}    '
    ${List Item}    Get From List    ${List Item}    1
    return from keyword  ${List Item}

Check For Agent Name Contract Release Order Form
    [Arguments]  ${agentName}
    Element Should Be Visible    //span[contains(text(),'${SSO ID["Name"]}')]

Fill CRO Form Without Financial Insturment
    ${List Item}  Get Purchase Order Number From Dropdown
    Wait Until Keyword Succeeds    5s    200ms    Select From List By Label    purchaseOrderId    ${List Item}
    Press Key    purchaseOrderId    //09
    Sleep    2s
    Input Valid Value    Contract Release Order Product Quantity Required  12
    Input Valid Value    Contract Release Order Select Dispatch Point    JHAMARKOTRA
    Select From List By Label    paymentMode    Credit
    Simulate Event    paymentMode    blur
    Select From List By Label    paymentMode    Credit
    Sleep    3s
    Wait Until Keyword Succeeds    10s    200ms    Select From List By Label    instrumentType    Letter of Credit (LC)
    Sleep    2s
    ${Value}    Get List Items    instrument
    : FOR    ${Val}    IN    @{Value}
    \    Should Not Be Equal    ${Val}    ${FI["BG/LC Number"]}