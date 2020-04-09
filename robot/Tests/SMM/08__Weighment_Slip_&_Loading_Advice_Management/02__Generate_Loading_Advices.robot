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
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Variables ***
${Type To Keyword File}    TypeToKeyword.json
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
To check the process WeighBridge Manager (WM) generate the loading Advice
    [Documentation]  Generates the loading advice.
    [Tags]  SMM  weighmentslip  generateloadingadvice
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Loading Advice List From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Department 2
    SMM_Keywords.View Loading Advice From Department  ${Branch["Name"]}
    SMM_Keywords.Approve Loading Advice From Department
    #Wait Until Keyword Succeeds    5s    200ms    Select Checkbox    //td[text()='MESH']/preceding-sibling::td//input
    #Page Should Contain    //td[text()='MESH']/following-sibling::td[text()='Gypsum Powder Loose']
