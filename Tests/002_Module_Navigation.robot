*** Settings ***
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Resources/HRMS_Keywords.robot
Resource  ../Data/Common_Data.robot
Resource  ../Data/Login_Data.robot

# robot --loglevel debug -d Results -i adminlogin -i navigation Tests/002_Module_Navigation.robot
#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

*** Test Cases ***
All modules should open their dashboards
    [Documentation]  Open all modules one by one from the main dashboard
    [Tags]  adminlogin  navigation

    ERP_Keywords.Test UM
    ERP_Keywords.Go To Home
    sleep  5s

    ERP_Keywords.Test HRMS
    ERP_Keywords.Go To Home
    sleep  5s

    ERP_Keywords.Test FA
    ERP_Keywords.Go To Home
    sleep  5s