*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}Fields${/}Field.robot

*** Keywords ***
#Company Registration By Customer
#    [Arguments]    ${Branch Creation}    ${Mode}
#    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Type"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Name"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Pincode"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Address Line 1"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Address Line 2"]}    Type=Disabled
#    ${Value}    Set Variable    Disabled
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Type"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Name"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Pincode"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Address Line 1"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Address Line 2"]}    Type=Disabled
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Name"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Pincode"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Address Line 1"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Address Line 2"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["GSTIN"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["TIN"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["IBM"]}    Type=${Value}
#    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["IBM Registration Date"]}    Type=${Value}
#    #Log    ${Key Description}
#    Input Valid Value    User Type    ${Branch["User Type"]}
#    Run Keyword If    '${Branch["User Type"]}'=='Traders'    Input Valid Value    TCS Rate    ${Branch["TCS Rate"]}
#    Input Valid Value    Enter PAN    ${Company["Enter PAN"]}
#    Sleep    1s
#    #
#    ${status}  run keyword and return status  page should contain  Create New Branch?
#    run keyword if  ${status} == ${True} and '${Branch Creation}'!='New'  click button  btnCancel
#    Run Keyword If  ${status} == ${True} and '${Branch Creation}'=='New'    Input Valid Value    Create New Branch Button
#    Run Keyword If    '${Branch Creation}'=='Existing'    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}')]
#    run keyword and ignore error  Input Valid Value    Company Type    ${Company["Company Type"]}
#    run keyword and ignore error  Input Valid Value    Company Name    ${Company["Company Name"]}
#    run keyword and ignore error  Input Valid Value    Company Pincode    ${Company["Company Pincode"]}
#    run keyword and ignore error  Input Valid Value    Company Address Line 1    ${Company["Company Address Line 1"]}
#    run keyword and ignore error  Input Valid Value    Company Address Line 2    ${Company["Company Address Line 2"]}
#    run keyword and ignore error  Input Valid Value    Company City    ${Company["Company City"]}
#    run keyword and ignore error  Input Valid Value    Company State    ${Company["Company State"]}
#    #run keyword and ignore error  click element  //*[@id="btnCancel"]/span[1]
#    Input Valid Value    Branch Name    ${Branch["Name"]}
#    Input Valid Value    Branch Pincode    ${Branch["Pincode"]}
#    Input Valid Value    Branch State    ${Branch["State"]}
#    Input Valid Value    Branch City    ${Branch["City"]}
#    Input Valid Value    Branch Address Line 1    ${Branch["Address Line 1"]}
#    Input Valid Value    Branch Address Line 2    ${Branch["Address Line 2"]}
#    Run Keyword If    '${Mode}'!='Edit'    Input Valid Value    Company Details Submit Button
#    Run Keyword If    '${Mode}'!='Edit'    Input Valid Value    Contact Details Submit Button
#    Sleep    2s
#    ${GSTIN}    Replace String    ${Branch["GSTIN"]}    __PAN__    ${Company["Enter PAN"]}
#    Input Valid Value    PANFile    ${Company["Company PANFile"]}
#    Sleep    1s
#    Input Valid Value    GSTIN    ${GSTIN}
#    Input Valid Value    GSTINFile    ${Branch["GSTINFile"]}
#    Input Valid Value    TIN    ${Branch["TIN"]}
#    Input Valid Value    TINFile    ${Branch["TINFile"]}
#    Input Valid Value    IBM    ${Branch["IBM"]}
#    Input Valid Value    IBMFile    ${Branch["IBMFile"]}
#    Run Keyword If    '${Mode}'!='Edit'    Input Valid Value    IBM Registration Date    ${Branch["IBM Registration Date"]}
#    Sleep    3s
#    Run Keyword If    '${Mode}'=='Pending'    Input Valid Value    Customer Details Submit Button
#    #Run Keyword If    '${Mode}'=='Draft'  click button  //button[@id='action-Submit']
#    Run Keyword If    '${Mode}'=='Draft'    Input Valid Value    Customer Details Update Button

Fill Agent
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

Fill Plants
    #[Arguments]    ${Key Description}
    Input Valid Value    Plant Location    ${Plant["Plant Location"]}
    Input Valid Value    Capacity of Production (in MT)    ${Plant["Capacity of Production (in MT)"]}
    Input Valid Value    Year of Commissioning    ${Plant["Year of Commissioning"]}
    Input Valid Value    Production(MT)(Prev. Year)    ${Plant["Production(MT)(Prev. Year)"]}
    Input Valid Value    Do you Purchase Minerals from Others    ${Plant["Do you Purchase Minerals from Others"]}
    #Input Valid Value    Ratio of Other:RSMML    ${testData["Plant 2001"]["Ratio of Other:RSMML"]}
    Input Valid Value    Estimate Yearly Req.(MT)    ${Plant["Estimate Yearly Req.(MT)"]}
    Input Valid Value    Registration Number    ${Plant["Registration Number"]}
    Input Valid Value    Approx Transport Charges    ${Plant["Approx Transport Charges"]}
    Input Valid Value    Plant Capacity    ${Plant["Plant Capacity"]}
    Input Valid Value    Document Upload    ${Plant["Document Upload"]}
    Sleep    5s
    ${Status}    Run Keyword And Return Status    Page Should Contain Button    ${Key Description["Plant Details Save Button"]["Locator"]}
    Run Keyword If    ${Status}    Input Valid Value    Plant Details Save Button
    ...    ELSE    Input Valid Value    Plant Details Submit Button

Fill PO
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

Fill FI
    ${Status}    Run Keyword And Return Status    Should Be Equal    ${FI["Instrument Type"]}    Letter of Credit (LC)
    Input Valid Value    Financial Instrument Instrument Type    ${FI["Instrument Type"]}
    Input Valid Value    Financial Instrument Unit Name    ${FI["Unit Name"]}
    Input Valid Value    Financial Instrument BG/LC Number    ${FI["BG/LC Number"]}
    Input Valid Value    Financial Instrument LC/BG Date    ${FI["BG/LC Date"]}
    Input Valid Value    Financial Instrument BG/LC Amount    ${FI["BG/LC Amount"]}
    Input Valid Value    Financial Instrument Validity Date    ${FI["Validity Date"]}
    Input Valid Value    Financial Instrument Bank    ${FI["Bank"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Presentation Days    ${FI["Presentation Days"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Negotiating Bank    ${FI["Negotiating Bank"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Negotiating Bank Account Number    ${FI["Negotiating Bank Account Number"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument LC Type    ${FI["LC Type"]}
    Input Valid Value    Financial Instrument File Upload    ${FI["Document Upload"]}
    Input Valid Value    Financial Instrument Remark    ${FI["Remark"]}
    Sleep    3s
    ${Status}    Run Keyword And Return Status    Page Should Not Contain Button    ${Key Description["Financial Instrument Update Button"]["Locator"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Submit Button
    ...    ELSE    Input Valid Value    Financial Instrument Update Button

Fill CRO
    ${PO No}    Get Selected List Label    purchaseOrderId
    ${PO No}    Strip String    ${PO No}
    ${Status}    Evaluate    '${PO No}'=='${EMPTY}'
    click element  purchaseOrderId
    ${List Item}    Run Keyword If    ${Status}    Wait Until Keyword Succeeds    5s    100ms   Get List Items    purchaseOrderId
    ${List Item}    Run Keyword If    ${Status}    Catenate    ${List Item}
    ${List Item}    Run Keyword If    ${Status}    Split String    ${List Item}    ,
    ${List Item}    Run Keyword If    ${Status}    Get From List    ${List Item}    1
    ${List Item}    Run Keyword If    ${Status}    Split String    ${List Item}    '
    ${PO No}    Run Keyword If    ${Status}    Get From List    ${List Item}    1
    Run Keyword If    ${Status}    Input Valid Value    Contract Release Order Select PO    ${PO No}
    Input Valid Value    Contract Release Order PO Number    ${PO No}
    Input Valid Value    Contract Release Order Unit Name    ${PO["Unit Name"]}
    Input Valid Value    Contract Release Order Product Name    ${PO["Select Product"]}
    Input Valid Value    Contract Release Order Available Quantity    ${PO["PO Quantity"]}
    Sleep    3s
    Input Valid Value    Contract Release Order Product Quantity Required    ${CRO["Product Quantity Required"]}
    Sleep    0.5s
    #Input Valid Value    Contract Release Order Number Of Credit Days Required    ${CRO["No. of Credit Days Required"]}
    #Input Valid Value    Contract Release Order Pincode    ${PO["Destination Pincode"]}
    #Input Valid Value    Contract Release Order State    ${PO["Destination State"]}
    #Input Valid Value    Contract Release Order City    ${PO["Destination City"]}
    Input Valid Value    Contract Release Order Select Dispatch Point    ${CRO["Select Dispatch Point"]}
    Input Valid Value    Contract Release Order Total Amount    ${CRO["Total Amount"]}
    Input Valid Value    Contract Release Order Select Payment    ${PO["Preferred Mode of Payment"]}
    Input Valid Value    Contract Release Order Number Of Credit Days Required    ${CRO["No. of Credit Days Required"]}
    Input Valid Value    Contract Release Order Select Instrument Type    ${FI["Instrument Type"]}
    Input Valid Value    Contract Release Order Select Instrument    ${FI["BG/LC Number"]}
    Input Valid Value    Contract Release Order Agent    ${SSO ID["Name"]}
    Input Valid Value    Add Instrument Button
    #Sleep    2s
    #Press Keys    ${Key Description["Contract Release Order Amount"]["Locator"]}    \\08
    Input Valid Value    Contract Release Order Amount    ${CRO["Amount"]}
    sleep  4s
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Contract Release Order Button

Fill Group
    #wait until element is enabled  groupName
    #input text  //input[@id='groupName']  hello
    Input Valid Value    Customer Group Group Name    ${Company["Enter PAN"]}
    Input Valid Value    Customer Group Group Description    ${Branch["Group Description"]}
    Input Valid Value    Customer Group Button

#Login From Customer
#    [Arguments]    ${ssoId}
#    Input Text    txtSSOName    ${ssoId}
#    Click Button    btn
#    Sleep    2s

Select Purchaser
    Click Element    //div[contains(text(),'I want to purchase mineral')]

Select Customer
    Click Element    xpath=//div/button//span[text()='Customer']

Approve FI
    BrowserControl.Switch To    Verify
    Sleep    2s
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Finance/InstrumentList
    Sleep    2s
    Click Element    dropdownOpen
    Run Keyword If    '${FI["Instrument Type"]}'=='Letter of Credit (LC)'    Select From List By Label    instrumentType    Letter of Credit (LC)
    ...    ELSE    Select From List By Label    instrumentType    Bank Guarantee (BG)
    Click Button    btnApply
    Sleep    3s
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Run Keyword If    '${Status}'=='False'    Click Button    Next
    Sleep    2s
    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Sleep    3s
    Click Button    action-Approve
    Sleep    2s

Approve PO
    [Arguments]  ${PO No}
    BrowserControl.Switch To    Verify
    Sleep    2s
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/PurchaseOrder
    Sleep    2s
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    Pending
    Click Button    btnApplyFillter
    Sleep    3s
    Click Element    //span[contains(text(),'${PO No}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Sleep    3s
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
    Sleep    6s
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    Approved
    Click Button    btnApplyFillter
    Sleep    3s
#    ${PO No}  Get Text    //span[contains(text(),'30% P205 Crushed Rock phosphate')]/../preceding-sibling::td[2]
#    [Return]    ${PO No}

Approve PO By Product
    BrowserControl.Switch To    Verify
    Sleep    2s
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/PurchaseOrder
    Sleep    2s
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    Pending
    Click Button    btnApplyFillter
    Sleep    3s
    Click Element    //span[contains(text(),'${PO["Select Product"]}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Sleep    3s
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
    Sleep    6s
    Click Element    dropdownOpen
    Select From List By Label    plantStatus    Approved
    Click Button    btnApplyFillter
    Sleep    3s
    ${PO No}  Get Text    //span[contains(text(),'30% P205 Crushed Rock phosphate')]/../preceding-sibling::td[2]
    [Return]    ${PO No}

Fill Inward Slip
    [Arguments]    ${CRO No}
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Sleep    2s
    #Common_Keywords.Set Test Variables
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/WeighBridge/WeighBridgeOperation
    Sleep    2s
    #Input Text Value    ${Key Description["Search By CRO"]["Locator"]}    ${CRO No}
    input text  searchByCRO  ${CRO No}${SPACE}
    Sleep    4s
    click element   //span[contains(text(),'${CRO No}')]/../following-sibling::td//button
    #Input Valid Value    Generate In Slip
    Sleep    2s
    Input Valid Value    Enter Vehicle Number    ${Dispatch["Enter Vehicle Number"]}
    Input Valid Value    Select Vehicle Type    ${Dispatch["Select Vehicle Type"]}
    Input Valid Value    Tare Weight    ${Dispatch["Tare Weight"]}
    Input Valid Value    Max Capacity    ${Dispatch["Max Capacity"]}
    Input Valid Value    Driver Name    ${Dispatch["Driver Name"]}
    Input Valid Value    Driver Mobile    ${Dispatch["Driver Mobile"]}
    Input Valid Value    In Weight    ${Dispatch["In Weight"]}
    Input Valid Value    Max Product Capacity    ${CRO["Product Quantity Required"]}
    Input Valid Value    Lease Id    ${Dispatch["Lease Id"]}
    Input Valid Value    Select Stock Location    ${Dispatch["Select Stock Location"]}
    Input Valid Value    Generate In Slip Button

Fill Outward Slip
    [Arguments]    ${CRO No}
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Sleep    2s
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/WeighBridge/WeighBridgeOperation
    Sleep    2s
    Input Valid Value    Tab In Vehicle
    Sleep    1s
    Input Text Value    ${Key Description["Search In Vehicle"]["Locator"]}    ${CRO No}${SPACE}
    Set To Dictionary    ${Key Description["Generate Out Slip"]}    Locator=//SPAN[contains(text(),'${Dispatch["Enter Vehicle Number"]}')]/../following-sibling::td/button
    Sleep    4s
    Input Valid Value    Generate Out Slip
    Sleep    2s
    Input Valid Value    Gross Weight    ${Dispatch["Gross Weight"]}
    Input Valid Value    Generate Out Slip Button