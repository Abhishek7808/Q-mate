*** Variables ***
${pageUrl}  SMM/LoadingAdvice/LoadingAdviceList

*** Keywords ***
Go To Loading Advice List
    [Documentation]  Opens loading advice page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Open Loading Advice
    [Documentation]  Takes branch name as argument and opens details of corresponding loading advice.
    [Arguments]  ${branchName}
    click element  //span[contains(text(),'${branchName}')]/../preceding-sibling::td//input

Approve Loading Advice
    [Documentation]  Clicks on loading advice button.
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnApproveLoadingAdvice
    Wait Until Keyword Succeeds    5s    200ms    Click Button    tabApproved