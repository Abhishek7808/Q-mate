*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

# robot -d Results Tests/SMM/01__Customer_Registration/04__Activate_and_Deactivate_User_Account.robot

*** Test Cases ***

Check the process of User Account Deactivation
    [Documentation]    Deactivates an application submitted by the user
    [Tags]  deactivationuser  Account  Account1
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 1
    SMM_Keywords.Filter Plants By Status    Approved
    sleep  1s
    SMM_Keywords.View Details Of Selected Plant  ${Branch["Name"]}
    SMM_Keywords.Cancel Plant Registration
    Sleep    2s
    SMM_Keywords.Open Customer List
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Approved   ${Branch["Name"]}

Check the process of User Account Activation
    [Documentation]    Activates an application submitted by the user
    [Tags]  activationuser  Account  Account2
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 1
    SMM_Keywords.Filter Plants By Status    Deactivated
    sleep  2s
    SMM_Keywords.View Details Of Selected Plant  ${Branch["Name"]}
    SMM_Keywords.Approve Selected Plant
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Approved   ${Branch["Name"]}

Check the process of User Account Activation when requested by MTM
    [Documentation]    Activates an application submitted by the user
    [Tags]    accountactivation  Account  Account3
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    Common_Keywords.Set Test Variables    Company=Company Department 2    Branch=Branch Department 2
    SMM_Keywords.Filter Plants By Status    Approved
    sleep  2s
    SMM_Keywords.View Details Of Selected Plant  ${Branch["Name"]}
    SMM_Keywords.Cancel Plant Registration
    SMM_Keywords.Open Customer List
    SMM_Keywords.Filter Plants By Status    Deactivated
    sleep  3s
    SMM_Keywords.View Details Of Selected Plant  ${Branch["Name"]}
    SMM_Keywords.Activate Plant Registration
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Approved   ${Branch["Name"]}]

#Check login after customer account deactivation
#    [Tags]    Skip
