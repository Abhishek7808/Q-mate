*** Settings ***
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Department${/}Company.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
Check product registration
    [Tags]    checkproduct  checkproduct1
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables   PD=PD 1  SC=SC 1
    Go To Product List By Department
    Input Valid Value    Add New Product Button
    Sleep    3s
    Fill Product By Department
    Sleep    5s
    #[Teardown]    Close All Browsers

To check when Marketing Head can add more price components for a product (One time a day i.e. same proce component can't be added on same date)
    [Tags]    checkproduct  checkproduct2
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables  PD=PD 1  SC=SC 1
    Go To Product List By Department
    Wait Until Keyword Succeeds    2s    400ms    Input Valid Value    Product Search By Name    ${PD["Product Name"]}
    Sleep    2s
    Click Element    //span[contains(text(),'${PD["Product Name"]}')]/../following-sibling::td/i[@title='Edit']
    Sleep    1s
    set test variable  ${effectiveFrom}  ${testData["Product Add Price"]["Effective from"]}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]
    run keyword if  ${status} == ${True}  click element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]/following-sibling::td//i[@id='iconDeletePrice']
    run keyword if  ${status} == ${True}  sleep  5s
    Click Button    btnPriceAddNew
    Add Product Price
    Sleep    2s
    Click Button    btnSubmit
    Sleep    10s
    set test variable  ${effectiveFrom}  ${testData["Product Add Interest"]["Interest Effective from"]}
    ${status}  run keyword and return status  page should contain element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]
    run keyword if  ${status} == ${True}  click element  //td[contains(text(),'${effectiveFrom["Date"]}-${effectiveFrom["Month"]}-${effectiveFrom["Year"]}')]/following-sibling::td//i[@id='iconDeleteInterest']
    run keyword if  ${status} == ${True}  sleep  5s
    Click Button    btnInterestAddNew
    Add Product Interest Rate
    Sleep    3s
    Click Button    btnSubmit
    Wait Until Keyword Succeeds    2s    400ms    Input Valid Value    Product Details Submit Button
    Sleep    5s
    #[Teardown]    Close All Browsers
