*** Keywords ***
Go To Leave Encashment Proposal Approval Page
    [Documentation]  Opens leave encashment propsal page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/LeaveEncashmentProposal?comefrom=app

Open Filters
    [Documentation]  Clicks on open filter button.
    click element  //i[@class='fa fa-filter']

Select Employee Location
    [Documentation]  Takes employee location as argument and selects it from the dropdown.
    [Arguments]  ${EMPLOYEELOATION}
    click element  //a[@class='select2-choice']//div//b
    sleep  2s
    input text  //input[@class='select2-input']  ${EMPLOYEELOATION}
    press keys  //input[@class='select2-input']  ENTER

Apply Filters
    [Documentation]  Clicks on apply filter.
    click element  //button[@id='btnformfilter']

Search Employee
    [Documentation]  Takes employee name as argument and searches it.
    [Arguments]  ${EMPLOYEENAME}
    input text  //input[@id='SearchText']  ${EMPLOYEENAME}
    click element  //button[@id='BtnSearchfilter']

Click On View Button
    [Documentation]  Clicks on view button.
    [Arguments]  ${EMPLOYEENAME}
    click element  //a[contains(@class,'btn btn-sm btn-success')]
    page should contain  ${EMPLOYEENAME}

Click On Action Button
    [Documentation]  Clicks on action button.
    Click element  //i[@class='fa fa-fw fa-angle-down']

Approve Proposal
    [Documentation]  Clicks on approve button then clicks on ok button.
    click element  //a[contains(text(),'Approve')]
    sleep  2s
    click element  //button[@class='btn btn-primary']

Issue Order
    [Documentation]  Clicks on issue order button then clicks on save button.
    click element  //a[contains(text(),'Issue Order')]
    sleep  2s
    input text  //textarea[@id='OrderRemarks']  xyz
    click element  //input[@id='btnSave']