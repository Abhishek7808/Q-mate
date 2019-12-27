*** Settings ***
Documentation    Suite description

*** Variables ***
${pageUrl}  SMM/LoadingAdvice/LoadingAdviceList

*** Keywords ***
Go To Loading Advice List
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Open Loading Advice
    [Arguments]  ${branchName}
    click element  //span[contains(text(),'${branchName}')]/../preceding-sibling::td//input

Approve Loading Advice
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnApproveLoadingAdvice
    Wait Until Keyword Succeeds    5s    200ms    Click Button    tabApproved