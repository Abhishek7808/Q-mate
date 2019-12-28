*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Test Cases ***
View Allocated CRO Status
    [Documentation]    CRO allocated quantity will be visible to weighbridge manager
    [Tags]  croallocated
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    SMM_Keywords.Filter CRO List By Status    Approved
    ${CRO Number 1}  SMM_Keywords.Get CRO Number  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    ${croQuantity}  SMM_Keywords.Get CRO Remaining Quantity
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Open Weighbridge Operations Page
    #TODO:Logic not acceptable of below code
    Sleep    3s
    Input Valid Value    Weighbridge Operations Generate Dispatch Slip Button
    Input Text    CROnumber    ${CRO Number 1}
    Click Element    id=agentName
    Sleep    2s
    ${Available Balance}    Get Value    availableBalance
    ${Remaining}    Split String    ${Remaining Quantity}    ${SPACE}
    ${Val}    Get From List    ${Remaining}    0
    Should Be Equal    ${Val}    ${Available Balance}
