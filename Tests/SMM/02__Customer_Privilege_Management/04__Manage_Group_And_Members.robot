*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
*** Test Cases ***
Give admin rights to member in a group
    [Tags]  managegroup
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Customer Groups
    Sleep    3s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    1s
    ${status}  run keyword and return status  Click Element    //i[@title='Switch Admin']
    log  ${status}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    //i[@title='Switch Admin'] button not appreared
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Sleep    2s
    Select From List By Label    switchAdmin    ${Branch["Name"]}, ${Company["Company Name"]}
    Sleep    2s
    Click Button    btnSwitchAdmin
    Sleep    2s
    SMM_Keywords.Go To Profile Selection Page
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Groups
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    Page Should Contain Button    addMember
