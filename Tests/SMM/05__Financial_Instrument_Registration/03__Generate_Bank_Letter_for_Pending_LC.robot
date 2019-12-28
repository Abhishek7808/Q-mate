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
Filter and View LC for pending payment, and print Bank letter
    [Documentation]    Generate bank letter/print the letter
    [Tags]  bankletter  bankletter1
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 1
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    Sleep    2s
    SMM_Keywords.Print Financial Instrument  ${FI["BG/LC Number"]}

#To check that the Notification should be sent 5 days before the due payment date of all Financial Instruments for credit payment
#    [Tags]    Skip
#
#To check that on electing the instrument, its related invoice Bank Letter for receiving the payment against LC should be generated and printed through the system
#    [Tags]    Skip
