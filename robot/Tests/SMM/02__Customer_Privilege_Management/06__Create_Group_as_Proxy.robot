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
Check group creation by department
    [Documentation]    Creates a group by department
    [Tags]  SMM  customerprivilege  creategroupasproxy  creation
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Customer Group List Page
    Common_Keywords.Set Test Variables    Company=Company Department 3    Branch=Branch Department 1    SSO ID=SSOID 3
    SMM_Keywords.Add New Customer Group

Check group creation, when already a group exists with same Code/PAN No
    [Documentation]    Checks if a group with same name can be created
    [Tags]  SMM  customerprivilege  creategroupasproxy  groupwithsamename
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Customer Group List Page
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1    SSO ID=SSOID 3
    SMM_Keywords.Add New Customer Group
    Sleep    3s
    SMM_Keywords.Expect Alert  Group Name already exist in selected Group .
    Sleep    3s
    SMM_Keywords.View Customer Group List
    Sleep    2s
    SMM_Keywords.Search For Customer Group  ${Branch["Group Name"]}
    Sleep    2s
    SMM_Keywords.View Details Of Selected Group  ${Branch["Group Name"]}
    Sleep    2s
    Common_Keywords.Set Test Variables    Branch=Branch Department 4
    SMM_Keywords.Add Member To The Group By Department  ${Branch["Name"]}

