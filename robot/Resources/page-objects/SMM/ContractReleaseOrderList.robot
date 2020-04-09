*** Variables ***
${pageUrl}  SMM/ContractReleaseOrder

*** Keywords ***
Go To Contract Release Order List Page
    [Documentation]  Opens CRO list page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Open CRO
    [Documentation] Takes agent name, branch name and required quantity as argument and opens CRO details correspoding to it.
    [Arguments]  ${agentName}  ${branchName}  ${quantityReq}
    run keyword if  ${agentName} != None  Click Element  //span[contains(text(),'${agentName}')]/../${viewString}
    run keyword if  ${branchName} != None  Click Element  //span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'${quantityReq}')]/../${viewString}

Apply Filter By Status
    [Documentation]  Takes CRO status as argument and selects filter according to it.
    [Arguments]  ${croStatus}
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    poStatus   ${croStatus}
    Click Button    btnApplyFillter

Fetch CRO Number
    [Documentation]  Takes branch name and required quantity as argument and fetches CRO number corresponding to it.
    [Arguments]  ${branchName}  ${quantityReq}
    ${CRO Number}    Get Text    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'${CRO["Product Quantity Required"]}')]/../preceding-sibling::td//span[contains(text(),'CRO')]
    Set Global Variable    ${CRO Number}    ${CRO Number}
    return from keyword   ${CRO Number}
