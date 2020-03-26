*** Keywords ***
Go To Leave Encashment Proposal Approval Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/LeaveEncashmentProposal?comefrom=app

Open Filters
    click element  //i[@class='fa fa-filter']

Select Employee Location
    [Arguments]  ${EMPLOYEELOATION}
    click element  //a[@class='select2-choice']//div//b
    sleep  2s
    input text  //input[@class='select2-input']  ${EMPLOYEELOATION}
    press keys  //input[@class='select2-input']  ENTER

Apply Filters
    click element  //button[@id='btnformfilter']

Search Employee
    [Arguments]  ${EMPLOYEENAME}
    input text  //input[@id='SearchText']  ${EMPLOYEENAME}
    click element  //button[@id='BtnSearchfilter']

Click On View Button
    [Arguments]  ${EMPLOYEENAME}
    click element  //a[contains(@class,'btn btn-sm btn-success')]
    page should contain  ${EMPLOYEENAME}

Click On Action Button
    Click element  //i[@class='fa fa-fw fa-angle-down']

Approve Proposal
    click element  //a[contains(text(),'Approve')]
    sleep  2s
    click element  //button[@class='btn btn-primary']

Issue Order
    click element  //a[contains(text(),'Issue Order')]
    sleep  2s
    input text  //textarea[@id='OrderRemarks']  xyz
    click element  //input[@id='btnSave']