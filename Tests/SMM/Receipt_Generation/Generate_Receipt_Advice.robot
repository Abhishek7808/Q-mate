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
Check Receipt Advice Generation
    [Documentation]    Still
    [Tags]  SMM  receiptgeneration  generatereceiptadvice  checkprocess
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 3    Branch=Branch Department 2    Receipt=Receipt 1
    SMM_Keywords.Open Receipt List Page From Department
    SMM_Keywords.Generate Receipt

#To check the process of Edit Receipt Advice
#    [Tags]  SMM  receiptgeneration    Skip

Check Financial instrument after receipt generation
    [Documentation]    Still
    [Tags]  SMM  receiptgeneration   generatereceiptadvice  checkfi
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    FI=FI 1   Company=Company Department 3    Branch=Branch Department 1  Receipt=Receipt 1
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    SMM_Keywords.View Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    #Input Valid Value    Financial Instrument View List Button
    SMM_Keywords.Open Receipt List Page From Department
    SMM_Keywords.Generate Receipt
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    SMM_Keywords.View Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
