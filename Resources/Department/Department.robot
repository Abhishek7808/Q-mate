*** Settings ***
Library           SeleniumLibrary
Resource          ../../Configuration.resource
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py

*** Keywords ***
#Go To Differentials Adjustment
#    Go To    ${LOGIN URL}/SMM/Invoice/Adjustment

Go To Product List By Department
    Go To    ${LOGIN URL}/SMM/Product/ProductList
#
#Go To Receipt Generation
#    Go To    ${LOGIN URL}/SMM/Receipt/ReceiptList

Go To Renew PO Process
    Go To    ${LOGIN URL}/SMM/PurchaseOrder/RenewPOList

Go To Customer Group
    Go To    ${LOGIN URL}/SMM/Customer/GroupList

Go To Add Customer Group By Department
    Go To Customer Group
    Input Valid Value    Add Customer Group

Go To Plant List
    Wait Until Keyword Succeeds    5s    250ms    Click Button    plantDetail

Go To CRO List
    Go To    ${LOGIN URL}/SMM/ContractReleaseOrder

Go To Member List
    Wait Until Keyword Succeeds    5s    250ms    Click Button    memberList
    Wait Until Keyword Succeeds    5s    250ms    Click Button    btnView

Go To Schedule In Product Management From Department
    Go To    ${LOGIN URL}/SMM/Schedule

Go To Invoice From Department
    Go To    ${LOGIN URL}/SMM/Invoice/InvoiceList

Login From Department
    [Arguments]    ${Username}    ${Password}
    Input Text    LoginIdForShow    ${Username}
    Input Password    PasswordForShow    ${Password}
    Click Button    btnLogin

#View Customer List
#    Input Valid Value    View Customer List

#Go To Add Product From Department
#     Go To    ${LOGIN URL}/SMM/Product/ProductList

#Go To Add Customer From Department
#    Go To Customer List
#    Input Valid Value    Add Customer

#Go To Add Purchase Order From Department
#    Go To Purchase Order List
#    Input Valid Value    Add Purchase Order

Go To Financial Instrument List From Department
    Go To    ${LOGIN URL}/SMM/Finance/InstrumentList

#Go To Customer List
#    Go To    ${LOGIN URL}/SMM/Customer/PlantList

Go To Purchase Order List
    Go To    ${LOGIN URL}/SMM/PurchaseOrder

Apply Filter
    [Arguments]    ${Status}
    Wait Until Keyword Succeeds    5s    250ms    Click Element    //div[@id='dropdownOpen']/button/i
    Wait Until Keyword Succeeds    5s    250ms    Select From List By Value    plantStatus    ${Status}
    Wait Until Keyword Succeeds    5s    250ms    Select Checkbox    chkViewAll
    Sleep    1s
    Wait Until Keyword Succeeds    5s    250ms    Click Button    btnApplyFillter

View Company Details
    log to console  ${Branch["Name"]} branch name
    #sleep  2s
    Wait Until Keyword Succeeds    5s    250ms    click element  //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[@title='View']
    # /following-sibling::td/span[@title="Plot 13/14/25 Nagarro Solutions Pvt. Lmt., Jaipur, Rajasthan"]
    # get text  //span[contains(text(),'Plot 13/14/25 Nagarro Solutions Pvt. Lmt., Jaipur,')]

