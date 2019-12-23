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
Reject group request process
    [Tags]  Accept  reject1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2  #Gurgaon
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    SMM_Keywords.Remove Member From The Group  ${Branch["Name"]}
    SMM_Keywords.Go To Profile Selection Page
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    SMM_Keywords.Verify Member Status

Accept group request process
    [Tags]  Accept  accept2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    SMM_Keywords.Send Add Member Request To The Group
    SMM_Keywords.Go To Profile Selection Page
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Sleep    2s
    SMM_Keywords.Approve Member  ${Branch["Name"]}
    Sleep    2s
    SMM_Keywords.Go To Profile Selection Page
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    SMM_Keywords.Verify Member Status
