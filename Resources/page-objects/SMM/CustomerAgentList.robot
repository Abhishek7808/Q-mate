*** Settings ***


*** Test Cases ***


*** Keywords ***
Verify Presence Of Agent
    Element Should Be Visible    //*[contains(text(),'${SSO ID["Name"]}')]