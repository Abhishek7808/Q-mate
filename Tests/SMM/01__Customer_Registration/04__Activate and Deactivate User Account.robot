*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ${CURDIR}${/}Keywords${/}browser.robot

*** Test Cases ***
Check the process of User Account Deactivation
    [Documentation]    Deactivates an application submitted by the user
    Switch To    Department
    set test variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1
    Go To Customer List
    Apply Filter    4
    View Company Details
    Input Valid Value    Customer Details Deactive Button
    Sleep    2s
    Input Valid Value    View Customer List
    Switch To    Verify
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Not Contain    ${Branch["Name"]}

Check the process of User Account Activation
    [Documentation]    Activates an application submitted by the user
    Switch To    Department
    set test variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1
    Go To Customer List
    Apply Filter    667
    View Company Details
    Input Valid Value    Customer Details Active Button
    Switch To    Verify
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //td[contains(text(),'${Branch["Name"]},${Company["Company Name"]}')]

Check the process of User Account Activation when requested by MTM
    [Documentation]    Activates an application submitted by the user
    [Tags]    Skip
    Switch To    Department
    set test variables    Company=Company Department 1    Branch=Branch Department 3
    Go To Customer List
    Apply Filter    4
    View Company Details
    Input Valid Value    Customer Details Deactive Button
    Input Valid Value    View Customer List
    Apply Filter    667
    View Company Details
    Input Valid Value    Customer Details Active Button
    Switch To    Verify
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //td[contains(text(),'${Branch["Name"]},${Company["Company Name"]}')]

Check login after customer account deactivation
    [Tags]    Skip
