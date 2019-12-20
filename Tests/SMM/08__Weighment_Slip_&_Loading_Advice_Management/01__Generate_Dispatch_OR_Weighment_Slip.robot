*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
#TODO: Make new CROs for running 2nd, 3rd and 4th test
To check the process Inward Dispatch Slip to get generated
    [Tags]    generateslip  generateslip1
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 2
    Fill Inward Slip  	CRO-PHOS/1920/175
    sleep  2s
    ${text}  get text  //span[@id='message-id']
    Wait Until Keyword Succeeds    2s    200ms   should contain  ${text}   Insufficient balance

Inward Dispatch Slip Generation
    [Tags]    generateslip  generateslip2
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 4
    Fill Inward Slip   PHOS/1920/176
    Wait Until Keyword Succeeds    2s    200ms    Element Text Should Be    //span[@id='message-id']    Saved Successfully

To check the process Outward Dispatch Slip cannot be generated
    [Tags]    generateslip  generateslip3
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 4
    Fill Outward Slip    PHOS/1920/176
    Wait Until Keyword Succeeds    2s    200ms    Element Text Should Be    //span[@id='message-id']    Gross Weight can not be greater than Max Capacity

Outward Dispatch Slip Generation
    [Tags]    generateslip  generateslip4
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    ...    Dispatch=Dispatch 3
    Fill Outward Slip    PHOS/1920/176
    Wait Until Keyword Succeeds    2s    200ms    Element Text Should Be    //span[@id='message-id']    Saved Successfully
