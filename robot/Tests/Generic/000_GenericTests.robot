*** Settings ***
Documentation  Generic Tests
#Resource  ../Configuration.resource
Resource  ../../Configuration.resource
Resource  ${RESOURCES}${/}Common_Keywords.robot
Resource  ${RESOURCES}${/}ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Library   Collections

# robot -d Results Tests/000_GenericTests.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
#@{moduleNames}  ${HRMS.name}  ${FA.name}  ${UM.name}  ${SMM.name}  ${CPF.name}

*** Test Cases ***
All ERP module pages should be working for admin user
    [Documentation]  Tests if yellow pages are appearing or title tags are missing.
    [Tags]  critical  generictests  common
    [Template]  Run Generic Tests From Admin              ###""" Keyword defination can be found in "ERP_Keywords.robot" file."""
       ${HRMS.name}                                         ###""" Variables are defined in "Configuration.resource" file."""
       ${FA.name}
       ${UM.name}
       ${SMM.name}
       ${CPF.name}
       ${GPF.name}
       ${MM.name}
       ${WPM.name}
#      ${AMS.name}
#      ${TLM.name}
#      ${IMS.name}
#      ${LDM.name}

All ERP pages should not be accessed without persmissions
    [Documentation]  Tests if access validator not properly implimented on the page
    [Tags]  critical  generictests  permission
    [Template]  Run Generic Tests From Other User           ###""" Keyword defination can be found in "ERP_Keywords.robot" file."""
       ${HRMS.name}
       ${FA.name}
       ${UM.name}
       ${SMM.name}
       ${CPF.name}
       ${GPF.name}
       ${MM.name}
       ${WPM.name}
#      ${AMS.name}
#      ${TLM.name}
#      ${IMS.name}
#      ${LDM.name}