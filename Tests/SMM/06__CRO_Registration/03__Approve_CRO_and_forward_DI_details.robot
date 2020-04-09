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
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Test Cases ***
Approve and Forward DI
    [Documentation]    Approves the CRO so forwarded and again forwards it to Sales Executive
    [Tags]  SMM  croregistration  forwardcro  tomarketingexecutive
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Filter CRO List By Status   Pending
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Forward CRO To Marketing Executive From Department
    Sleep    1s
    BrowserControl.Switch To    Verify
    SMM_Keywords.View CRO List From Department
    Go To CRO List
    SMM_Keywords.Filter CRO List By Status   Forwarded to ME
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}

Check CRO request approval process when both the approvals(CRO request & DI) done at 2nd level only
    [Documentation]    Approves the pending CRO by forwarding it to ME, Selecting the dispatch point, expiry date and then forwrding to Sales Executive
    [Tags]  SMM  croregistration  forwardcro  tosalesexecutive
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 2
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Forward CRO To SE From Department

View DI request and Reject DI request
    [Documentation]    Views and then rejects the DI request
    [Tags]  SMM  croregistration  forwardcro  rejectdi
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Department 2    Branch=Branch Department 1    CRO=CRO 1
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}

View CRO request and Reject CRO request
    [Documentation]    Views and then rejects a CRO with an appropriate message
    [Tags]  SMM  croregistration  forwardcro  rejectcro
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.View CRO List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 2
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}
    SMM_Keywords.Reject CRO From Department
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Filter CRO List By Status   Forwarded to ME
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.View CRO List From Department
    SMM_Keywords.Filter CRO List By Status  Rejected
    SMM_Keywords.View CRO From Department  ${Branch["Name"]}  ${CRO["Product Quantity Required"]}

