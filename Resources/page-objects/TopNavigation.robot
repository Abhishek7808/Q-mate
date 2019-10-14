*** Variables ***
#${USER_ACTION_DROPDOWN_LINK}  css=div[id='content'] div > a.dropdown-toggle
${USER_ACTION_DROPDOWN_LINK}  xpath=//div[contains(@class,'navbar hidden-print navbar-primary main')]//div[contains(@class,'dropdown username hidden-xs pull-left')]
${LOGOUT_LINK}  xpath=//a[contains(text(),'Log Out')]
${LOGOUT_TEXT}  Login to your E-Prashasan Account
${HOME_LINK}    xpath=//div[@id='brandWrapper']//div//img

*** Keywords ***
Open Dashboard From Logo

Open Dashboard From Home Button

Open Help Portal From Help Button

Open Notifications

Open User Action Menu
    wait until element is visible  ${USER_ACTION_DROPDOWN_LINK}
    mouse over  ${USER_ACTION_DROPDOWN_LINK}
    sleep  500ms

Click On Logout Link
    click element  ${LOGOUT_LINK}

Verify Login Page Is Loaded
    wait until page contains  ${LOGOUT_TEXT}

Go Back To Home
    click element  ${HOME_LINK}
