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
To check the approval process of FI requests
    [Documentation]    Approves the Financial Instrument submitted by the customer
    [Tags]  SMM  financialinstrument  approvefi  approvalprocess
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 1    SSO ID=SSOID 2
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    SMM_Keywords.View Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    SMM_Keywords.Approve Financial Instrument From Department
    BrowserControl.Switch To    Verify
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    Sleep    2s
    SMM_Keywords.Verify Approval Of Financial Instruments  ${FI["BG/LC Number"]}

Cancel Financial Instruments, not used in any Active CROs
    [Documentation]    Rejects the Financial Instrument submitted by the customer
    [Tags]  SMM  financialinstrument  approvefi  cancellation
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 2    SSO ID=SSOID 2
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Approve Financial Instrument From Department
    SMM_Keywords.Reject Pending Financial Instrument From Department  ${FI["BG/LC Number"]}
    BrowserControl.Switch To    Verify
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Verify Financial Instrument Is Rejected  ${FI["BG/LC Number"]}

#To check the process when FI is Edit and Update
#    [Tags]  SMM  financialinstrument  approvefi    Skip
#
#Check cancel financial instruments when shared between the group members
#    [Tags]  SMM  financialinstrument  approvefi    Skip
#
#Cancel Financial Instruments, used in Active CRO
#    [Tags]  SMM  financialinstrument  approvefi    Skip
