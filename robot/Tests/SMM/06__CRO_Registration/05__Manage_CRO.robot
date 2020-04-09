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
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot


*** Test Cases ***
Cancel CRO request before inbound Weighment Slip is generated
    [Documentation]    Rejects a CRO request with appropriate remarks
    [Tags]  SMM  croregistration  managecro  cancelcro
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 3
    SMM_Keywords.Filter CRO List By Status    Approved
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Reject CRO From Department


#Cancel CRO request after inward Weighment Slip is generated
#    [Tags]  SMM  croregistration    Skip
