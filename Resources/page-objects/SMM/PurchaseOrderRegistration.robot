*** Settings ***


*** Test Cases ***


*** Keywords ***
Approve Purchase Order
    ${Status}    Run Keyword And Return Status    Page Should Not Contain Button    btnactionApprove
    Run Keyword If    ${Status}    Wait Until Keyword Succeeds    5s    100ms    Click Element    //span[contains(text(),'Company Details')]
    Run Keyword If    ${Status}    Sleep    3s
    Run Keyword If    ${Status}    Wait Until Keyword Succeeds    5s    100ms    Click Element    //button[@id='btnactionApprove']
    Run Keyword If    ${Status}    Sleep    3s
    Run Keyword If    ${Status}    Wait Until Keyword Succeeds    5s    100ms    Click Element    //span[contains(text(),'PO Detail')]
    Run Keyword If    ${Status}    Sleep    1s
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    outlined-button-file-agreementFileObject
    Run Keyword If    ${Status}    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Wait Until Keyword Succeeds    5s    100ms    Click Button    //button[@id='btnactionApprove']
    Sleep    2s
    Click Button    //button[@id='btnconfirmVerify']