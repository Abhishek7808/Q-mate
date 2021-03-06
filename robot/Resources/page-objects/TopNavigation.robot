*** Variables ***
#${USER_ACTION_DROPDOWN_LINK}  css=div[id='content'] div > a.dropdown-toggle
${USER_ACTION_DROPDOWN_LINK}  xpath=//span[contains(@class,'pull-left')]
${LOGOUT_LINK}  xpath=//a[contains(text(),'Log Out')]
${LOGOUT_TEXT}  Login to your E-Prashasan Account
${HOME_LINK}    xpath=//div[@id='brandWrapper']//div//img
${CHANGE PEFERENCE LINK}  xpath=//a[contains(text(),'Change Preference')]
${UNIT PERFERENCE MENU}  xpath=//div[@id='s2id_Pre_Unit']
${UNIT PERFERENCE DROPDOWN}  xpath=//ul[contains(@class,'select2-results')]
${UNIT PERFERENCE DROPDOWN LIST ITEM}  //*[@id='Pre_Unit']//option
${UNIT PERFERENCE DROPDOWN INPUT BOX}  //*[@id="select2-drop"]/div/input
${APPLY PERFERENCE BUTTON}  //*[@id="SAVE_OPTION"]
${LOGOUT_TEXT_LIVE}  Rajasthan Single Sign On

*** Keywords ***

Open User Action Menu
    [Documentation]  Opens the user action menu
    wait until element is visible  ${USER_ACTION_DROPDOWN_LINK}
    sleep  5s
    mouse over  ${USER_ACTION_DROPDOWN_LINK}


Open Change Preference Modal
    [Documentation]  Opens the change preference popup
    TopNavigation.Open User Action Menu
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click link  ${CHANGE PEFERENCE LINK}
    sleep  2s

Open Unit Dropdown In Preference Modal
    [Documentation]  Opens the unit dropdown in the prefrence popup
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  ${UNIT PERFERENCE MENU}
    Wait Until Page Contains Element  ${UNIT PERFERENCE DROPDOWN}

Get Unit Count In Preference Modal
    [Documentation]  Returns the number of elements from the unit dropdown
    ${count}  get element count  ${UNIT PERFERENCE DROPDOWN LIST ITEM}
    return from keyword  ${count}

Select Unit In Preference Modal
    [Documentation]  Selects the given unit from the unit dropdown
    [Arguments]  ${unit}
    Open Preference Unit Page
    ${num}  convert to string  ${unit}
    select from list by index  id=Pre_Unit  ${num}
    sleep  2s
    Apply Pereference
    ${retryCount}  set variable  ${retryCount}+1            # """ Increases retrycount by 1 """
    ${status}  Check Preference Is Selected Or Not          # """ Status is set as true when preference is selected successfully """
    # """ If preference selection is not done due to any reason then this keyword will be called recursively until the ${retrycount} variable
    # gets the value 3 """
    run keyword if  ${status} == False and ${retryCount} !=3  Select Unit In Preference Modal
    run keyword if  ${retryCount} ==3  fail  Failed to select the preference
    ${retryCount}  convert to integer  1

Check Preference Is Selected Or Not
    [Documentation]  Verifies that preference is selected or not.
    ${status}  run keyword and return status  wait until page contains  OK          # """ If 'OK' text appears on the screen it means preference is selected"""
    return from keyword  ${status}

Select Unit In Preference Modal By ID
    [Documentation]  Selects the unit by unit id from the unit dropdown
    open preference unit page
    select from list by value  id=Pre_Unit  ${UNITID}
    apply pereference
    ${retryCount}  set variable  ${retryCount}+1                                                  #increases retry count by 1
    ${status}  Check Preference Is Selected Or Not
    run keyword if  ${status} == False and ${retryCount} !=3  Select Unit In Preference Modal By ID
    run keyword if  ${retryCount} ==3  fail   preference is not selected

Apply Pereference
    [Documentation]  Applies the selectd preference.
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  ${APPLY PERFERENCE BUTTON}

Click On Logout Link
    [Documentation]  Clicks on logout link.
    click element  ${LOGOUT_LINK}

Verify Login Page Is Loaded
    [Documentation]  Verifies that login page is loaded.
    ${LOGOUT_TEXT}  set variable if  '${ENVIRONMENT}' == 'production'  ${LOGOUT_TEXT_LIVE}  ${LOGOUT_TEXT}
    page should contain  ${LOGOUT_TEXT}

Go Back To Home
    [Documentation]  Clicks on home button.
    click element  ${HOME_LINK}

Open Preference Unit Page
    [Documentation]  Opens the preference unit page
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/Utility/ChangePrefereence
    sleep  2s





