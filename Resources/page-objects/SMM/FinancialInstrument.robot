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
