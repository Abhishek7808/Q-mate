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
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 3    Branch=Branch Department 2    Receipt=Receipt 1
    Go To Receipt Generation
    Input Valid Value    Generate Receipt Create New Button
    Sleep    5s
    Generate Receipt By Department
    Sleep    2s

#To check the process of Edit Receipt Advice
#    [Tags]    Skip

Check Financial instrument after receipt generation
    [Documentation]    Still
    [Tags]   receiptadvice  receiptadvice2
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    FI=FI 1   Company=Company Department 3    Branch=Branch Department 1  Receipt=Receipt 1
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    	111114
    View Company Details
    Input Valid Value    Financial Instrument View List Button
    Go To Receipt Generation
    Input Valid Value    Generate Receipt Create New Button
    Sleep    5s
    Generate Receipt By Department
    Sleep    2s
    Input Valid Value    Generate Receipt Create New Button
    Sleep    5s
    Sleep    5s
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    111114
    View Company Details
