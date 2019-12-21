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
Approve DI Requests
    [Documentation]    Approves the DI request
    [Tags]  approvecrofin  approvecrofin1
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 1
    Go To CRO List
    Sleep    1s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    662
    Click Button    btnApplyFillter
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Approve Button
    reload page
    sleep  4s
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order View List Button
    Sleep    5s
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To CRO List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    4
    Click Button    btnApplyFillter
    Sleep    3s
    Page Should Contain Element   //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    ${CRO Number}    Get Text    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../preceding-sibling::td//span[contains(text(),'CRO')]
    Set Global Variable    ${CRO Number}    ${CRO Number}

Check CRO request approval process when all the approvals(CRO request & DI) done at 3rd level only
    [Documentation]    Approves a CRO request by forwarding it to Marketing Executive, Dispatch point and expiry date and then to SE
    [Tags]  approvecrofin  approvecrofin2
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 3
    Go To CRO List
    Sleep    5s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    41
    Click Button    btnApplyFillter
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Forward to ME Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Input Valid Value    Contract Release Order Next Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Forward To Marketing Executive Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Forward to SE Button
    Wait Until Keyword Succeeds    5s    500ms    click button  btnSE
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Approve Button
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To CRO List
    Sleep    5s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    4
    Click Button    btnApplyFillter
    ${CRO Number 1}    Wait Until Keyword Succeeds    5s    500ms    Get Text    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../preceding-sibling::td//span[contains(text(),'CRO')]
    Set Global Variable    ${CRO Number 1}    ${CRO Number 1}

Reject DI Request
    [Documentation]    Rejects a CRO request with appropriate remarks
    [Tags]  approvecrofin  approvecrofin3
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 2
    Go To CRO List
    Sleep    5s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    41
    Click Button    btnApplyFillter
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Reject Button
    Sleep    1s
    Input Valid Value    Contract Release Order Reject Remarks    ${CRO["Reject Remarks"]}
    Input Valid Value    Contract Release Order Reject Remarks Submit Button

Reject CRO Request
    [Documentation]    Rejects a CRO request with appropriate remarks
    [Tags]  approvecrofin  approvecrofin4
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    CRO=CRO 3
    Go To CRO List
    Sleep    5s
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus    41
    Click Button    btnApplyFillter
    Wait Until keyword Succeeds    5s    250ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../following-sibling::td/i[@title='View']
    Input Valid Value    Contract Release Order Reject Button
    Sleep    1s
    Input Valid Value    Contract Release Order Reject Remarks    ${CRO["Reject Remarks"]}
    Input Valid Value    Contract Release Order Reject Remarks Submit Button
