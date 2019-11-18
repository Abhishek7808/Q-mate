*** Settings ***
Test Teardown     Go To Base State
Resource          ${CURDIR}${/}Keywords${/}browser.robot
Resource          ${CURDIR}${/}Keywords${/}Fields${/}Field.robot
Resource          ${CURDIR}${/}Keywords${/}Department${/}Department.robot
Resource          ${CURDIR}${/}Keywords${/}Customer${/}Customer.robot
Resource          ${CURDIR}${/}Keywords${/}Verify${/}Verify.robot
Library           SeleniumLibrary
Library           RequestsLibrary

*** Test Cases ***
To check the process of customer account creation from Marketing Team Member as Proxy
    [Documentation]    Registers a Company with its Branch by Marketing Team Member at Department Side
    Delete Data Of Company    ${Test Data["${CONFIG["Company Department 1"]}"]["Enter PAN"]}
    set test variables    Company=Company Department 1    Branch=Branch Department 1
    Switch To    Department
    Go To Add Customer From Department
    Company Registration By Department    New Company
    Switch To    Verify
    Verify Add Customer from Department

To check that MTM completes registration process when customer has partially filled the application
    [Documentation]    Completes the registration by Marketing Team Member when the application is in draft mode
    Switch To    Customer
    set test variables    Company=Company Department 1    Branch=Branch Department 2    SSO ID=SSOID 3
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    5s    250ms    Select Purchaser
    Company Registration By Customer    New    Draft
    Switch To    Department
    Go To Customer List
    Apply Filter    1
    View Company Details
    Company Registration By Department    Draft
    Switch To    Verify
    Verify Add Customer from Department

To check the process of Linking email/sso id to customer account
    [Documentation]    Marketing Team Member links an account to a SSOID
    set test variables    Company=Company Department 1    Branch=Branch Department 3    SSO ID=SSOID 3
    Switch To    Department
    Go To Add Customer From Department
    Company Registration By Department    New Branch
    Sleep    3s
    View Customer List
    Apply Filter    4
    View Company Details
    Input Valid Value    Customer Details Member List Button
    Member List By Department
    View Customer List
    Apply Filter    4
    Switch To    Verify
    Verify Add Customer From Department

To check the process of edit function when customer registration is in draft mode
    [Documentation]    Edits the information given by the user when the application is in draft mode
    set test variables    Company=Company Department 1    Branch=Branch Department 4    Plant=Plant 1    SSO ID=SSOID 3
    Switch To    Customer
    Login From Customer    ${SSO ID["SSOID"]}
    Select Customer
    Company Registration By Customer    New    Draft
    Switch To    Department
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
    set test variables    Company=Company Department 1    Branch=Branch Department 5    SSO ID=SSOID 3
    Switch To    Department
    Go To Add Customer From Department
    Company Registration By Department    New Branch
    Switch To    Verify
    Verify Add Customer from Department

Check the branch registration when user selects branch from an existing registered branches in a company
    [Documentation]    Selects an existing branch of a company
    set test variables    Company=Company Department 1    Branch=Branch Department 1
    Switch To    Department
    Go To Add Customer From Department
    Company Registration By Department    Existing
    Switch To    Verify
    Verify Add Customer from Department

To check the customer login when SSO Id not linked with customer account
    [Tags]    Skip

Check customer registration through a process of link invitation
    [Tags]    Skip

To check the process of edit function when customer registered by MTM as proxy in approved mode
    [Tags]    Skip

To check the process of edit function when customer registered by MTM as proxy in approved mode
    [Tags]    Skip
