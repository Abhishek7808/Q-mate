*** Settings ***


*** Test Cases ***


*** Keywords ***
Fill Purchase Order Form By Department
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Purchase Order Enter Customer PAN or Name    ${Val}
    Input Valid Value    Purchase Order Purchasing for Self Use    ${Branch["User Type"]}
    Input Valid Value    Purchase Order Branch Name    ${Branch["Name"]}
    Input Valid Value    Purchase Order Pincode    ${Branch["Pincode"]}
    Input Valid Value    Purchase Order State    ${Branch["State"]}
    Input Valid Value    Purchase Order City    ${Branch["City"]}
    Input Valid Value    Purchase Order Address Line 1    ${Branch["Address Line 1"]}
    Input Valid Value    Purchase Order Address Line 2    ${Branch["Address Line 2"]}
    ${Status}    Run Keyword And Return Status    Should Be Equal    ${PO["Coming Against Auction"]}    Select
    Input Valid Value    Purchase Order Coming Against Auction    ${PO["Coming Against Auction"]}
    Input Valid Value    Purchase Order Unit Name    ${PO["Unit Name"]}
    Input Valid Value    Purchase Order Select Product    ${PO["Select Product"]}
    Input Valid Value    Purchase Order PO Quantity(MT)    ${PO["PO Quantity"]}
    Input Valid Value    Purchase Order Preferred Mode of Payment    ${PO["Preferred Mode of Payment"]}
    Input Valid Value    Purchase Order Expiry Date    ${PO["Expiry Date"]}
    Run Keyword If    ${Status}    Input Valid value    Purchase Order BID Number    ${PO["BID Number"]}
    Run Keyword If    ${Status}    Input Valid Value    Purchase Order Product Price    ${PO["Product Price"]}
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Destination Pincode    ${PO["Destination Pincode"]}
    Input Valid Value    Purchase Order Destination City    ${PO["Destination City"]}
    Input Valid Value    Purchase Order Destination State    ${PO["Destination State"]}
    #Input Valid Value    Add Agent Button
    #Sleep    2s
    #Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
    #Sleep    1s
    #Input Valid Value    Add Agent Agent Name    ${SSO ID["Name"]}
    #Input Valid Value    Add Agent Validity Date    ${SSO ID["Validity Date"]}
    #Input Valid Value    Add Agent Pincode    ${SSO ID["Pincode"]}
    #Input Valid Value    Add Agent City    ${SSO ID["City"]}
    #Input Valid Value    Add Agent State    ${SSO ID["State"]}
    #Input Valid Value    Add Agent Address    ${SSO ID["Address"]}
    #Input Valid Value    Add Agent Mobile Number    ${SSO ID["Mobile Number"]}
    #Input Valid Value    Add Agent Telephone Number (Office)    ${SSO ID["Alternate Mobile Number"]}
    #Input Valid Value    Add Agent Alternate Number    ${SSO ID["Alternate Mobile Number"]}
    #Input Valid Value    Add Agent Fax    ${SSO ID["Fax"]}
    #Input Valid Value    Add Agent Email    ${SSO ID["Email ID"]}
    #Input Valid Value    Add Agent Save Button
    Wait Until Keyword Succeeds    5s    250ms    Input Search Agent    react-select-2-input    ${SSO ID["Name"]}
    Wait Until Keyword Succeeds    5s    250ms    Input Valid Value    Purchase Order Submit Button

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

Update PO By Department
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Unit Name    ${PO["Unit Name"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Unit Name is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Select Product    ${PO["Select Product"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Select Product is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order PO Quantity(MT)    ${PO["PO Quantity"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  PO Quantity is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Preferred Mode of Payment    ${PO["Preferred Mode of Payment"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Preferred Mode of Payment is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Document Upload is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Destination Pincode    ${PO["Destination Pincode"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Destination Pincode is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Destination City    ${PO["Destination City"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Destination City is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Destination State    ${PO["Destination State"]}
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Destination State is not editable
    ${status}  run keyword and return status  Input Valid Value    Purchase Order Update Button
    log  ${status}
    #run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  element is not editable

Reject Purchase Order
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Reject Button
    Input Valid Value    Purchase Order Reject Remarks    ${PO["Reject Remarks"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button