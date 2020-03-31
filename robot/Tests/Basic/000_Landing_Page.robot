*** Settings ***

Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot

#Suite Teardown  Common_Keywords.Update Error Sheet
#Suite Setup  Common_Keywords.Set Login Variable  admin_live

*** Test Cases ***
Admin should able to access the landing page
    [Documentation]  Does login into ERP and checks that dashboard is loaded.
    [Tags]  basic  landingpage
    ERP_Keywords.Open Dashboard
    ERP_Keywords.Verify Landing Page Is Loaded





