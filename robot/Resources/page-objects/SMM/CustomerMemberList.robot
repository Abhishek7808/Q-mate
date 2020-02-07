*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Field.robot

*** Keywords ***
Send Add Request
    Click Button    sendAddreq

Check For Member By Branch Name
    [Arguments]  ${branchName}
    Element should be visible    //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Approve']

Accept Member Request
    [Arguments]  ${memberBranchName}
    Wait Until Keyword Succeeds    5s    200ms    Click Button    addMember
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //td[contains(text(),'${memberBranchName}')]/following-sibling::td/button[@id='addF']
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[@aria-hidden='true']

Check For Membership
    Element Should Be Visible    //h2[contains(text(),'Group member')]

Check For Absence Of Add Member Button
    Page Should Not Contain Button    addMember

Verify Presence Of Group Admin Rights
    Page Should Contain Button    addMember

Reject Membership
    [Arguments]  ${branchName}
    Click Element    //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Reject']

Approve Membership
    [Arguments]  ${branchName}
    Click Element     //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Approve']

Switch Admin
    [Arguments]  ${newAdmin}
    Click Element    //i[@title='Switch Admin']
    Sleep    2s
    Select From List By Label    switchAdmin    ${newAdmin}
    Sleep    2s
    Click Button    btnSwitchAdmin
    Sleep    2s