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
Check 'Add Members To Group'
    [Tags]  Addmember  addmember1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2  #Gurgaon
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Groups
    SMM_Keywords.Create New Group
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 3"]}"]}
    SMM_Keyworda.Add Member To The Group  ${Branch["Name"]}
    Sleep    2s
    SMM_Keywords.Go To Profile Selection Page
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Groups
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    SMM_Keywords.Verify Member Status

Check that only group admin should have right to add members in a group
    [Tags]  Addmember  addmember2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2  #jodhpur
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Groups
    SMM_Keywords.Open Memeber List Of The Group  ${Company["Enter PAN"]}
    Sleep    2s
    SMM_Keywords.Verify Absence Of Group Admin Rights