#Company Registration By Department
#    [Arguments]    ${Mode}
#    Input Valid Value    User Type    ${Branch["User Type"]}
#    Run Keyword If    '${Branch["User Type"]}'=='Traders'    Input Valid Value    TCS Rate    ${Branch["TCS Rate"]}
#    run keyword and ignore error  Input Valid Value    Enter PAN    ${Company["Enter PAN"]}
#    sleep  1s
#    ${status}  run keyword and return status  page should contain element  dailogPopup
#    run keyword if  ${status} == ${True}  click button  btnCancel
##    Run Keyword If    '${Mode}'=='New Branch'    Input Valid Value    Create New Branch Button
##    ...    ELSE IF    '${Mode}'=='New Company'    Wait Until Keyword Succeeds    5s    250ms    Click Element
##    ...    PlantName-${Branch["Name"]}
#    Input Valid Value    Company Type    ${Company["Company Type"]}
#    Input Valid Value    Company Name    ${Company["Company Name"]}
#    Input Valid Value    Company Pincode    ${Company["Company Pincode"]}
#    Input Valid Value    Company Address Line 1    ${Company["Company Address Line 1"]}
#    Input Valid Value    Company Address Line 2    ${Company["Company Address Line 2"]}
#    Input Valid Value    Company City    ${Company["Company City"]}
#    Input Valid Value    Company State    ${Company["Company State"]}
#    Input Valid Value    Branch Name    ${Branch["Name"]}
#    Input Valid Value    Branch Pincode    ${Branch["Pincode"]}
#    Input Valid Value    Branch State    ${Branch["State"]}
#    Input Valid Value    Branch City    ${Branch["City"]}
#    Input Valid Value    Branch Address Line 1    ${Branch["Address Line 1"]}
#    Input Valid Value    Branch Address Line 2    ${Branch["Address Line 2"]}
#    run keyword and ignore error  Input Valid Value    PAN    ${Company["Enter PAN"]}
#    run keyword and ignore error  Input Valid Value    PANFile    ${Company["Company PANFile"]}
#    ${GSTIN}    Replace String    ${Branch["GSTIN"]}    __PAN__    ${Company["Enter PAN"]}
#    Input Valid Value    GSTIN    ${GSTIN}
##    Input Valid Value    GSTINFile    ${Branch["GSTINFile"]}
#    Input Valid Value    TIN    ${Branch["TIN"]}
##    Input Valid Value    TINFile    ${Branch["TINFile"]}
#    Input Valid Value    IBM    ${Branch["IBM"]}
##    Input Valid Value    IBMFile    ${Branch["IBMFile"]}
#    Input Valid Value    IBM Registration Date    ${Branch["IBM Registration Date"]}
##   Scroll Element Into View  //button[@id='action-Submit']
#
#    #Run Keyword If    '${Mode}'=='Draft'    Input Valid Value    Customer Details Submit Button From Draft
#    Wait Until Keyword Succeeds    5s    250ms  Run Keyword If    '${Mode}'=='Draft'  click button  //button[@id='action-Submit']
#    sleep  5s
#    Wait Until Keyword Succeeds    5s    250ms  Run Keyword If    '${Mode}'=='Draft'  click button  //button[@id='action-Approve']
#    #Input Valid Value    Customer Details Approve Button
#    #Run Keyword If    '${Mode}'=='Draft'    Input Valid Value    Customer Details Approve Button
#    Run Keyword If    '${Mode}'=='Pending'    Input Valid Value    Customer Details Approve Button
#    Run Keyword If    '${Mode}'=='New Company'    Input Valid Value    Customer Details Submit Button
#    Run Keyword If    '${Mode}'=='New Branch'    Input Valid Value    Customer Details Submit Button
#    Run Keyword If    '${Mode}'=='Existing'    Input Valid Value    Customer Details Update Button
#    Run Keyword If    '${Mode}'=='Activate'    Input Valid Value    Customer Details Active Button

#Member List By Department
#    Input Valid Value    SSO ID    ${SSO ID["SSOID"]}
#    Input Valid Value    Your Name    ${SSO ID["Name"]}
#    Input Valid Value    Your Designation    ${SSO ID["Designation"]}
#    Input Valid Value    Mobile Number    ${SSO ID["Mobile Number"]}
#    Input Valid Value    Alternate Mobile Number    ${SSO ID["Alternate Mobile Number"]}
#    Input Valid Value    Email ID    ${SSO ID["Email ID"]}
#    Input Valid Value    Fax    ${SSO ID["Fax"]}
#    Input Valid Value    Member List Submit Button

