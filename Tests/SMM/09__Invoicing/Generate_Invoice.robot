*** Settings ***
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot


*** Test Cases ***
Invoice Generation (including pending Moisture Rate)
    [Documentation]    Generates invoice from product management (moisture rebate)
    [Tags]    invoice
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Schedule In Product Management From Department
    #Click Button    Next
    Sleep    1s
    Click Element    //span[contains(text(),'Royalty')]/../following-sibling::td/i[@title='View']
    Sleep    5s
    Input Valid Value    Product Management Clear Button
    Select From List By Value    keyword    0
    Select From List By Value    keyword    6
    Click Button    btnMultiply
    Input Text    amountFormula    70
    Input Text    calculationOrder    1
    Input Valid Value    Product Management Update Button
    Sleep    3s
    Go To Invoice From Department
    Sleep    5s
    #Click Button    tabApproved
    Sleep    2s
    set test variable  ${Invoice Number}  PHOS/1920/194
    Click Element    //span[contains(text(),'${Invoice Number}')]/../following-sibling::td/i[@title='Print']
    Sleep    25s
    ${Moisture Rebate}    Get Text    //span[contains(text(),'${Invoice Number}')]/../following-sibling::td

#Check Invoice Cancellation process
#    [Tags]    Skip
#
#Check Invoice Generation for auctionable product
#    [Tags]    Skip
#
#Check that invoice generation for products with moisture rebate
#    [Tags]    Skip
