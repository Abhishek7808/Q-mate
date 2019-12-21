*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
#Resource          ../../../Configuration.resource
#Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Variables ***
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***

Check Customer Registration Process
    [Documentation]    Done
    [Tags]  Himself  selfregistration  Himself1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Delete_Data.Delete All The Prewritten Data Of SSOID From ERP    ${SSO ID["SSOID"]}
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  SMM_Keywords.Select Customer Type  purchaser
    SMM_Keywords.Create New User Account  customer
    SMM_Keywords.Company Registration By Customer    Fresh    Pending
    Sleep    3s

Check new branch registration when the company already have branches registered in it
    [Documentation]    Done
    [Tags]  alreadybranches  Himself  himself2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Create New User Account  customer
    Sleep    2s
    SMM_Keywords.Company Registration By Customer    New    Pending
    Sleep    3s

Check the branch registration when user selects branch from an existing registered branches in a company with diffrent SSOID
    [Documentation]    This is not working when we are using same ssoid
    [Tags]  userselectsbranch  Himself  himself3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 3
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer Type  purchaser
    SMM_Keywords.Company Registration By Customer    Existing    Pending
    Sleep    3s

Check the registration process when customer has partially filled the application
    [Documentation]    Done
    [Tags]  partially  Himself  himself4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 6    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Create New User Account  customer
    sleep  2s
    SMM_Keywords.Company Registration By Customer    Fresh    Draft
    Sleep  1s
    SMM_Keywords.Go To Profile Selection Page
    sleep  2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep  2s
    SMM_Keywords.View Customer Registration
    Sleep  2s
    SMM_Keywords.Check for draft state of Customer Registration


Check the draft branch visibility in 'View Branch' option on registration form
    [Documentation]    Done
    [Tags]  branchvisibility  Himself  himself5
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 3    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Create New User Account  customer
    Sleep    2s
    SMM_Keywords.Company Registration By Customer    New    Draft
    SMM_Keywords.Go To Profile Selection Page
    SMM_Keywords.Create New User Account  customer
    SMM_Keywords.Check Draft Branch Visibility

Check the reject process of customer registration by departmental user
    [Documentation]    Done
    [Tags]  reject  Himself  himself6
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 6    SSO ID=SSOID 2
    BrowserControl.Switch To    Department
    #ERP_Keywords.Attempt Login   username=archit.rsmml    password=admin
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Filter Plants By Status   Pending
    sleep  2s
    SMM_Keywords.View Selected Plant Details  ${Branch["Name"]}
    SMM_Keywords.Reject Selected Plant
    BrowserControl.Switch To    Customer
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Registration
    SMM_Keywords.Check for Rejected state of Customer Registration

Check the edit process of customer details when customer is not approved by department
    [Tags]  notapproved  Himself  himself7
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Registration
    Sleep    2s
    SMM_Keywords.Company Registration By Customer    Fresh    Edit
    SMM_Keywords.Check For Updating Customer Details Permissions

Check the approval process of customer registration by departmental user
    [Documentation]    Done
    [Tags]  approval  Himself  himself8
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Filter Plants By Status  pending
    sleep  2s
    SMM_Keywords.View Selected Plant Details  ${Branch["Name"]}
    Sleep  2s
    SMM_Keywords.Approve Selected Plant
    Sleep  3s
    BrowserControl.Switch To    Customer
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Registration
    SMM_Keywords.Check for Approved state of Customer Registration

Check the edit process of customer details when customer is approved by department
    [Documentation]    Done
    [Tags]  customerapproved  Himself  himself9
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Customer Registration
    SMM_Keywords.Check For Updating Customer Details Permissions

#Check the TCS rate applicable according to customer-wise
#    [Documentation]    Done
#    [Tags]  TCS  Himself  himself10
#    BrowserControl.Switch To    Customer
#    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
#    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
#    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
#    Sleep    2s
#    Input Select    ${Key Description["User Type"]["Locator"]}    Purchaser
#    Sleep    2s
#    Press Keys    ${Key Description["User Type"]["Locator"]}    TAB
#    Element Should Be Disabled    ${Key Description["TCS Rate"]["Locator"]}
