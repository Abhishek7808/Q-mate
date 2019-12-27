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
Check product registration
    [Tags]    checkproduct  checkproduct1
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables   PD=PD 1  SC=SC 1
    SMM_Keywords.Open Product Page From Department
    SMM_Keywords.Fill Product From Department

To check when Marketing Head can add more price components for a product (One time a day i.e. same proce component can't be added on same date)
    [Tags]    checkproduct  checkproduct2
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables  PD=PD 1  SC=SC 1
    SMM_Keywords.Open Product Page From Department
    SMM_Keywords.Search Product On Product Page  ${PD["Product Name"]}
    SMM_Keywords.Edit Price Component For Product

