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
Add Financial Instrument
    [Tags]  Financial  Financial1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.Generate Financial Instrument
    Sleep    3s
    SMM_Keywords.View Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    SMM_Keywords.Go To Profile Selection Page
    Common_Keywords.Set Test Variables    Branch=Branch Customer 1    FI=FI 1
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.Generate Financial Instrument
    Sleep    2s
    Common_Keywords.Set Test Variables    FI=FI 2
    SMM_Keywords.Generate Financial Instrument
    Sleep    2s

Check the edit process for pending FI
    [Tags]  Financial  Financial2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument By FI Number  ${FI["BG/LC Number"]}
    Sleep    2s
    Set Test Variable    ${FI}    ${Test Data["${CONFIG["FI 2"]}"]}
    SMM_Keywords.Fill Financial Instrument Form

Check that only after Financial Instrument approval, CRO can be generated
    [Tags]  Financial  Financial3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    FI=FI 2   PO=PO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Purchase Order List By Customer
    Sleep    3s
    SMM_Keywords.Filter Purchase Order List By Status From Customer  Approved
    Sleep    1s
    SMM_Keywords.Select Purchase Order By Product From Customer  ${PO["Select Product"]}
    Sleep    2s
    SMM_Keywords.Request CRO From PO Form
    SMM_Keywords.Check CRO Form Submission Without Financial Insturment

Check edit functionality for approved FI
    [Tags]  Financial  Financial4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    BrowserControl.Switch To    Verify
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Filter Financial Instruments by Instrument Type From Department  ${FI["Instrument Type"]}
    SMM_Keywords.View Financial Instrument By Branch Name From Department  ${Branch["Name"]}
    SMM_Keywords.Approve Financial Instrument From Department
    BrowserControl.Switch To    Customer
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument List From Customer
    Sleep    2s
    SMM_Keywords.View Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    Sleep    5s
    SMM_Keywords.Verify Updation Permissions
