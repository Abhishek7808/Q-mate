*** Keywords ***
Login From Customer With SSOID
    [Documentation]  Fills SSOID into ssoid field and clicks log in button.
    [Arguments]    ${ssoId}
    Input Text    txtSSOName    ${ssoId}
    Click Button    btn
    Sleep    2s