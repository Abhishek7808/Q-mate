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
Check group creation
    [Tags]  SMM  customerprivilege  creategroups  creation
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2  #Gurgaon
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    SMM_Keywords.Create New Group
    SMM_Keywords.Go To Profile Selection Page
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Check For The Group On The Customer Group Page  ${Company["Enter PAN"]}

Check group creation, when already a group exists with same code/PAN no
    [Tags]  SMM  customerprivilege  creategroups  groupwithsamename
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2  #jodhpur
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Create New Group
    Page should not contain button    btnCreateGroupPopup


Request to join existing group, having same PAN no. as that of customer
    [Tags]  SMM  customerprivilege  creategroups  joingroup
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2   #jodhpur
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    SMM_Keywords.Send Add Member Request To The Group
    Sleep    2s
    SMM_Keywords.Go To Profile Selection Page
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    2s
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    SMM_Keywords.Verify That Member Is Added To The Group  ${Branch["Name"]}
