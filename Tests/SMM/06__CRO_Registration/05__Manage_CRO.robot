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
Cancel CRO request before inbound Weighment Slip is generated
    [Documentation]    Rejects a CRO request with appropriate remarks
    [Tags]  cancelcro
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 3
    Go To CRO List
    Click Element    //div[@id='dropdownOpen']/button/i
    Select From List By Value    poStatus    4
    Click Button    btnApplyFillter
    Wait Until Keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td//i[@title='Close']
    Wait Until Keyword Succeeds    5s    250ms    Input Valid Value    Contract Release Order Close Remarks    ${CRO["Close Remarks"]}
    Input Valid Value    Contract Release Order Reject Remarks Submit Button

#Cancel CRO request after inward Weighment Slip is generated
#    [Tags]    Skip
