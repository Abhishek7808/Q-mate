*** Keywords ***
Company Registration By Department
    [Arguments]    ${Branch Creation}    #Fresh, New, Existing
    Input Valid Value    User Type    ${Branch["User Type"]}
    Run Keyword If    '${Branch["User Type"]}'=='Traders'    Input Valid Value    TCS Rate    ${Branch["TCS Rate"]}
    Input Valid Value    Enter PAN    ${Company["Enter PAN"]}
    Sleep    3s
    Run Keyword If    '${Branch Creation}'=='New'    Input Valid Value    Create New Branch Button
    Run Keyword If    '${Branch Creation}'=='Existing'    Click Element    PlantName-${Branch["Name"]}
    Input Valid Value    Company Type    ${Company["Company Type"]}
    Input Valid Value    Company Name    ${Company["Company Name"]}
    Input Valid Value    Company Pincode    ${Company["Company Pincode"]}
    Input Valid Value    Company Address Line 1    ${Company["Company Address Line 1"]}
    Input Valid Value    Company Address Line 2    ${Company["Company Address Line 2"]}
    Input Valid Value    Company City    ${Company["Company City"]}
    Input Valid Value    Company State    ${Company["Company State"]}
    Input Valid Value    Branch Name    ${Branch["Name"]}
    Input Valid Value    Branch Pincode    ${Branch["Pincode"]}
    Input Valid Value    Branch State    ${Branch["State"]}
    Input Valid Value    Branch City    ${Branch["City"]}
    Input Valid Value    Branch Address Line 1    ${Branch["Address Line 1"]}
    Input Valid Value    Branch Address Line 2    ${Branch["Address Line 2"]}
    Input Valid Value    PAN    ${Company["Enter PAN"]}
    Input Valid Value    PANFile    ${Company["Company PANFile"]}
    ${GSTIN}    Replace String    ${Branch["GSTIN"]}    __PAN__    ${Company["Enter PAN"]}
    Input Valid Value    GSTIN    ${GSTIN}
    Input Valid Value    GSTINFile    ${Branch["GSTINFile"]}
    Input Valid Value    TIN    ${Branch["TIN"]}
    Input Valid Value    TINFile    ${Branch["TINFile"]}
    Input Valid Value    IBM    ${Branch["IBM"]}
    Input Valid Value    IBMFile    ${Branch["IBMFile"]}
    #Input Valid Value    IBM Registration Date    ${Branch["IBM Registration Date"]}
    Input Valid Value    Customer Details Submit Button

Member List By Department
    Input Valid Value    SSO ID    ${SSO ID["SSOID"]}
    Input Valid Value    Your Name    ${SSO ID["Name"]}
    Input Valid Value    Your Designation    ${SSO ID["Designation"]}
    Input Valid Value    Mobile Number    ${SSO ID["Mobile Number"]}
    Input Valid Value    Alternate Mobile Number    ${SSO ID["Alternate Mobile Number"]}
    Input Valid Value    Email ID    ${SSO ID["Email ID"]}
    Input Valid Value    Fax    ${SSO ID["Fax"]}
    Sleep    2s
    Click Button    btnSubmitMember

Fill Plants By Department
    #[Arguments]    ${Key Description}
    Input Valid Value    Plant Location    ${Plant["Plant Location"]}
    Input Valid Value    Capacity of Production (in MT)    ${Plant["Capacity of Production (in MT)"]}
    Input Valid Value    Year of Commissioning    ${Plant["Year of Commissioning"]}
    Input Valid Value    Production(MT)(Prev. Year)    ${Plant["Production(MT)(Prev. Year)"]}
    Input Valid Value    Do you Purchase Minerals from Others    ${Plant["Do you Purchase Minerals from Others"]}
    Input Valid Value    Ratio of Other:RSMML    ${Plant["Ratio of Other:RSMML"]}
    Input Valid Value    Estimate Yearly Req.(MT)    ${Plant["Estimate Yearly Req.(MT)"]}
    Input Valid Value    Registration Number    ${Plant["Registration Number"]}
    Input Valid Value    Approx Transport Charges    ${Plant["Approx Transport Charges"]}
    Input Valid Value    Plant Capacity    ${Plant["Plant Capacity"]}
    Input Valid Value    Document Upload    ${Plant["Document Upload"]}
    Sleep    3s
    Click Button    btnSubmitPlant

