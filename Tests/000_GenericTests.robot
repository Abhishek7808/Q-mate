*** Settings ***
Documentation  ERP Tests
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Library    Collections
Suite Setup  Common_Keywords.Begin Web Test
Suite Teardown  Common_Keywords.End Web Test

# robot -d Results Tests/000_GenericTests.robot


*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot


*** Test Cases ***
All ERP module pages should be working for admin user
    [Documentation]  Tests if yellow pages are appearing or title tags are missing.
    [Tags]  generictests  critical
    [Template]  Run Generic Tests From Admin
#     ${HRMS.name}
#     ${FA.name}
      ${UM.name}
#     ${SMM.name}


All ERP pages should not be accessed without persmissions
    [Tags]  generictests  critical  citizen
    ${LOGIN}  set global variable  citizen
    ERP_Keywords.Attempt Logout
    [Template]  Run Generic Tests From Citizen



# the variable ${urls_list} is now a python dictionary - the same as the original json, but only - accessible as dictionary in robotframwork
