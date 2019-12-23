*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot

*** Keywords ***
Send Add Request
    Click Button    sendAddreq

Check For Member By Branch Name
    [Arguments]  ${branchName}
    Element should be visible    //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Approve']

Approve Member Request
    [Arguments]  ${memberBranchName}
    Wait Until Keyword Succeeds    5s    200ms    Click Button    addMember
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //td[contains(text(),'${memberBranchName}')]/following-sibling::td/button[@id='addF']
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[@aria-hidden='true']

Check For Membership
    Element Should Be Visible    //h2[contains(text(),'Group member')]

Check For Add Member Button
    Page Should Not Contain Button    addMember