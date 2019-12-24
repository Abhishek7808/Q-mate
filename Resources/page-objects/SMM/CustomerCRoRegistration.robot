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