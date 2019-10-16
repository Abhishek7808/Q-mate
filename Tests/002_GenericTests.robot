*** Settings ***
Documentation  ERP Tests
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/ERP_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  ../Data/Common_Data.robot
Library  OperatingSystem
Library  Collections

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot -d Results Tests/001_ERP_Admin_Login.robot


*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot


*** Test Cases ***
Run all generic tests for all urls in one go
    [Documentation]  Tests if yellow pages are appearing or title tags are missing.
    [Tags]  generictests
#    [Template]  Run Generic Tests
#    ${INVALID_USER}
#    ${INVALID_PASSWORD}
     ${urls_json}=  Get file  Data/URLs.json
     @{urls_list}=    Evaluate     json.loads('''${urls_json}''')    json
# the variable ${urls_list} is now a python dictionary - the same as the original json, but only - accessible as dictionary in robotframwork


    :FOR  ${item}  IN  @{urls_list}
    \   Log  ${item}
    \   ${moduleName}=  Set variable    ${item['MODULE']}
    \   ${link}=    Set variable    ${item['URL']}
    \   run keyword if  ${moduleName}==HRM  run generic tests  ${link}
    \   Log    ${link}



