*** Settings ***


*** Keywords ***
Add Agent
    [Documentation]  Clicks on add agent button.
    Click Button    btnAddAgentPo

Fill Agent Details
    [Documentation]  Fills details into agent details form.
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

Fill Purchase Order Form
    [Documentation]  Fills details into purchase order form.
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
    [Documentation]  Takes agent name as argument and verifies that it is visible on the page.
    [Arguments]   ${agentName}
    Element Should Be Visible    //span[contains(text(),'${agentName}')]

Switch To CRO List
    [Documentation]  Clicks on CRO list tab.
    click element  //span[contains(text(),'CRO List')]

Request CRO
    [Documentation]  Clicks on request cro button.
    click element  //button[@id='btnRequestCRO']

Check For Approval Of Purchase Order From Customer
    [Documentation]  Verifies that current page contains "Approved" tag.
    Page should Contain Element    //button/span[text()='Approved']

Edit Purchase Order
    [Documentation]  Edits details of purchase order.
    Click Button    btnEditPo
    Input Text    newPoQuantity    4500
    Input Text    newPinCode    313002
    Input Search Agent    react-select-2-input    YUVRAJ SINGH CHAUHAN
    Click Button    btnSubmitChangeReq
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[text()='Update History']
    Sleep    2s
    Page Should Contain Element    //td/i[contains(text(),'visibility')]

