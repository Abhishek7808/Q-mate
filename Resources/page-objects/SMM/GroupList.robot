*** Settings ***

*** Variables ***
${groupList}  SMM/Customer/GroupList

*** Keywords ***
Go To Customer Group List Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${groupList}

Add New Customer Group By Department
    Input Valid Value    Add Customer Group

Search Customer Group
    [Arguments]  ${groupName}
    Input Valid Value    Customer Group Search Text    ${Branch["Group Name"]}

Open Group Details
    [Arguments]  ${groupName}
    Click Element    //span[contains(text(),'${Branch["Group Name"]}')]/../following-sibling::td/i[@title='View']

Add Member
    [Arguments]  ${groupName}
    Input Valid Value    Customer Group Add Member
    Sleep    2s
    Click Element    //span[contains(text(),'${groupName}')]/../following-sibling::td/i[@title='Add']
    Sleep    3s
    Input Valid Value    Customer Group View List Button