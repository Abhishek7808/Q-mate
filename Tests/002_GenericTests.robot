*** Settings ***
Documentation  ERP Tests
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Library  ../Library/ERP.py

#Suite Setup  Common_Keywords.Begin Web Test
Suite Teardown  Common_Keywords.End Web Test

# robot -d results -i adminlogin -i generictests Tests/


*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot


*** Test Cases ***
All ERP module pages should be working for admin user
    [Documentation]  Tests if yellow pages are appearing or title tags are missing.
    [Tags]  generictests  critical
    [Template]  Run Generic Tests
    ${HRMS.name}
    ${FA.name}
    ${UM.name}
    ${SMM.name}



# the variable ${urls_list} is now a python dictionary - the same as the original json, but only - accessible as dictionary in robotframwork


