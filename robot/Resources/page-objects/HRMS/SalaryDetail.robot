*** Variables ***
${actions}  //div[contains(@class,'heading-buttons border-bottom innerLR')]//a[contains(@class,'btn btn-primary')][contains(text(),'Actions')]
${processButton}  //a[@class='OpenAddEdit'][contains(text(),'Process')]
${processSalary}  //a[@id='btnSave']
${lock}  //a[contains(text(),'Lock')]
${lockConfirm}  //button[contains(text(),'OK')]
${finalProcess}  //input[@id='btnSave']
${employeeStatus}  Status
${filterButton}  //button[@class='btn btn-default']
${applyFilterButton}  btnformfilter

*** Keywords ***
Go To Salary Detail Page
    [Documentation]  Opens salary detail page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Action Button
    [Documentation]  Clicks on action button.
    click element  ${actions}

Click On Process
    [Documentation]  Clicks on process button.
    click element  ${processButton}

Click On Process button
    [Documentation]  Clicks on process salary text.
    click element  ${processSalary}

Process Salary
    [Documentation]  Clicks on Ok button.
    click element  ${finalProcess}
    wait until page contains  No data available in table  50s
    sleep  10s

Open Filters
    [Documentation]  Clicks on open filter button.
    click element  ${filterButton}
    ${status}  run keyword and return status  wait until element is visible  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  SalaryDetail.Open Filters

Apply Filters
    [Documentation]  Clicks on apply filter button.
    click element  ${applyFilterButton}
    wait until element is not visible  //div[@id='LoadingImage']//div//img  150

Select Employee
    [Documentation]  Number of employees is given by user, selects given number of employees for marking attendance.
    wait until element is not visible  //div[@id='LoadingImage']//div//img  300
    FOR  ${employee}  IN RANGE  1  ${NUMBER_OF_EMPLOYEES}+1
    \   select checkbox  //tr[${employee}]//td[1]//input[1]

Click On Lock
    [Documentation]  Clicks on lock button.
    sleep  2s
    click element  ${lock}

Lock Salary
    [Documentation]  Waits for the popup to be appreared and then clicks on OK button.
    wait until page contains  Do you really want to Lock selected record(s) ?
    sleep  2s
    click element  ${lockConfirm}
    sleep  2s
    capture page screenshot

Select Employee Location
    [Documentation]  Selects employee location form the dropdown.
    [Arguments]  ${dataDictionary}
    click element  ${dataDictionary["Employee Location"]["Locator"]["Locator1"]}
    sleep  2s
    @{locators}  get webelements  //label[contains(text(),'${EMPLOYEELOCATION}')]
    FOR  ${locator}  IN  @{locators}
    \   run keyword and ignore error  click element  ${locator}
    press keys  ${dataDictionary["Employee Location"]["Locator"]["Locator1"]}  TAB

Select All Employees
    [Documentation]  Selects all employees for processing salaries.
    switch window  NEW
    ${status}  set variable  ${TRUE}
    FOR  ${page}  IN RANGE  30
    \   SalaryDetail.Select Employees  //input[@id='chk_all']
    \   capture page screenshot
    \   EXIT FOR LOOP IF  ${status} == ${FALSE}
    \   ${status}  Click On Next Button

Click On Next Button
    [Documentation]  Clicks on next button.
    click element  //a[contains(text(),'Next')]
    ${nextStatus}  run keyword and return status  page should not contain element  //li[@class='next disabled']
    return from keyword  ${nextStatus}

Select Employees
    [Documentation]  Selects all listed employees.
    [Arguments]  ${checkboxLocator}
    unselect checkbox  ${checkboxLocator}
    select checkbox  ${checkboxLocator}

Click On Actions Button
    [Documentation]  Clicks on action button.
    wait until page contains element  //th[contains(text(),'S.No.')]
    sleep  2s
    click element  //div[contains(@class,'btn-group-xs pull-right input-group')]//a[contains(@class,'btn btn-primary')][contains(text(),'Actions')]

Open Salary Slip
    [Documentation]  Opens salary slip.
    sleep  5s
    click element  //div[contains(@class,'btn-group-xs pull-right input-group open')]//ul[contains(@class,'dropdown-menu pull-right')]

Verify Salary Slip
    [Documentation]  Checks that correct employee code is written on the salary slip.
    ${employeeCode}  Get File  ${EMPLOYEE_FILE}
    page should contain  ${employeeCode}

Enter Employee Code In Search Box
    [Documentation]  Enters employee code in the search box.
    ${employeeCode}  Get File  ${EMPLOYEE_FILE}
    input text  //input[@id='SearchText']  ${employeeCode}

Click On Search Button
    [Documentation]  Clicks on search button.
    click element  //button[@id='BtnSearchfilter']//i[contains(@class,'fa fa-search')]
    sleep  7s