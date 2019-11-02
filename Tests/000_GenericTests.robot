*** Settings ***
Documentation  ERP Tests
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${COMMONDATA}
Library   Collections

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test
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
#    ${HRMS.name}
    ${FA.name}
    ${UM.name}
#    ${SMM.name}


All ERP pages should not be accessed without persmissions
    [Tags]  generictests  critical  citizen
    [Template]  Run Generic Tests From Other User
#    ${HRMS.name}
    ${FA.name}
    ${UM.name}
#    ${SMM.name}
