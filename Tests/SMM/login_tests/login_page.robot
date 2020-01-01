*** Settings ***
Library           OperatingSystem
Library           String
Library           Collections
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing

*** Variables ***
${Valid Users File}    data/users.csv

*** Test Cases ***
Invalid Login With Wrong Credentials
    [Tags]  SMM    Skip
    [Template]    Login With Invalid Credentials Should Fail
    invalid    ${VALID PASSWORD}
    ${VALID USER}    invalid
    invalid    whatever
    ${VALID USER}    abc 'OR' 1'='1

Invalid Login With empty Credentials
    [Tags]  SMM    Skip
    [Template]    Login With Invalid Credentials Should Fail With Alert
    ${EMPTY}    ${VALID PASSWORD}
    ${VALID USER}    ${EMPTY}
    ${EMPTY}    ${EMPTY}

Valid Login
    [Tags]  SMM    Skip
    ${creds}=    Get File    ${Valid Users File}
    Log    File Content: ${creds}
    @{creds}=    Split To Lines    ${creds}    1
    : FOR    ${cred}    IN    @{creds}
    \    @{user pass}=    Split String    ${cred}    ,
    \    ${username}=    Get From List    ${user pass}    0
    \    ${password}=    Get From List    ${user pass}    1
    \    Login With Valid Credentials    ${username}    ${password}
    \    Logout

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    Login Should Have Failed

Login With Invalid Credentials Should Fail With Alert
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    Empty User Pass Alert Should Have Raised
    Login Should Have Failed