#Fill Plants By Department
#    #[Arguments]    ${Key Description}
#    wait until page contains element  //*[@id="plantLocation"]
#    Input Valid Value    Plant Location    ${Plant["Plant Location"]}
#    Input Valid Value    Capacity of Production (in MT)    ${Plant["Capacity of Production (in MT)"]}
#    Input Valid Value    Year of Commissioning    ${Plant["Year of Commissioning"]}
#    Input Valid Value    Production(MT)(Prev. Year)    ${Plant["Production(MT)(Prev. Year)"]}
#    Input Valid Value    Do you Purchase Minerals from Others    ${Plant["Do you Purchase Minerals from Others"]}
#    sleep  3s
#    run keyword and ignore error  Input Valid Value    Ratio of Other:RSMML    ${Plant["Ratio of Other:RSMML"]}
#    Input Valid Value    Estimate Yearly Req.(MT)    ${Plant["Estimate Yearly Req.(MT)"]}
#    Input Valid Value    Registration Number    ${Plant["Registration Number"]}
#    Input Valid Value    Approx Transport Charges    ${Plant["Approx Transport Charges"]}
#    Input Valid Value    Plant Capacity    ${Plant["Plant Capacity"]}
#    Input Valid Value    Document Upload    ${Plant["Document Upload"]}
#    Input Valid Value    Plant Details Submit Button

#Fill PO By Department
#    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]} (${Company["Enter PAN"]})
#    Input Valid Value    Purchase Order Enter Customer PAN or Name    ${Val}
#    Input Valid Value    Purchase Order Purchasing for Self Use    ${Branch["User Type"]}
#    Input Valid Value    Purchase Order Branch Name    ${Branch["Name"]}
#    Input Valid Value    Purchase Order Pincode    ${Branch["Pincode"]}
#    Input Valid Value    Purchase Order State    ${Branch["State"]}
#    Input Valid Value    Purchase Order City    ${Branch["City"]}
#    Input Valid Value    Purchase Order Address Line 1    ${Branch["Address Line 1"]}
#    Input Valid Value    Purchase Order Address Line 2    ${Branch["Address Line 2"]}
#    ${Status}    Run Keyword And Return Status    Should Be Equal    ${PO["Coming Against Auction"]}    Select
#    Input Valid Value    Purchase Order Coming Against Auction    ${PO["Coming Against Auction"]}
#    Input Valid Value    Purchase Order Unit Name    ${PO["Unit Name"]}
#    Input Valid Value    Purchase Order Select Product    ${PO["Select Product"]}
#    Input Valid Value    Purchase Order PO Quantity(MT)    ${PO["PO Quantity"]}
#    Input Valid Value    Purchase Order Preferred Mode of Payment    ${PO["Preferred Mode of Payment"]}
#    Input Valid Value    Purchase Order Expiry Date    ${PO["Expiry Date"]}
#    Run Keyword If    ${Status}    Input Valid value    Purchase Order BID Number    ${PO["BID Number"]}
#    Run Keyword If    ${Status}    Input Valid Value    Purchase Order Product Price    ${PO["Product Price"]}
#    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
#    Input Valid Value    Purchase Order Destination Pincode    ${PO["Destination Pincode"]}
#    Input Valid Value    Purchase Order Destination City    ${PO["Destination City"]}
#    Input Valid Value    Purchase Order Destination State    ${PO["Destination State"]}
#    #Input Valid Value    Add Agent Button
#    #Sleep    2s
#    #Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
#    #Sleep    1s
#    #Input Valid Value    Add Agent Agent Name    ${SSO ID["Name"]}
#    #Input Valid Value    Add Agent Validity Date    ${SSO ID["Validity Date"]}
#    #Input Valid Value    Add Agent Pincode    ${SSO ID["Pincode"]}
#    #Input Valid Value    Add Agent City    ${SSO ID["City"]}
#    #Input Valid Value    Add Agent State    ${SSO ID["State"]}
#    #Input Valid Value    Add Agent Address    ${SSO ID["Address"]}
#    #Input Valid Value    Add Agent Mobile Number    ${SSO ID["Mobile Number"]}
#    #Input Valid Value    Add Agent Telephone Number (Office)    ${SSO ID["Alternate Mobile Number"]}
#    #Input Valid Value    Add Agent Alternate Number    ${SSO ID["Alternate Mobile Number"]}
#    #Input Valid Value    Add Agent Fax    ${SSO ID["Fax"]}
#    #Input Valid Value    Add Agent Email    ${SSO ID["Email ID"]}
#    #Input Valid Value    Add Agent Save Button
#    Wait Until Keyword Succeeds    5s    250ms    Input Search Agent    react-select-2-input    ${SSO ID["Name"]}
#    Wait Until Keyword Succeeds    5s    250ms    Input Valid Value    Purchase Order Submit Button
#
#Fill Agent By Department
#    Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
#    sleep  2s
#    Input Valid Value    Add Agent Agent Name    ${SSO ID["Name"]}
#    Input Valid Value    Add Agent Validity Date    ${SSO ID["Validity Date"]}
#    ${Status}    Run Keyword And Return Status    Page Should Contain Element    agentModalPinCode
#    Run Keyword Unless    ${Status}    Input Valid Value    Add Agent Pincode    ${SSO ID["Pincode"]}
#    Input Valid Value    Add Agent City    ${SSO ID["City"]}
#    Input Valid Value    Add Agent State    ${SSO ID["State"]}
#    Input Valid Value    Add Agent Address    ${SSO ID["Address"]}
#    Input Valid Value    Add Agent Mobile Number    ${SSO ID["Mobile Number"]}
#    #Input Valid Value    Add Agent Telephone Number
#    Input Valid Value    Add Agent Alternate Number    ${SSO ID["Alternate Mobile Number"]}
#    Input Valid Value    Add Agent Fax    ${SSO ID["Fax"]}
#    Input Valid Value    Add Agent Email    ${SSO ID["Email ID"]}
#    Input Valid Value    Add Agent Save Button
#    ${message}  Handle Alert
#    run keyword if  '${message}' == 'Agent Plant Relation is already exists'  click button  btnCancelModel


