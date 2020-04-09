*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot

*** Keywords ***
Send Add Request
    [Documentation]  Click send request button.
    Click Button    sendAddreq

Check For Member By Branch Name
    [Documentation]  Takes branch name as argument and verifies that 'Approved' tag is present in the listed details of branch name.
    [Arguments]  ${branchName}
    Element should be visible    //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Approve']

Accept Member Request
    [Documentation]  Takes member branch name as argument and accepts its request.
    [Arguments]  ${memberBranchName}
    Wait Until Keyword Succeeds    5s    200ms    Click Button    addMember
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //td[contains(text(),'${memberBranchName}')]/following-sibling::td/button[@id='addF']
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[@aria-hidden='true']

Check For Membership
    [Documentation]  Checks that 'Group Member' heading is visible on the page.
    Element Should Be Visible    //h2[contains(text(),'Group member')]

Check For Absence Of Add Member Button
    [Documentation]  Checks that add member is not visible on the page.
    Page Should Not Contain Button    addMember

Verify Presence Of Group Admin Rights
    [Documentation]  Checks that add member is visible on the page.
    Page Should Contain Button    addMember

Reject Membership
    [Documentation]  Takes branch name as argument and clicks on reject button.
    [Arguments]  ${branchName}
    Click Element    //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Reject']

Approve Membership
    [Documentation]  Takes branch name as argument and click on approve button.
    [Arguments]  ${branchName}
    Click Element     //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Approve']

Switch Admin
    [Documentation]  Takes new member name as argument and swithces admin rights to it.
    [Arguments]  ${newAdmin}
    Click Element    //i[@title='Switch Admin']
    Sleep    2s
    Select From List By Label    switchAdmin    ${newAdmin}
    Sleep    2s
    Click Button    btnSwitchAdmin
    Sleep    2s