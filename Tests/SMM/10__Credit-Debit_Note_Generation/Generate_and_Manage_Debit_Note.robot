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
Check the process to Generate Debit Note
    [Documentation]    Generates debit note
    [Tags]    debitnote
    BrowserControl.Switch To    Department
    SMM_Keywords.Open Differentials Adjustments Page From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1  DN=DN 1
    SMM_Keywords.Generate Debit Note  PHOS/1920/194  IN-05/1819/23

#Check the process to Cancel Debit Note
#    [Tags]    Skip
#
#To check debit note generation in case of interest on delayed payment
#    [Tags]    Skip
#
#To check debit note generation in case of Royalty Difference
#    [Tags]    Skip
#
#To check when in case of Rate Difference (due to change of rate in back date) /Quantity difference
#    [Tags]    Skip
