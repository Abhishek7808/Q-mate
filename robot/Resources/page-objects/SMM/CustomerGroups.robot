*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot

*** Keywords ***
Create Customer Group
    [Documentation]  Clicks on create customer group button.
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnCreateGroup

Fill Customer Group
    [Documentation]  Fills details into customer group popup.
    Input Valid Value    Customer Group Group Name    ${Company["Enter PAN"]}
    Input Valid Value    Customer Group Group Description    ${Branch["Group Description"]}
    Input Valid Value    Customer Group Button

Verify That Given Group Is Exists On The Page
    [Documentation]  Takes group name as argument and checks that it is visible on the page.
    [Arguments]  ${groupName}
    sleep  2s
    Element should be visible    //span[contains(text(),'${groupName}')]

View Memeber List Of The Group
    [Documentation]  Takes group name as argument and opens member list.
    [Arguments]  ${groupName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${groupName}')]/../following-sibling::td/i[@title='Add']