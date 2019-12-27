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
# TODO: increase product quantity required in CRO 1, CRO 2, CRO 3 and hanece increase amount also
Check Request CRO process
    [Tags]  requestcro  requestcro1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2   FI=FI 2    PO=PO 1    CRO=CRO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Purchase Order List As A Customer
    SMM_Keywords.Filter Purchase Order List By Status  Approved
    SMM_Keywords.Select Purchase Order By Product From Customer  ${PO["Select Product"]}
    Sleep    2s
    SMM_Keywords.Request CRO From PO Form
    SMM_Keywords.Fill CRO From Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 2
    SMM_Keywords.SMM_Keywords.Fill CRO From From Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 3
    SMM_Keywords.Fill CRO From Customer
    sleep  5s
    SMM_Keywords.Request CRO From Customer

View CRO request status
    [Tags]  requestcro  requestcro2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 1    PO=PO 1    CRO=CRO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View CRO List By Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    1s
    SMM_Keywords.Fill CRO From Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 2
    SMM_Keywords.Fill CRO From Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    1s
    Common_Keywords.Set Test Variables    CRO=CRO 3
    SMM_Keywords.Fill CRO From Customer
    SMM_Keywords.View CRO From Customer  ${SSO ID["Name"]}
    SMM_Keywords.Verify That CRO Is Not Approved

Check edit functionality when CRO is pending
    [Tags]  requestcro  requestcro3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Purchase Order List As A Customer
    SMM_Keywords.View CRO From Customer  ${SSO ID["Name"]}
    Set Test Variable    ${CRO}    ${Test Data["${CONFIG["CRO 1"]}"]}
    Sleep    1s
    SMM_Keywords.Fill CRO From Customer

Check that financial instrument available balance should be more than or equal to CRO amount when CRO is approved
    [Tags]  requestcro  requestcro4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.Open Approved Financial Instrument By FI Number  ${FI["BG/LC Number"]}
    Sleep    5s
    SMM_Keywords.Verify FI Balance Is Greater Than CRO Balance

Check that CRO quantity cannot be greater than PO remaining balance
    [Tags]  requestcro  requestcro5
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    SMM_Keywords.View Purchase Order List As A Customer
    SMM_Keywords.Request CRO From Customer
    Sleep    2s
    SMM_Keywords.Select Purchase Order In CRO Form
    SMM_Keywords.Get PO Remaining Quantity
    SMM-Keywords.Fill CRO Required Quantity

#
#    ${Available Quantity}    Get Text    availableQuantity
#    Page Should Contain    Enter Qty less than    ${Available Quantity}
