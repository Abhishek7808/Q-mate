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

*** Test Cases ***
Invoice Generation (including pending Moisture Rate)
    [Documentation]    Generates invoice from product management (moisture rebate)
    [Tags]  SMM  invoicing  generateinvoice
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Schedule Page From Department
    #Click Button    Next
    Sleep    1s
    SMM_Keywords.View Schedule By Name  Royalty
    Sleep    5s
    SMM_Keywords.Add Formula In Schedule
    Sleep    3s
    SMM_Keywords.Open Invoice Page From Department
    Sleep    5s
    #Click Button    tabApproved
    Sleep    2s
    SMM_Keywords.Print Invoice From Department  PHOS/1920/194

#Check Invoice Cancellation process
#    [Tags]  SMM    Skip
#
#Check Invoice Generation for auctionable product
#    [Tags]  SMM    Skip
#
#Check that invoice generation for products with moisture rebate
#    [Tags]  SMM    Skip
