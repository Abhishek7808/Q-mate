*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
#Resource          Field${/}Input.robot\
#Resource          Field${/}Confirm.robot\
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Variables ***
${Type To Keyword File}    TypeToKeyword.json
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
To check the process WeighBridge Manager (WM) generate the loading Advice
    [Tags]    loadingadvice
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Sleep    2s
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/LoadingAdvice/LoadingAdviceList
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Department 2
    click element  //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//input
#    Open Browser    http://demoprojects.e-connectsolutions.com/ERP-DEMO    chrome
#    Maximize Browser Window
#    Input Text    LoginIdForShow    yuvraj.rsmml
#    Input Text    PasswordForShow    yuvraj
#    Click Button    btnLogin
#    Sleep    2s
#    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/LoadingAdvice/LoadingAdviceList
    Sleep    2s
#    Wait Until Keyword Succeeds    5s    200ms    Select Checkbox    //td[text()='MESH']/preceding-sibling::td//input
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnApproveLoadingAdvice
    Wait Until Keyword Succeeds    5s    200ms    Click Button    tabApproved
    Sleep    3s
    #Page Should Contain    //td[text()='MESH']/following-sibling::td[text()='Gypsum Powder Loose']
