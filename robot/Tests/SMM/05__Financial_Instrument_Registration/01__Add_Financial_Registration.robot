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
Add Financial Instrument
    [Documentation]  Fills details in add financial instrument form.
    [Tags]  SMM  financialinstrument  addfinancialinstrument  creation
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.Generate Financial Instrument From Customer
    Sleep    3s
    SMM_Keywords.View Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    SMM_Keywords.Go To Profile Selection Page
    Common_Keywords.Set Test Variables    Branch=Branch Customer 1    FI=FI 1
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.Generate Financial Instrument From Customer
    Sleep    2s
    Common_Keywords.Set Test Variables    FI=FI 2
    SMM_Keywords.Generate Financial Instrument From Customer
    Sleep    2s

Check the edit process for pending FI
    [Documentation]  Edits financial instrument details when financial instrument is pending from admin.
    [Tags]  SMM  financialinstrument  addfinancialinstrument  editdetailsofpending
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    Sleep    2s
    Set Test Variable    ${FI}    ${Test Data["${CONFIG["FI 2"]}"]}
    SMM_Keywords.Fill Financial Instrument Form By Customer

Check that only after Financial Instrument approval, CRO can be generated
    [Documentation]  Requests CRO without financial instrument approval.
    [Tags]  SMM  financialinstrument  addfinancialinstrument  crogeneration
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
    [Documentation]  Edit details of financial instrument when it is approved by admin.
    [Tags]  SMM  financialinstrument  addfinancialinstrument  editdetailsofapproved
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2    FI=FI 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Open Financial Instrument List From Department
    SMM_Keywords.Filter Financial Instruments by Instrument Type From Department  ${FI["Instrument Type"]}
    SMM_Keywords.View Financial Instrument From Department  ${Branch["Name"]}  ${FI["BG/LC Number"]}  ${FI["Validity Date"]}
    SMM_Keywords.Approve Financial Instrument From Department
    BrowserControl.Switch To    Customer
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument List From Customer
    Sleep    2s
    SMM_Keywords.View Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    Sleep    5s
    SMM_Keywords.Verify Updation Permissions
