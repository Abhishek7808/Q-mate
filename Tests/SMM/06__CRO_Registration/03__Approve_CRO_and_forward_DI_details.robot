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
Approve and Forward DI
    [Documentation]    Approves the CRO so forwarded and again forwards it to Sales Executive
    [Tags]  forward  forward1
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    Go To CRO List
    Sleep    1s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    663
    Click Button    btnApplyFillter
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Forward to SE Button
    Wait Until Keyword Succeeds    5s    500ms    click button  btnSE
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order View List Button
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To CRO List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    663
    Click Button    btnApplyFillter
    Sleep    5s
    Page Should Not Contain Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']

Check CRO request approval process when both the approvals(CRO request & DI) done at 2nd level only
    [Documentation]    Approves the pending CRO by forwarding it to ME, Selecting the dispatch point, expiry date and then forwrding to Sales Executive
    [Tags]  forward  forward2
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 2
    Go To CRO List
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Forward to ME Button
    Sleep    2s
    #Wait Until Keyword Succeeds    10s    500ms  click button  btndispatchforward
    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Input Valid Value    Contract Release Order Next Button
    Input Valid Value    Contract Release Order Expiry Date    ${CRO["Expiry Date"]}
    Input Valid Value    Contract Release Order Forward To Marketing Executive Button
    Sleep    5s
    Input Valid Value    Contract Release Order Forward to SE Button
    Wait Until Keyword Succeeds    5s    500ms    click button  btnSE

View DI request and Reject DI request
    [Documentation]    Views and then rejects the DI request
    [Tags]  forward  forward3
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 2    Branch=Branch Department 1    CRO=CRO 1
    Go To CRO List
    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']

View CRO request and Reject CRO request
    [Documentation]    Views and then rejects a CRO with an appropriate message
    [Tags]  forward  forward4
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 2
    Go To CRO List
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Reject Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Reject Remarks    ${CRO["Reject Remarks"]}
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Reject Remarks Submit Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order View List Button
    Sleep    1s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    663
    Click Button    btnApplyFillter
    Sleep    5s
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To CRO List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    5
    Click Button    btnApplyFillter
    Sleep    5s
    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