Fill FI
    Input Valid Value    Financial Instrument Instrument Type    ${Financial Instrument["Instrument Type"]}
    Input Valid Value    Financial Instrument Unit Name    ${Financial Instrument["Unit Name"]}
    Input Valid Value    Financial Instrument BG/LC Number    ${Financial Instrument["BG/LC Number"]}
    Input Valid Value    Financial Instrument LC/BG Date    ${Financial Instrument["BG/LC Date"]}
    Input Valid Value    Financial Instrument BG/LC Amount    ${Financial Instrument["BG/LC Amount"]}
    Input Valid Value    Financial Instrument Validity Date    ${Financial Instrument["Validity Date"]}
    Input Valid Value    Financial Instrument Bank    ${Financial Instrument["Bank"]}
    Input Valid Value    Financial Instrument Presentation Days    ${Financial Instrument["Presentation Days"]}
    Input Valid Value    Financial Instrument Negotiating Bank    ${Financial Instrument["Negotiating Bank"]}
    Input Valid Value    Financial Instrument Negotiating Bank Account Number    ${Financial Instrument["Negotiating Bank Account Number"]}
    Input Valid Value    Financial Instrument LC Type    ${Financial Instrument["LC Type"]}
    Input Valid Value    Financial Instrument File Upload    ${Financial Instrument["Document Upload"]}
    Input Valid Value    Financial Instrument Remark    ${Financial Instrument["Remark"]}
    Sleep    3s
    Click Button

Fill PO By Departmnet
    Input Valid Value    Purchase Order Enter Customer PAN or Name    ${Value}
    Input Valid Value    Purchase Order Purchasing for Self Use    ${Branch["User Type"]}
    Input Valid Value    Purchase Order Branch Name    ${Branch["Name"]}
    Input Valid Value    Purchase Order Pincode    ${Branch["Pincode"]}
    Input Valid Value    Purchase Order State    ${Branch["State"]}
    Input Valid Value    Purchase Order City    ${Branch["City"]}
    Input Valid Value    Purchase Order Address Line 1    ${Branch["Address Line 1"]}
    Input Valid Value    Purchase Order Address Line 2    ${Branch["Address Line 2"]}
    Input Valid Value    Purchase Order Coming Against Auction    ${Purchase Order["Coming Against Auction"]}
    Input Valid Value    Purchase Order Unit Name    ${Purchase Order["Unit Name"]}
    Input Valid Value    Purchase Order Select Product    ${Purchase Order["Select Product"]}
    Input Valid Value    Purchase Order PO Quantity(MT)    ${Purchase Order["PO Quantity"]}
    Input Valid Value    Purchase Order Preferred Mode of Payment    ${Purchase Order["Preferred Mode of Payment"]}
    Input Valid Value    Purchase Order Expiry Date    ${Purchase Order["Expiry Date"]}
    Input Valid Value    Purchase Order Document Upload    ${Purchase Order["Document Upload"]}
    Input Valid Value    Purchase Order Destination Pincode    ${Purchase Order["Destination Pincode"]}
    Input Valid Value    Purchase Order Destination City    ${Purchase Order["Destination City"]}
    Input Valid Value    Purchase Order Destination State    ${Purchase Order["Destination State"]}
    Click Button    btnSubmit

Add Product Price
    Input Valid Value    Effective from    ${testData["Product Add Price"]["Effective from"]}
    Input Valid Value    Product Rate(per MT)    ${testData["Product Add Price"]["Product Rate(per MT)"]}
    Input Valid Value    Processing Rate(per MT)    ${testData["Product Add Price"]["Processing Rate(per MT)"]}

Add Product Interest Rate
    Input Valid Value    Effective from    ${testData["Product Add Interest"]["Interest Effective from"]}
    Input Valid Value    Day From    ${testData["Product Add Interest"]["Day From"]}
    Input Valid Value    Day To    ${testData["Product Add Interest"]["Day To"]}
    Input Valid Value    Interest Rate(Per MT)    ${testData["Product Add Interest"]["Interest Rate(Per MT)"]}

Schedule On
    Input Valid Value    Select Component*    ${SC["Select Component*"]}
    Input Valid Value    Start From    ${SC["Start From"]}
    Input Valid Value    End    ${SC["End"]}
    Input Valid Value    Application From    ${SC["Application From"]}

Product Structure
    Input Valid Value    Structure    ${testData["Product Structure"]["Structure"]}
    Input Valid Value    Product    ${testData["Product Structure"]["Product"]}

Formula
    Input Valid Value    Calculation Type    ${FR["Calculation Type"]}
    Input Valid Value    Priority    ${FR["Priority"]}
    Input Valid Value    Formula    ${FR["Formula"]}
