*** Settings ***
Documentation  ERP Tests
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Library  ../Library/ERP.py

#Suite Setup  Common_Keywords.Begin Web Test
Suite Teardown  Common_Keywords.End Web Test

#robot -d results -i adminlogin -i generictests Tests/


*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
${HRM_Module}  hrm

*** Test Cases ***
All ERP module pages should be working for admin user
    [Documentation]  Tests if yellow pages are appearing or title tags are missing.
     [Tags]  generictests  critical
#   ERP_Keywords.Test All HRM Urls
    ERP_Keywords.Test All FA Urls
#    ERP_Keywords.Test All UM Urls
#    ERP_Keywords.Test All SMM Urls
#    ERP_Keywords.Test All SMM Urls

All HRM module pages should be working for non admin user







# the variable ${urls_list} is now a python dictionary - the same as the original json, but only - accessible as dictionary in robotframwork


