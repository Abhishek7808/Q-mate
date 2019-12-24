*** Settings ***


*** Test Cases ***

*** Keywords ***
Add Agent
    Click Button    btnAddAgentPo

Fill Agent Details
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

Fill Purchase Order Details
    ${Status}    Run Keyword And Return Status    Should Be Equal    ${PO["Coming Against Auction"]}    Select
    sleep  2s
    Input Valid Value    Purchase Order Coming Against Auction    ${PO["Coming Against Auction"]}
    sleep  2s
    Input Valid Value    Purchase Order Unit Name    ${PO["Unit Name"]}
    Input Valid Value    Purchase Order Select Product    ${PO["Select Product"]}
    Input Valid Value    Purchase Order PO Quantity    ${PO["PO Quantity"]}
    Input Valid Value    Purchase Order Preferred Mode of Payment    ${PO["Preferred Mode of Payment"]}
    #Input Valid Value    Purchase Order Expiry Date    ${testData["Purchase Order 1"]["Expiry Date"]}
    Run Keyword If    ${Status}    Input Valid value    Purchase Order BID Number    ${PO["BID Number"]}
    Run Keyword If    ${Status}    Input Valid Value    Purchase Order Product Price    ${PO["Product Price"]}
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Pincode    ${PO["Destination Pincode"]}
    Input Valid Value    Purchase Order City    ${PO["Destination City"]}
    Input Valid Value    Purchase Order State    ${PO["Destination State"]}
    #click button  btnAddAgentPo
    #Fill Agent
    input text  react-select-2-input  ${SSO ID["Name"]}
    Press Key    react-select-2-input    \\13
    #Input Valid Value    Purchase Order Agent  ${SSO ID["Name"]}
    Input Valid Value    Purchase Order Submit Button

Check For Agent Name In Purchase Order Form
    [Arguments]   ${agentName}
    Element Should Be Visible    //span[contains(text(),'${agentName}')]