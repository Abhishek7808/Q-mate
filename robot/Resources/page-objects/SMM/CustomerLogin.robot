*** Settings ***
Documentation    Suite description

*** Keywords ***
Login From Customer With SSOID
    [Arguments]    ${ssoId}
    Input Text    txtSSOName    ${ssoId}
    Click Button    btn
    Sleep    2s