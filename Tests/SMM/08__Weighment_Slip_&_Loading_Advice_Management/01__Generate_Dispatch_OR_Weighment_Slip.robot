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
#TODO: Make new CROs for running 2nd, 3rd and 4th test
To check the process Inward Dispatch Slip to get generated
    [Tags]    generateslip  generateslip1
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 2
    SMM_Keywords.Open Weighbridge Operations Page
    Sleep    2s
    SMM_Keywords.Generate Inward Slip  CRO-PHOS/1920/175
    sleep  2s
    Common_Keywords.Verify Element Text On The Page  //span[@id='message-id']  Insufficient balance

Inward Dispatch Slip Generation
    [Tags]    generateslip  generateslip2
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 4
    SMM_Keywords.Open Weighbridge Operations Page
    Sleep    2s
    SMM_Keywords.Generate Inward Slip
    Common_Keywords.Verify Element Text On The Page  //span[@id='message-id']    Saved Successfully

To check the process Outward Dispatch Slip cannot be generated
    [Tags]    generateslip  generateslip3
    BrowserControl.Switch To    Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 4
    SMM_Keywords.Open Weighbridge Operations Page
    SMM_Keywords.Generate Outward Slip  PHOS/1920/176
    Common_Keywords.Verify Element Text On The Page  //span[@id='message-id']    Gross Weight can not be greater than Max Capacity

Outward Dispatch Slip Generation
    [Tags]    generateslip  generateslip4
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 3
    SMM_Keywords.Open Weighbridge Operations Page
    SMM_Keywords.Generate Outward Slip  PHOS/1920/176
    Common_Keywords.Verify Element Text On The Page  //span[@id='message-id']    Saved Successfully
