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
    [Documentation]  Opens Login Url.
    Go To  ${LOGIN_URL}

Verify Page Loaded
    [Documentation]  Checks that login page is loaded by verifying presence the login text header.
    Page Should Contain Element  ${LOGIN_TEXT_HEADER}
#    wait until page contains  ${LOGIN_TEXT}

Fill Username
    [Documentation]  Fills username in the username box.
    [Arguments]  ${username}
    Input Text  ${LOGIN_USERNAME_INPUT}  ${username}

Fill Password
    [Documentation]  Fills password.
    [Arguments]  ${password}
    Input Text  ${LOGIN_PASSWORD_INPUT}  ${password}

Submit The Form
    [Documentation]  Clicks on login button.
    click button  ${LOGIN_BUTTON}

Verify Login Message
    [Documentation]  Checks that user is logged in successfully.
    [Arguments]   ${ExpectedResponseMessage}
    wait until page contains   ${ExpectedResponseMessage}

Go To Logout
    [Documentation]  Opens log out url.
    go to  ${BASE_URL.${ENVIRONMENT}}/${LOGOUT}

Department Login
    [Documentation]  Does login.
    [Arguments]    ${Username}    ${Password}
    Input Text    LoginIdForShow    ${Username}
    Input Password    PasswordForShow    ${Password}
    Click Button    btnLogin