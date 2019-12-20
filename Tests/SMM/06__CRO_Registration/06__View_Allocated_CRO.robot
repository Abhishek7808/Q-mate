*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Test Cases ***
View Allocated CRO Status
    [Documentation]    CRO allocated quantity will be visible to weighbridge manager
    [Tags]  croallocated
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    Go To CRO List
    Sleep    1s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    4
    Click Button    btnApplyFillter
    Sleep    5s
    ${CRO Number 1}    Wait Until Keyword Succeeds    5s    500ms    Get Text    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../preceding-sibling::td//span[contains(text(),'CRO')]
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    ${Remaining Quantity}    Get Text    //button[@id='btneditquantity']//div[contains(text(),'Remaining Quantity')]/following-sibling::div
    Input Valid Value    Contract Release Order View List Button
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/WeighBridge/WeighBridgeBalanceList
    Sleep    3s
    Input Valid Value    Weighbridge Operations Generate Dispatch Slip Button
    Input Text    CROnumber    ${CRO Number 1}
    Click Element    id=agentName
    Sleep    2s
    ${Available Balance}    Get Value    availableBalance
    ${Remaining}    Split String    ${Remaining Quantity}    ${SPACE}
    ${Val}    Get From List    ${Remaining}    0
    Should Be Equal    ${Val}    ${Available Balance}
