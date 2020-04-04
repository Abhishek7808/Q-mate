*** Variables ***
${purchaser}         //div[contains(text(),'I want to purchase mineral')]
${transporter}       //div[contains(text(),'I'm am Agent/Transporter')]
${customer}          //div/button//span[text()='Customer']
${agent}             //div/button//span[text()='Agent']

*** Keywords ***

Select Profile Of Customer
    [Documentation]  Takes customer type as argument and selects approproiate customer.
    [Arguments]  ${customerType}
    run keyword if  '${customerType}' == 'purchaser'  Click Element   ${purchaser}  ELSE  CLick Element    ${transporter}

Create New Acccount
    [Documentation]  Takes account type as argument and selects appropriate account.
    [Arguments]  ${accountType}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    run keyword if  '${accountType}' == 'customer'  Click Element   ${customer}  ELSE  CLick Element    ${agent}

Select Branch Of The given Company
    [Documentation]  Takes branch name and company name as argument and opens correspondings details.
    [Arguments]  ${branchName}  ${companyName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${branchName}, ${companyName}')]

