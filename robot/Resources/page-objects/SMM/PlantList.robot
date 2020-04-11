#*** Settings ***
#Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot

*** Variables ***
${PLANTLIST_LINK}                    SMM/Customer/PlantList
${ADD_CUSTOMER_BUTTON}               xpath=//button[@id='btnAddCustomer']
${searchBar}                         uncontrolled
${plantListDD}                       //div[@id='dropdownOpen']/button
${viewALL}                           chkViewAll
${plantStatusDD}                     plantStatus
${apply}                             btnApplyFillter

*** Keywords ***
Go To Plant List Page
    [Documentation]  Opens plant list page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${PLANTLIST_LINK}

Apply Plant Status Filter
    [Documentation]  Takes plant status as argument, Inputs branch name in the search bar and applies status filter.
    [Arguments]  ${plantStatus}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    ${searchBar}    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${plantListDD}
    sleep  3s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    ${plantStatusDD}   ${plantStatus}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    ${viewALL}
    Sleep    1s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${apply}

View Plant By Branch Name
    [Documentation]  Takes branch name as argument and opens corresponding plant details.
    [Arguments]  ${branchName}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${branchName}')]/../following-sibling::td/i[@title='View']

Add Customer
    [Documentation]  Clicks on add customer button.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value    Add Customer

Verify Customer Registration
    [Documentation]  Takes branch name as argument, Applies approves status filter and searches for plant of corresponding branch.
    [Arguments]  ${branchName}
    Go To Plant List Page
    Apply Plant Status Filter  Approved
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${branchName}')]

Verify Customer Approval
    [Documentation]   Takes branch name as argument, Applies approves status filter and checks for "Apprvoved" tag in the name of plant of corresponding branch.
    [Arguments]  ${branchName}
    Go To Plant List Page
    Apply Plant Status Filter  Approved
    Wait Until Keyword Succeeds    5s    250ms    page should contain element  //span[contains(text(),'${branchName}')]/../following-sibling::td/button/span[contains(text(),'Approved')]

Verify Customer Deactivation
    [Documentation]  Takes branch name as argument, Applies approves status filter and checks for "Deactivated" tag in the name of plant of corresponding branch.
    [Arguments]  ${branchName}
    Go To Plant List Page
    Apply Plant Status Filter  Deactivated
    Wait Until Keyword Succeeds    5s    250ms    page should contain element  //span[contains(text(),'${branchName}')]/../following-sibling::td/button/span[contains(text(),'Deactivated')]