*** Variables ***
${pageUrl}  SMM/Product/ProductList

*** Keywords ***
Go To Product Page
    [Documentation]  Opens product page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Add Product
    [Documentation]  Clicks on add product page.
    click button  btnAddProduct

Fill Product Form
    [Documentation]  Fills details into product form.
    Input Valid Value    Product Name    ${PD["Product Name"]}
    ${status}  run keyword and return status  Input Valid Value    Is Auctionable    ${PD["Is Auctionable"]}
    log  ${status}
    Input Valid Value    HSN Code    ${PD["HSN Code"]}
    ${status}  run keyword and return status  Input Valid Value    Product Description    ${PD["Product Description"]}
    log  ${status}
    Input Valid Value    Dispatch Points    ${PD["Dispatch Points"]}
    Input Valid Value    Free Credit Days    ${PD["Free Credit Days"]}
    Input Valid Value    Head    ${PD["Head"]}
    Input Valid Value    Invoice Generation    ${PD["Invoice Generation"]}
    Input Valid Value    Mineral ID    ${PD["Mineral ID"]}
    Input Valid Value    Mineral Name    ${PD["Mineral Name"]}
    Input Valid Value    DMG Mixture ID    ${PD["DMG Mixture ID"]}
    Input Valid Value    DMG Grade ID    ${PD["DMG Grade ID"]}
    Input Valid Value    Product Details Submit Button

Add Schedule From Product Page
    [Documentation]  Opens schedule form from product page and fills details into it.
    Click Element    xpath=//span[contains(text(),'Schedules')]
    Sleep    3s
    Click Button    btnAddNew
    Input Valid Value    Select Component*    ${SC["Select Component*"]}
    sleep  1s
    @{webElements}  Get Webelements  //*[@id="effFromDate"]
    log  ${webElements}
    set test variable  ${starDateLocator}  ${webElements}[1]
    Input Date  ${starDateLocator}  ${SC["Start From"]}
    #Input Valid Value    End    ${SC["End"]}
    Input Valid Value    Application From    ${SC["Application From"]}
    @{webElements}  Get Webelements   //*[contains(text(),'STRUCTURE')]
    log  ${webElements}
    set test variable  ${structureFirstLocator}  ${webElements}[1]
    click element  ${structureFirstLocator}
    sleep  2s
    Input Dropdown  //select[@id='structureAdd']  ${SC["Structure"]}
    #Input Valid Value    Structure    ${SC["Structure"]}
    Input Valid Value    Calculation Type    ${SC["Calculation Type"]}
    Clear Text Value  formula
    Input Valid Value    Keyword  ${SC["Schedule keyword"]}
    Input Valid Value    Multiply
    input text  amountFormula  12
    Input Valid Value    Priority    ${SC["Priority"]}
    Click Button    btnSaveUpdate

Search Product
    [Documentation]  Takes product name as argument and searches it.
    [Arguments]  ${productName}
    Wait Until Keyword Succeeds    2s    400ms    Input Valid Value    Product Search By Name    ${productName}

Edit Product Details
    [Documentation]  Edits details of the product.
    Sleep    2s
    Click Element    //span[contains(text(),'${PD["Product Name"]}')]/../following-sibling::td/i[@title='Edit']
    Sleep    1s
    set test variable  ${effectiveFrom}  ${testData["Product Add Price"]["Effective from"]}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]
    run keyword if  ${status} == ${True}  click element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]/following-sibling::td//i[@id='iconDeletePrice']
    run keyword if  ${status} == ${True}  sleep  5s
    Click Button    btnPriceAddNew
    Input Valid Value    Effective from    ${testData["Product Add Price"]["Effective from"]}
    Input Valid Value    Product Rate(per MT)    ${testData["Product Add Price"]["Product Rate(per MT)"]}
    Input Valid Value    Processing Rate(per MT)    ${testData["Product Add Price"]["Processing Rate(per MT)"]}
    Sleep    2s
    Click Button    btnSubmit
    Sleep    10s
    set test variable  ${effectiveFrom}  ${testData["Product Add Interest"]["Interest Effective from"]}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]
    run keyword if  ${status} == ${True}  click element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]/following-sibling::td//i[@id='iconDeleteInterest']
    run keyword if  ${status} == ${True}  sleep  5s
    Click Button    btnInterestAddNew
    Input Valid Value    Effective from    ${testData["Product Add Interest"]["Interest Effective from"]}
    Input Valid Value    Day From    ${testData["Product Add Interest"]["Day From"]}
    Input Valid Value    Day To    ${testData["Product Add Interest"]["Day To"]}
    Input Valid Value    Interest Rate(Per MT)    ${testData["Product Add Interest"]["Interest Rate(Per MT)"]}
    Sleep    3s
    Click Button    btnSubmit
    Wait Until Keyword Succeeds    2s    400ms    Input Valid Value    Product Details Submit Button
    Sleep    5s