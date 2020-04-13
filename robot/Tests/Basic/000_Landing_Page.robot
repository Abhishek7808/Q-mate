*** Settings ***

Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot

*** Test Cases ***
Admin should able to access the landing page
    [Documentation]  Does login into ERP and checks that dashboard is loaded.
    [Tags]  basic  landingpage
    ERP_Keywords.Perform Login
    ERP_Keywords.Verify Landing Page Is Loaded





