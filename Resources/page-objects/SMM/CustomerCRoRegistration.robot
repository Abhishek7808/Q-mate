*** Settings ***


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

Select Purchase Order
    [Arguments]  ${poNumber}
    Input Valid Value    Contract Release Order Select PO    ${poNumber}

Fetch PO Balance
    Wait Until Element Is Visible    availableQuantity
    ${Amount}    Get Value    availableQuantity
    ${Amount}    Evaluate    ${Amount}+1

Input Required Quantity
    Wait Until Keyword Succeeds    5s    200ms    Input Text    productQuantityRequired    ${Amount}
    Press Key    productQuantityRequired    \\09
    Sleep    1s

Check For Agent Name Contract Release Order Form
    [Arguments]  ${agentName}
    Element Should Be Visible    //span[contains(text(),'${agentName}')]

Check For Pending CRO
    Wait Until Keyword Succeeds    5s    200ms    Element Should Be Visible    //span[text()='Pending']

Compare FI Balance And CRO Amount
    ${Available Value}    Get Text    //button[@id='btnHourglassEmpty']//div[text()='Available Value']/preceding-sibling::div
    ${Available Value}  remove string  ${Available Value}  ,
#    ${Available Value}    Split String    ${Available Value}    ,
#    ${Available Value}    Catenate    ${Available Value}
    ${Status}    Evaluate    ${Available Value}>=${CRO["Amount"]}
    Should Be Equal    '${Status}'    'True'

Fill CRO From Customer Form Without Financial Insturment
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

Fill CRO From Customer Form
    ${PO No}    Get Selected List Label    purchaseOrderId
    ${PO No}    Strip String    ${PO No}
    ${Status}    Evaluate    '${PO No}'=='${EMPTY}'
    click element  purchaseOrderId
    ${List Item}    Run Keyword If    ${Status}    Wait Until Keyword Succeeds    5s    100ms   Get List Items    purchaseOrderId
    ${List Item}    Run Keyword If    ${Status}    Catenate    ${List Item}
    ${List Item}    Run Keyword If    ${Status}    Split String    ${List Item}    ,
    ${List Item}    Run Keyword If    ${Status}    Get From List    ${List Item}    1
    ${List Item}    Run Keyword If    ${Status}    Split String    ${List Item}    '
    ${PO No}    Run Keyword If    ${Status}    Get From List    ${List Item}    1
    Run Keyword If    ${Status}    Input Valid Value    Contract Release Order Select PO    ${PO No}
    Input Valid Value    Contract Release Order PO Number    ${PO No}
    Input Valid Value    Contract Release Order Unit Name    ${PO["Unit Name"]}
    Input Valid Value    Contract Release Order Product Name    ${PO["Select Product"]}
    Input Valid Value    Contract Release Order Available Quantity    ${PO["PO Quantity"]}
    Sleep    3s
    Input Valid Value    Contract Release Order Product Quantity Required    ${CRO["Product Quantity Required"]}
    Sleep    0.5s
    #Input Valid Value    Contract Release Order Number Of Credit Days Required    ${CRO["No. of Credit Days Required"]}
    #Input Valid Value    Contract Release Order Pincode    ${PO["Destination Pincode"]}
    #Input Valid Value    Contract Release Order State    ${PO["Destination State"]}
    #Input Valid Value    Contract Release Order City    ${PO["Destination City"]}
    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Input Valid Value    Contract Release Order Total Amount    ${CRO["Total Amount"]}
    Input Valid Value    Contract Release Order Select Payment    ${PO["Preferred Mode of Payment"]}
    Input Valid Value    Contract Release Order Number Of Credit Days Required    ${CRO["No. of Credit Days Required"]}
    Input Valid Value    Contract Release Order Select Instrument Type    ${FI["Instrument Type"]}
    Input Valid Value    Contract Release Order Select Instrument    ${FI["BG/LC Number"]}
    Input Valid Value    Contract Release Order Agent    ${SSO ID["Name"]}
    Input Valid Value    Add Instrument Button
    #Sleep    2s
    #Press Keys    ${Key Description["Contract Release Order Amount"]["Locator"]}    \\08
    Input Valid Value    Contract Release Order Amount    ${CRO["Amount"]}
    sleep  4s
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Button
