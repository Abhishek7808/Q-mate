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
Approve or Reject LC/BG Transfer
    [Documentation]    Approves / rejects a tranfer of Financial Instrument
    [Tags]  SMM  transferfi  approvelcbg
    #Approving a Transfer Request
    SMM_Keywords.Create Financial Instrument
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 3    Branch=Branch Department 2    FI=FI 1
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    SMM_Keywords.View Financial Instrument From Department  ${Branch["Name"]}  ${FI["BG/LC Number"]}  ${FI["Validity Date"]}
    Common_Keywords.Set Test Variables    Branch=Branch Department 1
    SMM_Keywords.Approve Financial Instrument Transfer Request From Department
    #Rejecting a Transfer Request
    Create Financial Instrument
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables    Company=Company Department 2    Branch=Branch Department 2    FI=FI 1
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    SMM_Keywords.View Financial Instrument From Department  ${Branch["Name"]}  ${FI["BG/LC Number"]}  ${FI["Validity Date"]}
    SMM_Keywords.Reject Financial Instrument Transfer Request From Department


