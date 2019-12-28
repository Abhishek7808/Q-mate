*** Settings ***
Library  SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py

*** Variables ***
${LOGIN_TEXT}                   Login to your E-Prashasan Account
${LOGIN_TEXT_HEADER}            xpath=//h4[@class='innerAll margin-none border-bottom text-center']
${LOGIN_USERNAME_INPUT}         id=LoginIdForShow
${LOGIN_PASSWORD_INPUT}         id=PasswordForShow
${LOGIN_BUTTON}                 id=btnLogin
${DASHBOARD_TEXT}               Dashboard
${LOGOUT}                       Utility/Logout


*** Keywords ***
Navigate To Page
    Go To  ${BASE_URL.${ENVIRONMENT}}

Verify Page Loaded
     Page Should Contain Element  ${LOGIN_TEXT_HEADER}
#    wait until page contains  ${LOGIN_TEXT}

Fill Username
    [Arguments]  ${username}
    Input Text  ${LOGIN_USERNAME_INPUT}  ${username}

Fill Password
    [Arguments]  ${password}
    Input Text  ${LOGIN_PASSWORD_INPUT}  ${password}

Submit The Form
    click button  ${LOGIN_BUTTON}

Verify Login Message
    [Arguments]   ${ExpectedResponseMessage}
    wait until page contains   ${ExpectedResponseMessage}

Go To Logout
    go to  ${BASE_URL.${ENVIRONMENT}}/${LOGOUT}

Department Login
    [Arguments]    ${Username}    ${Password}
    Input Text    LoginIdForShow    ${Username}
    Input Password    PasswordForShow    ${Password}
    Click Button    btnLogin