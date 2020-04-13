*** Settings ***
Library  SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py

*** Variables ***
${MODULE_NAVIGATION_BUTTON}     xpath=//button[@id='on_scroll']
${NAVIGATION_MENU}              xpath=//div[@id='menu_kis']


*** Keywords ***
Open Modules Menu
    [Documentation]  Opens module menu.
    click button  ${MODULE_NAVIGATION_BUTTON}

###################################
#### START: Open All in One Go ####
###################################
#Open Module
#    [Arguments]  ${module}
#    ${module_link}  set variable  xpath=//a[starts-with(@title,'${module}')]
#    click link  ${module_link}
#
#Open All Modules
#    :FOR  ${MODULE}  IN  @{MODULES}
#    \  Open Modules Menu
#    \  Open Module  ${MODULES["${MODULE}"]}

#################################
#### END: Open All in One Go ####
#################################

Navigate To HRMS Module
    [Documentation]  Navigates to HRMS module.
    click link  ${HRMS.link_title}                  ###""" Variable is defined in "Configuration.resource" file.

Go To ERP Page HRMS Dashboard
    [Documentation]  Opens HRMS dashboard.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}${HRMS.link}              ###""" Variable is defined in "Configuration.resource" file.

Verify HRMS Dashboard Is Loaded
    [Documentation]  Checks that HRMS dashboard is loaded by varifying dashboard title.
    title should be  ${HRMS.dashboard_title}        ###""" Variable is defined in "Configuration.resource" file.

Navigate To FA Module
    [Documentation]  Navigates to FA module.
    click link  ${FA.link_title}                    ###""" Variable is defined in "Configuration.resource" file.

Go To ERP Page FA Dashboard
    [Documentation]  Opens FA dashboard.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}${FA.link}                ###""" Variable is defined in "Configuration.resource" file.

Verify FA Dashboard Is Loaded
    [Documentation]  Checks that FA dashboard is loaded by varifying dashboard title.
    title should be  ${FA.dashboard_title}          ###""" Variable is defined in "Configuration.resource" file.

Navigate To UM Module
    [Documentation]  Navigates to UM module.
    click link  ${UM.link_title}                    ###""" Variable is defined in "Configuration.resource" file.

Go To ERP Page UM Dashboard
    [Documentation]  Opens UM dashboard.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}${UM.link}                 ###""" Variable is defined in "Configuration.resource" file.

Verify UM Dashboard Is Loaded
    [Documentation]  Checks that UM dashboard is loaded by varifying dashboard title.
    title should be  ${UM.dashboard_title}          ###""" Variable is defined in "Configuration.resource" file.

Navigate To SMM Module
    [Documentation]  Navigates to SMM module.
    click link  ${SMM.link_title}                   ###""" Variable is defined in "Configuration.resource" file.

Go To ERP Page SMM Dashboard
    [Documentation]  Opens SMM dashboard.
     Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}${SMM.link}              ###""" Variable is defined in "Configuration.resource" file.

Verify SMM Dashboard Is Loaded
    [Documentation]  Checks that SMM dashboard is loaded by varifying dashboard title.
    title should be  ${SMM.dashboard_title}         ###""" Variable is defined in "Configuration.resource" file.

Open User Action Menu
    [Documentation]  Moves mouse curser to user action menu and opens it.
    wait until element is visible  ${USER_ACTION_DROPDOWN_LINK}
    mouse over  ${USER_ACTION_DROPDOWN_LINK}

Click On Logout
    [Documentation]  Close all browsers.
    close all browsers

Read JSON File Link
    [Documentation]  ...
    wait until element is visible  ${LOGOUT_LINK}
    click element  ${LOGOUT_LINK}

Verify Login Page Is Loaded
    [Documentation]  Verifies that login page is loaded.
    wait until page contains  ${LOGOUT_TEXT}