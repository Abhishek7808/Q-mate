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
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
To check the process Appropriate Receipt
    [Documentation]    Fills receipt form and generates new receipt
    [Tags]  SMM  receiptgeneration  appropriatereceipt
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1    Receipt=Receipt 1
    SMM_Keywords.Open Receipt List Page From Department
    SMM_Keywords.Generate Receipt
    Sleep    2s
    #Input Valid Value    Receipt Add Button
    #Input Valid Value    Generate Receipt Submit Button
    Sleep    3s
    SMM_Keywords.Approve Reciept From Department  ${Branch["Name"]}
    SMM_Keywords.View Details Of Selected Plant

