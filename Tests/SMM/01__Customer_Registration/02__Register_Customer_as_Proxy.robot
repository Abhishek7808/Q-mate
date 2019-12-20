*** Settings ***
Test Teardown     Go To Base State
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
Library           SeleniumLibrary
Library           RequestsLibrary

#robot -d Results Tests/SMM/01__Customer_Registration/02__Register_Customer_as_Proxy.robot
*** Test Cases ***
To check the process of Linking email/sso id to customer account
    [Documentation]    Marketing Team Member links an account to a SSOID
    [Tags]  proxy  Linkingemail
    set test variables    Company=Company Department 1    Branch=Branch Department 1    SSO ID=SSOID 3
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Add Customer From Department
    Company Registration By Department    New Branch
    Sleep    3s
    View Customer List
    Apply Filter    4
    sleep  2s
    input text  uncontrolled  ${Branch["Name"]}
    View Company Details
    Input Valid Value    Customer Details Member List Button
    sleep  3s
    ${status}  run keyword and return status  page should contain element  //button[@id='btnView']
    run keyword if  ${status} == ${True}  click element  //button[@id='btnView']
    Member List By Department
    View Customer List
    Apply Filter    4
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Verify Add Customer From Department

To check the process of customer account creation from Marketing Team Member as Proxy
    [Documentation]    Registers a Company with its Branch by Marketing Team Member at Department Side
    [Tags]  proxy  byMTM
    Delete Data Of Company    ${Test Data["${CONFIG["Company Department 1"]}"]["Enter PAN"]}
    set test variables    Company=Company Department 1    Branch=Branch Department 1
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Add Customer From Department
    Company Registration By Department    New Company
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Verify Add Customer from Department

To check that MTM completes registration process when customer has partially filled the application
    [Documentation]    Completes the registration by Marketing Team Member when the application is in draft mode
    [Tags]  proxy  MTMpartially
    Switch To    Customer
    set test variables    Company=Company Department 1    Branch=Branch Department 2    SSO ID=SSOID 3
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    #Wait Until Keyword Succeeds    5s    250ms    Select Purchaser
    Company Registration By Customer    New    Draft
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Customer List
    Apply Filter    1
    View Company Details
    Company Registration By Department    Draft
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Verify Add Customer from Department



To check the process of edit function when customer registration is in draft mode
    [Documentation]    Edits the information given by the user when the application is in draft mode
    [Tags]  proxy  draft
    set test variables    Company=Company Department 1    Branch=Branch Department 4    Plant=Plant 1    SSO ID=SSOID 3
    Switch To    Customer
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Company Registration By Customer    New    Draft
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Customer List
    Apply Filter    1
    View Company Details
    Company Registration By Department    Draft
    Go To Member List
    Member List By Department
    Go To Plant List
    Fill Plants By Department

Check new branch registration when the company already have branches registered in it
    [Documentation]    Creates a new branch of a company when it already has new branches
    [Tags]  proxy  alreadybranch
    set test variables    Company=Company Department 1    Branch=Branch Department 5    SSO ID=SSOID 3
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Add Customer From Department
    Company Registration By Department    New Branch
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Verify Add Customer from Department

Check the branch registration when user selects branch from an existing registered branches in a company
    [Documentation]    Selects an existing branch of a company
    [Tags]  proxy  user
    set test variables    Company=Company Department 1    Branch=Branch Department 1
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Add Customer From Department
    Company Registration By Department    Existing
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Verify Add Customer from Department

#To check the customer login when SSO Id not linked with customer account
#    [Tags]    Skip
#
#Check customer registration through a process of link invitation
#    [Tags]    Skip
#
#To check the process of edit function when customer registered by MTM as proxy in approved mode
#    [Tags]    Skip
#
#To check the process of edit function when customer registered by MTM as proxy in approved mode
#    [Tags]    Skip
                                                                                                                                                                                             