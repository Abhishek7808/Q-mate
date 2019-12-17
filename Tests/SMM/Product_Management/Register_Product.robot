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

Suite Setup       Start Testing
Suite Teardown    Finish Testing


*** Test Cases ***
Check product registration
    [Tags]    checkproduct  checkproduct1
    Switch To    Department
    Set Test Variables   PD=PD 1  SC=SC 1
    Go To Product List By Department
    Input Valid Value    Add New Product Button
    Sleep    3s
    Fill Product By Department
    Sleep    5s
    [Teardown]    Close All Browsers

To check when Marketing Head can add more price components for a product
    [Tags]    checkproduct  checkproduct2
    Switch To    Department
    Set Test Variables  PD=PD 1  SC=SC 1
    Go To Product List By Department
    Wait Until Keyword Succeeds    2s    400ms    Input Valid Value    Product Search By Name    ${PD["Product Name"]}
    Sleep    2s
    Click Element    //span[contains(text(),'${PD["Product Name"]}')]/../following-sibling::td/i[@title='Edit']
    Sleep    1s
    Click Button    btnPriceAddNew
    Add Product Price
    Sleep    2s
    Click Button    btnSubmit
    Sleep    10s
    Click Button    btnInterestAddNew
    Add Product Interest Rate
    Sleep    3s
    Click Button    btnSubmit
    Wait Until Keyword Succeeds    2s    400ms    Input Valid Value    Product Details Submit Button
    Sleep    5s
    [Teardown]    Close All Browsers
