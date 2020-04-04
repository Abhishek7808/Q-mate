*** Keywords ***
Edit Agent Name
    [Documentation]  Takes name as argument and edits agent name.
    [Arguments]  ${newName}
    Wait Until Keyword Succeeds    5s    200ms    Clear Text Value    agentName
    Wait Until Keyword Succeeds    5s    200ms    Input Text Value    agentName    ${newName}
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnSaveUpdate

Fill Agent
    [Documentation]  Fills details into agents details form.
    Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
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
    run keyword and ignore error  Input Valid Value    Add Agent Button
    ${message}  Handle Alert
    run keyword if  '${message}' == 'Agent Plant Relation is already exists'  click button  btnCancelModel
    #run keyword and ignore error  Input Valid Value    Add Agent Button
    #run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Add Agent Button have not appeared