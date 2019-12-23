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
Check Group Creation
    [Documentation]    Creates a group by department
    [Tags]  groupproxy  groupproxy1
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 3    Branch=Branch Department 1    SSO ID=SSOID 3
    Go To Add Customer Group By Department
    Input Valid Value    Customer Group Group Name    ${Branch["Group Name"]}
    Input Valid Value    Customer Group Description    ${Branch["Group Description"]}
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Company["Company Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Customer Group Enter Customer PAN or Name    ${Val}
    Input Valid Value    Customer Group Add Button
    Sleep    3s

Check Group Creation, When Already A Group Exists With Same Code/PAN No
    [Documentation]    Checks if a group with same name can be created
    [Tags]  groupproxy  groupproxy2
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1    SSO ID=SSOID 3
    Go To Add Customer Group By Department
    Input Valid Value    Customer Group Group Name    ${Branch["Group Name"]}
    Input Valid Value    Customer Group Description    ${Branch["Group Description"]}
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Company["Company Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Customer Group Enter Customer PAN or Name    ${Val}
    Input Valid Value    Customer Group Add Button
    Sleep    3s
    Alert Should Be Present    Group Name already exist in selected Group .
    Sleep    3s
    Input Valid Value    Customer Group View List Button From Add Group
    Sleep    2s
    Input Valid Value    Customer Group Search Text    ${Branch["Group Name"]}
    Sleep    2s
    Click Element    //span[contains(text(),'${Branch["Group Name"]}')]/../following-sibling::td/i[@title='View']
    Sleep    2s
    Input Valid Value    Customer Group Add Member
    Sleep    2s
    Common_Keywords.Set Test Variables    Branch=Branch Department 4
    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    3s
    Input Valid Value    Customer Group View List Button
