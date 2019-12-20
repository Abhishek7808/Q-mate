*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot


*** Test Cases ***
Give admin rights to member in a group
    [Tags]  managegroup
    Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
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
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    Page Should Contain Button    addMember
