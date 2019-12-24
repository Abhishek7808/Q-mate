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

Enter Customer PAN
    [Arguments]  ${panNo}  ${branchName}
    &{Val}    Create Dictionary    Input=${panNo}    Search=${branchName} (${panNo})
    Input Valid Value    Purchase Order Enter Customer PAN or Name    ${Val}

Add Agent
    Click Button    btnAddAgentPo

Fill Agent REgistration Form By Department
    Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
    sleep  2s
    Input Valid Value    Add Agent Agent Name    ${SSO ID["Name"]}
    Input Valid Value    Add Agent Validity Date    ${SSO ID["Validity Date"]}
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    agentModalPinCode
    Run Keyword Unless    ${Status}    Input Valid Value    Add Agent Pincode    ${SSO ID["Pincode"]}
    Input Valid Value    Add Agent City    ${SSO ID["City"]}
    Input Valid Value    Add Agent State    ${SSO ID["State"]}
    Input Valid Value    Add Agent Address    ${SSO ID["Address"]}
    Input Valid Value    Add Agent Mobile Number    ${SSO ID["Mobile Number"]}
    #Input Valid Value    Add Agent Telephone Number
    Input Valid Value    Add Agent Alternate Number    ${SSO ID["Alternate Mobile Number"]}
    Input Valid Value    Add Agent Fax    ${SSO ID["Fax"]}
    Input Valid Value    Add Agent Email    ${SSO ID["Email ID"]}
    Input Valid Value    Add Agent Save Button
    ${message}  Handle Alert
    run keyword if  '${message}' == 'Agent Plant Relation is already exists'  click button  btnCancelModel

Select Agent From Registered Agents
    [Arguments]  ${agentName}
    input text  react-select-2-input  ${agentName}
    Press Key    react-select-2-input    \\13

Submit Form
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Submit Button