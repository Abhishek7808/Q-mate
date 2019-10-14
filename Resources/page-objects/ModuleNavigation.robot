*** Variables ***
#Locators
${MODULE_NAVIGATION_BUTTON}     xpath=//button[@id='on_scroll']
${NAVIGATION_MENU}              xpath=//div[@id='menu_kis']

#Module Texts
${HRMS_DASHBOARD_TEXT}                     HRM:Dashboard
${UR_DASHBOARD_TEXT}
${FA_DASHBOARD_TEXT}

#Module Links
&{HRMS}
...  link=/HRM
...  link_title=//a[@title='HRMS']
...  dashboard_title=HRM:Dashboard

&{FA}
...  link=/ACC
...  link_title=xpath=//a[@title='Financial Accounting']
...  dashboard_title=Financial Accounts:Dashboard

&{UM}
...  link=/URM
...  link_title=xpath=//a[@title='User Management']
...  dashboard_title=User, Role and Workflow Management:Dashboard
#${UM_LINK}                      a[href*='URM']

&{SMM}
...  link=/SMM
...  link_title=xpath=//a[@title='User Management']
...  dashboard_title=Sales & Marketing

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
Go To HRMS Dashboard
    go to  ${URL.${ENVIRONMENT}}&{HRMS}[link]
Verify HRMS Dashboard Is Loaded
    title should be  &{HRMS}[dashboard_title]

Navigate To FA Module
    click link  &{FA}[link_title]
Go To FA Dashboard
    go to  ${URL.${ENVIRONMENT}}&{FA}[link]
Verify FA Dashboard Is Loaded
    title should be  &{FA}[dashboard_title]

Navigate To UM Module
    click link  &{UM}[link_title]
Go To UM Dashboard
     go to  ${URL.${ENVIRONMENT}}&{UM}[link]
Verify UM Dashboard Is Loaded
    title should be  &{UM}[dashboard_title]

Navigate To SMM Module
    click link  &{SMM}[link_title]
Go To SMM Dashboard
     go to  ${URL.${ENVIRONMENT}}&{SMM}[link]
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