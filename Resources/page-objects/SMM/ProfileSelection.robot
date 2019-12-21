*** Settings ***
Documentation    Suite description

*** Variables ***
${purchaser}        //div[contains(text(),'I want to purchase mineral')]
${transporter}      //div[contains(text(),'I'm am Agent/Transporter')]
${customer}         //div/button//span[text()='Customer']
${agent}            //div/button//span[text()='Agent']
*** Keywords ***

Select Profile Of Customer
    [Arguments]  ${customerType}
    run keyword if  ${customerType} == 'purchaser'  Click Element   ${purchaser}  ELSE  CLick Element    ${transporter}

Create New Acccount
    [Arguments]  ${accountType}
    run keyword if  ${accountType} == 'customer'  Click Element   ${customer}  ELSE  CLick Element    ${agent}
