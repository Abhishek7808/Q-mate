*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot

*** Keywords ***
Send Add Request
    Click Button    sendAddreq

Check For Member By Branch Name
    [Arguments]  ${branchName}
    Element should be visible    //td[contains(text(),'${branchName}')]/following-sibling::td/span/i[@title='Approve']