*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
Check CRO request approval process
    [Documentation]    Approves CRO request by Forwarding it to ME, Selecting Dispatch Point, Expiry Date, and forwarding it to ME Executive
    [Tags]  croapproval  croapproval1
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    Go To CRO List
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Forward to ME Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Next Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Expiry Date    ${CRO["Expiry Date"]}
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Forward To Marketing Executive Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order View List Button
    Login From Department    megha.rsmml    admin
    Go To CRO List
    Sleep    1s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    663
    Click Button    btnApplyFillter
    Wait Until Keyword Succeeds    10s    500ms    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']

Check CRO request rejection process
    [Documentation]    Reject a CRO request with a rejection message
    [Tags]  croapproval  croapproval2
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    Go To CRO List
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Reject Button    rejectRemarks
    Input Valid Value    Contract Release Order Reject Remarks    ${CRO["Reject Remarks"]}
    Input Valid Value    Contract Release Order Reject Remarks Submit Button

Check that CRO validity date cannot exceed the validity of financial instrument
    [Documentation]    Checks whether CRO validity exceeds FI validity date
    [Tags]  croapproval  croapproval3
    #This keyword is not to be run as this functionality has not been made so far
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Set Test Variables    Company=Company Department 2    Branch=Branch Department 1    CRO=CRO 1
    Go To CRO List
    Sleep    1s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    41
    Click Button    btnApplyFillter
    #//span[contains(text(),'Approved')]/../../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'Pending')]/../../preceding-sibling::td//span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Forward to ME Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Next Button
    Wait Until Keyword Succeeds    10s    500ms    Input Valid Value    Contract Release Order Expiry Date    ${CRO["Expiry Date"]}
    Wait Until Keyword Succeeds    10s    500ms  click button  btndispatchforward
    Sleep    5s
