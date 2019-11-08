*** Variables ***
#${USER_ACTION_DROPDOWN_LINK}  css=div[id='content'] div > a.dropdown-toggle
${USER_ACTION_DROPDOWN_LINK}  xpath=//span[contains(@class,'pull-left')]
${LOGOUT_LINK}  xpath=//a[contains(text(),'Log Out')]
${LOGOUT_TEXT}  Login to your E-Prashasan Account
${HOME_LINK}    xpath=//div[@id='brandWrapper']//div//img
${CHANGE PEFERENCE LINK}  xpath=//a[contains(text(),'Change Preference')]
${UNIT PERFERENCE MENU}  xpath=//div[@id='s2id_Pre_Unit']
${UNIT PERFERENCE DROPDOWN}  xpath=//ul[contains(@class,'select2-results')]
${UNIT PERFERENCE DROPDOWN LIST ITEM}  //div[@id='select2-drop']//li
${APPLY PERFERENCE BUTTON}  //*[@id="SAVE_OPTION"]


*** Keywords ***
Open Dashboard From Logo

Open Dashboard From Home Button

Open Help Portal From Help Button

Open Notifications

Open User Action Menu
    wait until element is visible  ${USER_ACTION_DROPDOWN_LINK}
    mouse over  ${USER_ACTION_DROPDOWN_LINK}
    sleep  500ms

Open Change Preference Modal
    TopNavigation.Open User Action Menu
    sleep  2s
    click element  ${CHANGE PEFERENCE LINK}
    sleep  2s

Open Unit Dropdown In Preference Modal
    click element  ${UNIT PERFERENCE MENU}
    Wait Until Page Contains Element  ${UNIT PERFERENCE DROPDOWN}

Get Unit Count In Preference Modal
    Open Unit Dropdown In Preference Modal
    ${count}  get element count  ${UNIT PERFERENCE DROPDOWN LIST ITEM}
    return from keyword  ${count}

Select Unit In Preference Modal
    [Arguments]  ${i}
    click element  ${UNIT PERFERENCE DROPDOWN LIST ITEM}[${i}]
    sleep  2s

Apply Pereference
    click button  ${APPLY PERFERENCE BUTTON}

Click On Logout Link
    click element  ${LOGOUT_LINK}

Verify Login Page Is Loaded
    wait until page contains  ${LOGOUT_TEXT}

Go Back To Home
    click element  ${HOME_LINK}