#Update PO By Department
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Unit Name    ${PO["Unit Name"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Unit Name is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Select Product    ${PO["Select Product"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Select Product is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order PO Quantity(MT)    ${PO["PO Quantity"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  PO Quantity is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Preferred Mode of Payment    ${PO["Preferred Mode of Payment"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Preferred Mode of Payment is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Document Upload is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Destination Pincode    ${PO["Destination Pincode"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Destination Pincode is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Destination City    ${PO["Destination City"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Destination City is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Destination State    ${PO["Destination State"]}
#    log  ${status}
#    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  Destination State is not editable
#    ${status}  run keyword and return status  Input Valid Value    Purchase Order Update Button
#    log  ${status}
#    #run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  element is not editable

#Generate Receipt By Department
#    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]} (${Company["Enter PAN"]})
#    Input Valid Value    Receipt Enter Customer PAN or Name    ${Val}
#    ${status}  run keyword and return status  Input Valid Value    Receipt Company Name    ${Company["Company Name"]}
#    ${status}  run keyword and return status  Input Valid Value    Receipt Branch Name    ${Branch["Name"]}
#    ${status}  run keyword and return status  Input Valid Value    Receipt Pincode    ${Branch["Pincode"]}
#    ${status}  run keyword and return status  Input Valid Value    Receipt City    ${Branch["City"]}
#    ${status}  run keyword and return status  Input Valid Value    Receipt State    ${Branch["State"]}
#    Input Valid Value    Receipt Receipt Against    ${Receipt["Receipt Against"]}
#    #TODO: Bank name can vary
#    Input Valid Value    Receipt Deposited In    ${Receipt["Deposited In"]}
#    Input Valid Value    Receipt Remarks    ${Receipt["Remarks"]}
#    Input Valid Value    Receipt Instrument Type    ${Receipt["Instrument Type"]}
#    Input Valid Value    Receipt Bank    ${Receipt["Bank"]}
#    Input Valid Value    Receipt Instrument No.    ${Receipt["Instrument No."]}
#    Input Valid Value    Receipt Instrument Details Date    ${Receipt["Date"]}
#    Input Valid Value    Receipt Amount    ${Receipt["Amount"]}
#    Input Valid Value    Receipt Add Button
#    Input Valid Value    Generate Receipt Submit Button

#Fill Product By Department
#    Input Valid Value    Product Name    ${PD["Product Name"]}
#    ${status}  run keyword and return status  Input Valid Value    Is Auctionable    ${PD["Is Auctionable"]}
#    log  ${status}
#    Input Valid Value    HSN Code    ${PD["HSN Code"]}
#    ${status}  run keyword and return status  Input Valid Value    Product Description    ${PD["Product Description"]}
#    log  ${status}
#    Input Valid Value    Dispatch Points    ${PD["Dispatch Points"]}
#    Input Valid Value    Free Credit Days    ${PD["Free Credit Days"]}
#    Input Valid Value    Head    ${PD["Head"]}
#    Input Valid Value    Invoice Generation    ${PD["Invoice Generation"]}
#    Input Valid Value    Mineral ID    ${PD["Mineral ID"]}
#    Input Valid Value    Mineral Name    ${PD["Mineral Name"]}
#    Input Valid Value    DMG Mixture ID    ${PD["DMG Mixture ID"]}
#    Input Valid Value    DMG Grade ID    ${PD["DMG Grade ID"]}
#    Input Valid Value    Product Details Submit Button

#Fill Schedule By Department
#    Input Valid Value    Select Component    ${SC["Select Component"]}
#    Input Valid Value    Start Date    ${SC["Start From"]}
#    Input Valid Value    End Date    ${SC["End"]}
#    Input Valid Value    Application From    ${SC["Application From"]}
#    Input Valid Value    Schedule Structure    ${SC["Structure"]}
##    Input Valid Value    Schedule Product   ${SC["Product"]}
##    Input Valid Value    Schedule Customer    ${SC["Customer"]}
#    Input Valid Value    Schedule Agreement    ${SC["Agreement"]}
#    Input Valid Value    Agreement PO    ${SC["Agreement PO"]}
#    Input Valid Value    Calculation Type    ${SC["Calculation Type"]}
#    Clear Text Value  formula
#    Input Valid Value    Keyword  ${SC["Schedule keyword"]}
#    Input Valid Value    Multiply
#    input text  amountFormula  12
#    Input Valid Value    Priority    ${SC["Priority"]}
#    Input Valid Value    Schedule Save Button

#Edit Schedule By Department
#    Input Valid Value    Select Component*    ${SC["Select Component*"]}
#    sleep  1s
#    @{webElements}  Get Webelements  //*[@id="effFromDate"]
#    log  ${webElements}
#    set test variable  ${starDateLocator}  ${webElements}[1]
#    Input Date  ${starDateLocator}  ${SC["Start From"]}
#    #Input Valid Value    End    ${SC["End"]}
#    Input Valid Value    Application From    ${SC["Application From"]}
#    @{webElements}  Get Webelements   //*[contains(text(),'STRUCTURE')]
#    log  ${webElements}
#    set test variable  ${structureFirstLocator}  ${webElements}[1]
#    click element  ${structureFirstLocator}
#    sleep  2s
#    Input Dropdown  //select[@id='structureAdd']  ${SC["Structure"]}
#    #Input Valid Value    Structure    ${SC["Structure"]}
#    Input Valid Value    Calculation Type    ${SC["Calculation Type"]}
#    Clear Text Value  formula
#    Input Valid Value    Keyword  ${SC["Schedule keyword"]}
#    Input Valid Value    Multiply
#    input text  amountFormula  12
#    Input Valid Value    Priority    ${SC["Priority"]}
#    Click Button    btnSaveUpdate
   # Input Valid Value    Schedule Save Button


Fill FI By Department
    ${Status}    Run Keyword And Return Status    List Should Contain Value    ${FI["Instrument Type"]}    Letter of Credit (LC)
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
    Wait Until Keyword Succeeds    5s    250ms    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Submit Button
