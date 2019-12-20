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
Check Generate/Renew PO process
    [Documentation]    Renew PO by adding new expiry date
    [Tags]  generatepo
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    Go To Renew PO Process
    #Input Valid Value    Renew PO Search By Number
    #//span[contains(text(),'30% P205 Crushed Rock phosphate')]/../preceding-sibling::td[2]
    input text  uncontrolled  ${Branch["Name"]}
    sleep  2s
    Wait Until Keyword Succeeds    5s    250ms    Select Checkbox    //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//input
    Input Valid Value    Renew PO Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order New Expiry Date    ${PO["New Expiry Date"]}
    Wait Until Keyword Succeeds    5s    250ms    Click Button    Update Po
    Sleep    5s

#Check Generate PO for multiple pending POs with remaining balance
#    [Tags]    Skip
