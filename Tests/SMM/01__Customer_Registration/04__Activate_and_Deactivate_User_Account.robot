*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot

# robot -d Results Tests/SMM/01__Customer_Registration/04__Activate_and_Deactivate_User_Account.robot

*** Test Cases ***

Check the process of User Account Deactivation
    [Documentation]    Deactivates an application submitted by the user
    [Tags]  deactivationuser  Account  Account1
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 1
    Go To Customer List
    Apply Filter    4
    sleep  1s
    View Company Details
    Input Valid Value    Customer Details Deactive Button
    Sleep    2s
    Input Valid Value    View Customer List
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Not Contain    ${Branch["Name"]}

Check the process of User Account Activation
    [Documentation]    Activates an application submitted by the user
    [Tags]  activationuser  Account  Account2
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 1
    Go To Customer List
    Apply Filter    667     #Deactivated
    sleep  2s
    View Company Details
    Input Valid Value    Customer Details Active Button
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]

Check the process of User Account Activation when requested by MTM
    [Documentation]    Activates an application submitted by the user
    [Tags]    accountactivation  Account  Account3
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 2    Branch=Branch Department 2
    Go To Customer List
    Apply Filter    4
    sleep  2s
    View Company Details
    Input Valid Value    Customer Details Deactive Button
    Input Valid Value    View Customer List
    Apply Filter    667
    sleep  3s
    View Company Details
    Input Valid Value    Customer Details Active Button
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]

#Check login after customer account deactivation
#    [Tags]    Skip
