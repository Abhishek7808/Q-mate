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
Check CRO request approval process
    [Documentation]    Approves CRO request by Forwarding it to ME, Selecting Dispatch Point, Expiry Date, and forwarding it to ME Executive
    [Tags]  SMM  croregistration  verifycro  requestapproval
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Filter CRO List By Status   Pending
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Forward CRO To Marketing Executive From Department
    BrowserControl.Switch To   Verify
    SMM_Keywords.View CRO List From Department
    Sleep    1s
    SMM_Keywords.Filter CRO List By Status   Forwarded to ME
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}

Check CRO request rejection process
    [Documentation]    Reject a CRO request with a rejection message
    [Tags]  SMM  croregistration  verifycro  requestrejection
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Reject CRO From Department

Check that CRO validity date cannot exceed the validity of financial instrument
    [Documentation]    Checks whether CRO validity exceeds FI validity date
    [Tags]  SMM  croregistration  croapproval  checkfivalidity
    #This keyword is not to be run as this functionality has not been made so far
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Department 2    Branch=Branch Department 1    CRO=CRO 1
    SMM_Keywords.Filter CRO List By Status   Pending
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Forward CRO To Marketing Executive From Department