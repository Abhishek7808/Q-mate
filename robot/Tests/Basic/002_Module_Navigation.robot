*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/HRMS_Keywords.robot
Resource  ${DATA}/Login_Data.robot

# robot --loglevel debug -d Results -i navigation Tests/

*** Test Cases ***
All modules should open their dashboards
    [Documentation]  Open all modules one by one from the main dashboard.
    [Tags]  Basic  modulenavigation

    ERP_Keywords.Go To ERP
    sleep  5s

    ERP_Keywords.Test UM
    ERP_Keywords.Go To Home
    sleep  5s

    ERP_Keywords.Test HRMS
    ERP_Keywords.Go To Home
    sleep  5s

    ERP_Keywords.Test FA
    ERP_Keywords.Go To Home
    sleep  5s