*** Settings ***
Library  SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py


*** Variables ***
#Locators
${MODULE_NAVIGATION_BUTTON}     xpath=//button[@id='on_scroll']
${NAVIGATION_MENU}              xpath=//div[@id='menu_kis']


*** Keywords ***
Open Modules Menu
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
    click link  &{HRMS}[link_title]
Go To ERP Page HRMS Dashboard
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}&{HRMS}[link]
Verify HRMS Dashboard Is Loaded
    title should be  &{HRMS}[dashboard_title]

Navigate To FA Module
    click link  &{FA}[link_title]
Go To ERP Page FA Dashboard
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}&{FA}[link]
Verify FA Dashboard Is Loaded
    title should be  &{FA}[dashboard_title]

Navigate To UM Module
    click link  &{UM}[link_title]
Go To ERP Page UM Dashboard
     Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}&{UM}[link]
Verify UM Dashboard Is Loaded
    title should be  &{UM}[dashboard_title]

Navigate To SMM Module
    click link  &{SMM}[link_title]
Go To ERP Page SMM Dashboard
     Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}&{SMM}[link]
Verify SMM Dashboard Is Loaded
    title should be  &{SMM}[dashboard_title]

Open Dashboard From Logo

Open Dashboard From Home Button

Open Help Portal From Help Button

Open Notifications

Open User Action Menu
    wait until element is visible  ${USER_ACTION_DROPDOWN_LINK}
    mouse over  ${USER_ACTION_DROPDOWN_LINK}

Click On Logout Link
    wait until element is visible  ${LOGOUT_LINK}
    click element  ${LOGOUT_LINK}

Verify Login Page Is Loaded
    wait until page contains  ${LOGOUT_TEXT}