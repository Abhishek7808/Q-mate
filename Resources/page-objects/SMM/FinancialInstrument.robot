*** Settings ***


*** Variables ***
${FiListLink}    SMM/Finance/InstrumentList

*** Keywords ***
Go To Financial Instrument List Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${FiListLink}

Apply Financial Instrument Filter
    [Arguments]  ${instrumentType}
    Click Element    dropdownOpen
    Run Keyword If    '${instrumentType}'=='Letter of Credit (LC)'    Select From List By Label    instrumentType    Letter of Credit (LC)
    ...    ELSE    Select From List By Label    instrumentType    Bank Guarantee (BG)
    Click Button    btnApply

Open Financial Instrument By Branch Name
    [Arguments]  ${branchName}
    Sleep    3s
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[contains(text(),'${branchName}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Run Keyword If    '${Status}'=='False'    Click Button    Next
    Sleep    2s
    Click Element    //span[contains(text(),'${branchName}')]/../following-sibling::td/i[contains(text(),'visibility')]

Approve Financial Instrument
    Sleep    3s
    Click Button    action-Approve
    Sleep    2s

Check For Presence Of Update Button
    ${status}  run keyword and return status  Page Should Not Contain Button    btnUpdate
    log  ${status}

Search Financial Instrument
    [Arguments]  ${fiNumber}
    Input Valid Value    Search Financial Instrument By Number    ${fiNumber}

Open Financial Instrument By FI Number
    [Arguments]  ${fiNumber}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${fiNumber}')]/../following-sibling::td/i[@title='View']

#Open Approved Financial Instrument By FI Number
#    [Arguments]  ${fiNumber}
#    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${fiNumber}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']

Check For Approved State Of Financial Instruments
    [Arguments]  ${fiNumber}
    Element Should Be Visible    //*[contains(text(),'${fiNumber}')]/../following-sibling::td/button/span[contains(text(),'Approved')]

Reject Financial Instrument
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Pending')]/../../following-sibling::td/i[@title='View']
    Input Valid Value    Financial Instrument Reject Button
    Sleep    2s

Check For Financial Instrument Is Rejected
    [Arguments]  ${fiNumber}
    Element Should Be Visible    //span[contains(text(),'${fiNumber}')]/../following-sibling::td/button/span[contains(text(),'Rejected')]

Print FI
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    Input Valid Value    Financial Instrument Print Button
    Sleep    5s

Open Financial Instrument By FI Number For Selected Branch
    [Arguments]  ${fiNumber}  ${branchName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${branchName}')]/../preceding-sibling::td//span[contains(text(),'${fiNumber}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']

Approve Transfer Request
    [Arguments]  ${branchName}  ${fiAmount}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Transfer${SPACE}History')]
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${fiAmount}')]/../preceding-sibling::td//span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'Pending')]/../../following-sibling::td/i[contains(@title,'Edit')]
    Wait Until Keyword Succeeds    5s    200ms    Click Button    actionName-Approve
    Element Should Be Visible    //span[contains(text(),'${fiAmount}')]/../preceding-sibling::td//span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'Approved')]

Approve Transfer Request
    [Arguments]  ${branchName}  ${fiAmount}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Transfer${SPACE}History')]
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${fiAmount}')]/../preceding-sibling::td//span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'Pending')]/../../following-sibling::td/i[contains(@title,'Edit')]
    Wait Until Keyword Succeeds    5s    200ms    Click Button    Transfer Financial Instrument Reject Button
    Element Should Be Visible    //span[contains(text(),'${fiAmount}')]/../preceding-sibling::td//span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'Pending')]

Open Financial Instrument From Department
    [Arguments]  ${branchName}  ${fiNumber}  ${validityDate}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${branchName}')]/../preceding-sibling::td//span[contains(text(),'${fiNumber}')]/../following-sibling::td[contains(text(),'${validityDate["Date"]}-${validityDate["Month"]}-${validityDate["Year"]}')]/following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']