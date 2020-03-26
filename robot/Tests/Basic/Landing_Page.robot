*** Settings ***

Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot

Suite Teardown  Common_Keywords.Update Error Sheet

*** Variables ***
*** Test Cases ***
Admin should able to access the landing page
    [Documentation]  Does login into ERP and checks that dashboard is loaded.
    [Tags]  basic  landingpage
    ERP_Keywords.Open Dashboard
    ERP_Keywords.Verify Dashboard Is Loaded





