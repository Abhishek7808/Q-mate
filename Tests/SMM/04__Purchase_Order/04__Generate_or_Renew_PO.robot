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
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 1
    SMM_Keywords.Open Renew PO page
    SMM_Keywords.Search For Purchase Order In Renew PO Page  ${Branch["Name"]}
    sleep  2s
    SMM_Keywords.Renew Purchase Order   ${Branch["Name"]}
    SMM_Keywords.Select Purchase Order From Renew PO List  ${Branch["Name"]}

#Check Generate PO for multiple pending POs with remaining balance
#    [Tags]    Skip
