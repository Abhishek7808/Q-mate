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
To check the process when department user as proxy add agent from menu
    [Documentation]    Adds an agent (transporter) to a company by department
    [Tags]  SMM  agentregistration   Addagentasproxy  creation
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Purchase Order List By Department
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 5    SSO ID=SSOID 2
    SMM_Keywords.Add Purchase Order From Department
    SMM_Keywords.Fill Customer PAN In PO Form  ${Company["Enter PAN"]}  ${Branch["Name"]}
    SMM_Keywords.Add Agent Details In PO Form
    sleep  3s
    SMM_Keywords.Select Agent In PO Form  ${SSO ID["Name"]}
    SMM_Keywords.Submit PO Form

To check the process when department user add agent from PO form
    [Documentation]    Adds an agent from PO form
    [Tags]  SMM  agentregistration   Addagentasproxy  registrationthroughpo
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Purchase Order List By Department
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 3    SSO ID=SSOID 2
    SMM_Keywords.Add Purchase Order From Department
    SMM_Keywords.Fill Customer PAN In PO Form  ${Company["Enter PAN"]}  ${Branch["Name"]}
    SMM_Keywords.Add Agent Details In PO Form
    SMM_Keywords.Submit PO Form

#To check the process when DU change Agent Details by selecting PO
#    [Tags]  SMM  agentregistration    Skip
#
#To check the process when department user change the agent details from menu
#    [Tags]  SMM  agentregistration    Skip
