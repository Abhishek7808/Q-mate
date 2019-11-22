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




*** Keywords ***
Open Dashboard From Logo

Open Dashboard From Home Button

Open Help Portal From Help Button

Open Notifications

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
#   Open Unit Dropdown In Preference Modal
    ${count}  get element count  ${UNIT PERFERENCE DROPDOWN LIST ITEM}
    return from keyword  ${count}

Select Unit In Preference Modal
    [Documentation]  Selects the given unit from the unit dropdown
    [Arguments]  ${i}  ${retryCount}
    Open Preference Unit Page
    ${num}  convert to string  ${i}
    select from list by index  id=Pre_Unit  ${num}
    sleep  2s
    Apply Pereference
    ${retryCount}  set variable  ${retryCount+1}
    ${status}  Check Preference Is Selected Or Not
    run keyword if  ${status} == False and ${retryCount} !=3  Select Unit In Preference Modal  ${i}  ${retryCount}
    run keyword if  ${retryCount} ==3  fail  Filter is not apllied
    ${retryCount}  convert to integer  1

Check Preference Is Selected Or Not
    ${status}  run keyword and return status  wait until page contains  OK
    return from keyword  ${status}
Select Unit In Preference Modal By ID
    [Documentation]  Selects the unit by unit id from the unit dropdown
    [Arguments]  ${UNITID}  ${retryCount}
    Open Preference Unit Page
    select from list by value  id=Pre_Unit  ${unitID}
    Apply Pereference
    ${retryCount}  set variable  ${retryCount+1}
    log to console  ${retryCount} retryCount is increased
    ${status}  Check Preference Is Selected Or Not
    run keyword if  ${status} == False and ${retryCount} !=3  Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    run keyword if  ${retryCount} ==3  fail  Filter is not apllied
    ${retryCount}  convert to integer  1


Apply Pereference
    [Documentation]  Applies the selectd preference
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  ${APPLY PERFERENCE BUTTON}


Click On Logout Link
    click element  ${LOGOUT_LINK}

Verify Login Page Is Loaded
    wait until page contains  ${LOGOUT_TEXT}

Go Back To Home
    click element  ${HOME_LINK}

Open Preference Unit Page
    [Documentation]  Opens the preference unit page
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/Utility/ChangePrefereence
    sleep  2s





