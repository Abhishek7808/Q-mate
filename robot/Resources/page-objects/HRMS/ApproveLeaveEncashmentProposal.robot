*** Keywords ***
Go To Leave Encashment Proposal Approval Page
    [Documentation]  Opens leave encashment propsal page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/LeaveEncashmentProposal?comefrom=app

Open Filters
    [Documentation]  Clicks on open filter button.
    Wait Until Page Contains Element    //input[@id='SearchText']
    Input Text   //input[@id='SearchText']      ${EMPLOYEEID}
    click element  //i[@class='fa fa-filter']


Select Employee Location
    [Documentation]  Takes employee location as argument and selects it from the dropdown.
    [Arguments]  ${EMPLOYEELOATION}
    click element  //a[@class='select2-choice']//div//b
    sleep  2s
    input text  //*[@id="select2-drop"]/div/input  ${EMPLOYEELOATION}
    press keys  //*[@id="select2-drop"]/div/input  ENTER

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
    Wait Until Page Contains Element    //a[contains(text(),'Approve')]
    click element  //a[contains(text(),'Approve')]
    sleep  2s
    click element  //button[@class='btn btn-primary']
    Sleep   5s

Issue Order
    [Documentation]  Clicks on issue order button then clicks on save button.
    Wait Until Page Contains Element    //a[contains(text(),'Issue Order')]
    click element  //a[contains(text(),'Issue Order')]
    sleep  3s
    input text   //textarea[@id='OrderRemarks']   xyz
    click element  //input[@id='btnSave']
    Sleep  3s

Edit the record
    [Documentation]  Click the edit button from list view and Enter in form.
    Wait Until Page Contains Element    //div[@id='classListing']//tr[1]//i[@class='fa fa-eye']
    Sleep   3S
    Click Element   //div[@id='classListing']//tr[1]//i[@class='fa fa-eye']
    Wait Until Page Contains    Leave Encashment Proposal