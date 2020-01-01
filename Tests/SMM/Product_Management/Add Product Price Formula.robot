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
Check the process to add product price formula
    [Tags]  SMM  productmanagement  addproduct  checkprocess
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables  PD=PD 1  SC=SC 1
    SMM_Keywords.Open Product Page From Department
    sleep  1s
    SMM_Keywords.Fill Product From Department
    sleep  1s
    SMM_Keywords.Open Schedule Page From Department
    SMM_Keywords.Fill Schedule From Department

To check that user can create a new formula using fields
    [Tags]  SMM  productmanagement  addproduct  newformula
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    #Set Test Variable    ${Key Description}    ${Department Key Description}
    Common_Keywords.Set Test Variables    SC=SC 2  PD=PD 1
    SMM_Keywords.Open Product Page From Department
    SMM_Keywords.Fill Product From Department
    SMM_Keywords.Fill Schedule On Product Page
