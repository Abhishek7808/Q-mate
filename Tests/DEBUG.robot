*** Settings ***
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Resource  ../Resources/page-objects/ModuleNavigation.robot


Suite Setup  Common_Keywords.Begin Web Test
Suite Teardown  Common_Keywords.End Web Test

# robot --loglevel debug -d Results Tests/DEBUG.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot

*** Test Cases ***
Admin should be able to login with correct username and password
    [Tags]  debug
    ERP_Keywords.Open The Login Page
    ERP_Keywords.Login To ERP  ${ADMIN_USER}
    ModuleNavigation.Go To HRMS Dashboad
    ModuleNavigation.Verify HRMS Dashboard Is Loaded


Admin should be able to logout
    [Tags]  debug
   # ERP_Keywords.Attempt Logout
Open time out url
    [Tags]  debug
    #go to  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
Check The Session
    [Tags]  debug
    #ERP_Keywords.Check The Session  ${ADMIN_USER}

Check Title Tag
    [Tags]  debug
    #go to  http://demoprojects.e-connectsolutions.com/ERP-DEMO/

