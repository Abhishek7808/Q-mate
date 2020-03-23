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
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${PLANTLIST_LINK}

#Go To ERP Page Add
#    click button  ${ADD_CUSTOMER_BUTTON}

Apply Plant Status Filter
    [Arguments]  ${plantStatus}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    ${searchBar}    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${plantListDD}
    sleep  3s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    ${plantStatusDD}   ${plantStatus}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    ${viewALL}
    Sleep    1s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${apply}

View Plant By Branch Name
    [Arguments]  ${branchName}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${branchName}')]/../following-sibling::td/i[@title='View']

Add Customer
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value    Add Customer

Verify Customer Registration
    [Arguments]  ${branchName}
    Go To Plant List Page
    Apply Plant Status Filter  Approved
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${branchName}')]

Verify Customer Approval
    [Arguments]  ${branchName}
    Go To Plant List Page
    Apply Plant Status Filter  Approved
    Wait Until Keyword Succeeds    5s    250ms    page should contain element  //span[contains(text(),'${branchName}')]/../following-sibling::td/button/span[contains(text(),'Approved')]

Verify Customer Deactivation
    [Arguments]  ${branchName}
    Go To Plant List Page
    Apply Plant Status Filter  Deactivated
    Wait Until Keyword Succeeds    5s    250ms    page should contain element  //span[contains(text(),'${branchName}')]/../following-sibling::td/button/span[contains(text(),'Deactivated')]