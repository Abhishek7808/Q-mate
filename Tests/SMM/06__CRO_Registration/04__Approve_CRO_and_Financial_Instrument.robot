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
Approve DI Requests
    [Documentation]    Approves the DI request
    [Tags]  SMM  croregistration  approvecro  approverequest
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    SMM_Keywords.View CRO List From Department
    Sleep    1s
    SMM_Keywords.Filter CRO List By Status    Pending for Approval
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Approve CRO From Department
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Filter CRO List By Status    Approved
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Get CRO Number  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}


Check CRO request approval process when all the approvals(CRO request & DI) done at 3rd level only
    [Documentation]    Approves a CRO request by forwarding it to Marketing Executive, Dispatch point and expiry date and then to SE
    [Tags]  SMM  croregistration  approvecro  approvebyME
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 3
    Sleep    5s
    SMM_Keywords.Filter CRO List By Status    Pending
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Forward CRO To Marketing Executive From Department
    SMM_Keywords.Forward CRO To SE From Department
    SMM_Keywords.Approve CRO From Department
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Filter CRO List By Status    Approved
    ${CRO Number 1}  SMM_Keywords.Get CRO Number  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    Set Global Variable    ${CRO Number 1}    ${CRO Number 1}

Reject DI Request
    [Documentation]    Rejects a CRO request with appropriate remarks
    [Tags]  SMM  croregistration  approvecro  rejectrequest
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 2
    Sleep    5s
    SMM_Keywords.Filter CRO List By Status    Pending
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Reject CRO From Department

Reject CRO Request
    [Documentation]    Rejects a CRO request with appropriate remarks
    [Tags]  SMM  croregistration  approvecro  rejectcrorequest
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 3
    Sleep    5s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    SMM_Keywords.Filter CRO List By Status    Pending
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Reject CRO From Department
