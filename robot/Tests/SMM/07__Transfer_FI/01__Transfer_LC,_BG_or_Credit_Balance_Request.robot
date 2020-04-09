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

*** Variables ***
@{Branches}       ${Test Data["${CONFIG["Branch Customer 1"]}"]["Name"]}    ${Test Data["${CONFIG["Branch Customer 3"]}"]["Name"]}

*** Test Cases ***
To check the Transfer of LC/BG
    [Documentation]  Requests transfer instrument from customer and approves it from admin.
    [Tags]  SMM  transferfi  transferlcbg  checkprocess
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 2   PO=PO 1   CRO=CRO 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.View Approved Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    sleep  5s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    SMM_Keywords.Request Transfer Instument From Customer  ${Branch["Name"]}  ${FI["Transfer Amount"]}
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Financial Instrument List From Department
    Sleep    1s
    SMM_Keywords.Search Financial Instrument By FI Number From Department  ${FI["BG/LC Number"]}
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    SMM_Keywords.View Financial Instrument From Department  ${Branch["Name"]}  ${FI["BG/LC Number"]}  ${FI["Validity Date"]}
    sleep  4s
    Common_Keywords.Set Test Variables    Branch=Branch Customer 1
    SMM_Keywords.Approve Financial Instrument Transfer Request From Department  ${Branch["Name"]}  ${FI["Transfer Amount"]}
    Sleep    2s
    BrowserControl.Switch To    Customer
    SMM_Keywords.Go To Profile Selection Page
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Financial Instrument List From Customer
    Sleep    2s
    SMM_Keywords.View Approved Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}

To check that the transfer of FI can only be done within group members.
    [Documentation]  Opens transfer instrument tab and check for transfer instrument members.
    [Tags]  SMM  transferfi  transferlcbg  withinmembers
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 2   PO=PO 1   CRO=CRO 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.View Approved Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    Sleep    5s
    SMM_Keywords.Verify Transfer Instrument Members

To check that the transfer amount cannot exceed available amount of FI
    [Documentation]  Request transfer instrument with amount greater then FI available balance.
    [Tags]  SMM  transferfi  transferlcbg  checkfiamount
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2   PO=PO 1   CRO=CRO 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument List From Customer
    Sleep    2s
    SMM_Keywords.View Approved Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    Sleep    2s
    ${Amount}  SMM_Keywords.Get Available Amount Value Of Financial Instrument
    SMM_Keywords.Request Transfer Instument From Customer  ${Branch["Name"]}  ${Amount}+1
    Common_Keywords.Verify Element Text On The Page  //span[@class='error-message']   Value Should be Less Than available value

