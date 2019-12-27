*** Settings ***
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Department${/}Company.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
Check Receipt Advice Generation
    [Documentation]    Still
    [Tags]    receiptadvice  receiptadvice1
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables    Company=Company Department 3    Branch=Branch Department 2    Receipt=Receipt 1
    SMM_Keywords.Open Receipt List Page From Department
    SMM_Keywords.Generate Receipt

#To check the process of Edit Receipt Advice
#    [Tags]    Skip

Check Financial instrument after receipt generation
    [Documentation]    Still
    [Tags]   receiptadvice  receiptadvice2
    BrowserControl.Switch To    Department
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
