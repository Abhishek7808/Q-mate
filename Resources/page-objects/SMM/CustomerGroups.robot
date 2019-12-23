*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot

*** Keywords ***
Create Customer Group
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnCreateGroup

Fill Customer Group
    Input Valid Value    Customer Group Group Name    ${Company["Enter PAN"]}
    Input Valid Value    Customer Group Group Description    ${Branch["Group Description"]}
    Input Valid Value    Customer Group Button

Verify That Given Group Is Exists On The Page
    [Arguments]  ${groupName}
    sleep  2s
    Element should be visible    //span[contains(text(),'${groupName}')]

View Memeber List Of The Group
    [Arguments]  ${groupName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${groupName}')]/../following-sibling::td/i[@title='Add']