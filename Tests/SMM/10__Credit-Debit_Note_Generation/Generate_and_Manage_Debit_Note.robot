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
Check the process to generate debit note
    [Documentation]    Generates debit note
    [Tags]  SMM  debitnote  checkprocess
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Differentials Adjustments Page From Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1  DN=DN 1
    SMM_Keywords.Generate Debit Note  PHOS/1920/194  IN-05/1819/23

#Check the process to Cancel Debit Note
#    [Tags]  SMM    Skip
#
#To check debit note generation in case of interest on delayed payment
#    [Tags]  SMM    Skip
#
#To check debit note generation in case of Royalty Difference
#    [Tags]  SMM    Skip
#
#To check when in case of Rate Difference (due to change of rate in back date) /Quantity difference
#    [Tags]  SMM    Skip
