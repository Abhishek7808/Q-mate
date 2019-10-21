*** Settings ***
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Resources/HRMS_Keywords.robot
Resource  ../Data/Common_Data.robot
Resource  ../Data/Login_Data.robot

# robot --loglevel debug -d Results -i navigation Tests/
#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

*** Test Cases ***
All modules should open their dashboards
    [Documentation]  Open all modules one by one from the main dashboard
    [Tags]  navigation

    ERP_Keywords.Go To ERP

    ERP_Keywords.Test UM
    ERP_Keywords.Go To Home
    sleep  5s

    ERP_Keywords.Test HRMS
    ERP_Keywords.Go To Home
    sleep  5s

    ERP_Keywords.Test FA
    ERP_Keywords.Go To Home
    sleep  5s