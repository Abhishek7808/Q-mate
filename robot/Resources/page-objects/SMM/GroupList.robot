*** Settings ***

*** Variables ***
${groupList}  SMM/Customer/GroupList

*** Keywords ***
Go To Customer Group List Page
    [Documentation]  Opens customer group list page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${groupList}

Add New Customer Group By Department
    [Documentation]  clicks on add new button.
    Input Valid Value    Add Customer Group

Search Customer Group
    [Documentation]  Takes group name as argument and searchs for group name.
    [Arguments]  ${groupName}
    Input Valid Value    Customer Group Search Text    ${Branch["Group Name"]}

Open Group Details
    [Documentation]  Takes group name as argument and opens details of corresponding group.
    [Arguments]  ${groupName}
    Click Element    //span[contains(text(),'${Branch["Group Name"]}')]/../following-sibling::td/i[@title='View']

Add Member
    [Documentation]  Takes group name as argument, Clicks on add member button and selects group.
    [Arguments]  ${groupName}
    Input Valid Value    Customer Group Add Member
    Sleep    2s
    Click Element    //span[contains(text(),'${groupName}')]/../following-sibling::td/i[@title='Add']
    Sleep    3s
    Input Valid Value    Customer Group View List Button