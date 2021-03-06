*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
Library           SeleniumLibrary
Library           RequestsLibrary

#robot -d Results Tests/SMM/01__Customer_Registration/02__Register_Customer_as_Proxy.robot
*** Test Cases ***
To check the process of Linking email/sso id to customer account
    [Documentation]    Marketing Team Member links an account to a SSOID
    [Tags]  SMM  customerregistration  registrationbydepartment  linkingssoid
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1    SSO ID=SSOID 3
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Add Customer From Department
    SMM_Keywords.Company Registration By Department    New Branch
    Sleep  3s
    SMM_Keywords.Open Customer List
    SMM_Keywords.Filter Plants By Status  Approved
    sleep  2s
    SMM_Keywords.View Details Of Selected Plant   ${Branch["Name"]}
    SMM_Keywords.Open Member List
    sleep  3s
    SMM_Keywords.Add Member From Department
    SMM_Keywords.Open Customer List
    SMM_Keywords.Filter Plants By Status  Approved
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Registered  ${Branch["Name"]}

To check the process of customer account creation from Marketing Team Member as Proxy
    [Documentation]    Registers a Company with its Branch by Marketing Team Member at Department Side
    [Tags]  SMM  customerregistration  registrationbydepartment  accountcreation
    #Delete Data Of Company    ${Test Data["${CONFIG["Company Department 1"]}"]["Enter PAN"]}
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1
    Delete_Data.Delete All The Prewritten Data Of Company From ERP    ${Company["Enter PAN"]}
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Add Customer From Department
    SMM_Keywords.Company Registration By Department    New Company
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Registered  ${Branch["Name"]}

To check that MTM completes registration process when customer has partially filled the application
    [Documentation]    Completes the registration by Marketing Team Member when the application is in draft mode
    [Tags]  SMM  customerregistration  registrationbydepartment  partiallyfilled
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 2    SSO ID=SSOID 3
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer Type  purchaser
    SMM_Keywords.Company Registration By Customer    New    Draft
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Filter Plants By Status  Draft
    SMM_Keywords.View Details Of Selected Plant   ${Branch["Name"]}
    SMM_Keywords.Company Registration By Department    Draft
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Registered  ${Branch["Name"]}

To check the process of edit function when customer registration is in draft mode
    [Documentation]    Edits the information given by the user when the application is in draft mode
    [Tags]  SMM  customerregistration  registrationbydepartment  editdraft
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 4    Plant=Plant 1    SSO ID=SSOID 3
    BrowserControl.Switch To    Customer
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  SMM_Keywords.Select Customer Type  purchaser
    run keyword and ignore error  SMM_Keywords.Create New User Account  customer
    SMM_Keywords.Company Registration By Customer    New    Draft
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Filter Plants By Status  Draft
    SMM_Keywords.View Details Of Selected Plant   ${Branch["Name"]}
    SMM_Keywords.Company Registration By Department    Draft
    SMM_Keywords.Open Member List
    sleep  3s
    SMM_Keywords.Add Member From Department
    SMM_Keywords.Open Plant Details
    SMM_Keywords.Add Plant Details From Department

Check new branch registration from department when the company already have branches registered in it
    [Documentation]    Creates a new branch of a company when it already has new branches
    [Tags]  SMM  customerregistration  registrationbydepartment  newbranch
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 5    SSO ID=SSOID 3
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Add Customer From Department
    SMM_Keywords.Company Registration By Department    New Branch
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Registered  ${Branch["Name"]}

Check the branch registration when user selects branch from an existing registered branches in a company
    [Documentation]    Selects an existing branch of a company
    [Tags]  SMM  customerregistration  registrationbydepartment  existingbranch
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Add Customer From Department
    SMM_Keywords.Company Registration By Department    Existing
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Registered  ${Branch["Name"]}

#To check the customer login when SSO Id not linked with customer account
#    [Tags]  SMM  customerregistration  registrationbydepartment      Skip
#
#Check customer registration through a process of link invitation
#    [Tags]  SMM  customerregistration  registrationbydepartment      Skip
#
#To check the process of edit function when customer registered by MTM as proxy in approved mode
#    [Tags]  SMM  customerregistration  registrationbydepartment      Skip
#
#To check the process of edit function when customer registered by MTM as proxy in approved mode
#    [Tags]  SMM  customerregistration  registrationbydepartment      Skip
                                                                                                                                                                                             