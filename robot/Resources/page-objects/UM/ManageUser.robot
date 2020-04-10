*** Variables ***
${actionEMP}  //a[contains(text(),'Actions')]
${Impersonate}  //a[contains(text(),'Impersonate')]
${impersonateOkButton}  //button[contains(text(),'OK')]
${selfVarificationPopupText}  //h3[contains(text(),'Your details are not Self Verified.')]

*** Keywords ***
Go To Manage User Page
    [Documentation]  Opens Manage User page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/URM/user

Search Employee
    [Documentation]  Searches employee by name.
    [Arguments]  ${EmployeeCode}
    input text  //input[@id='SearchText']  ${EmployeeCode}
    click element  //div[@id='DivSearchPanel']//div[1]

Impersonate Employee
    [Documentation]  Does impersonate process.
    Sleep  5s
    click element  ${actionEMP}
    Sleep  2s
    click element  ${Impersonate}
    sleep  2s
    click element  ${impersonateOkButton}
    sleep  2s
    ${status}  run keyword and return status  page should contain element  ${selfVarificationPopupText}
    run keyword if  ${status} == ${True}  click element  //button[@id='btnSkip']
    capture page screenshot