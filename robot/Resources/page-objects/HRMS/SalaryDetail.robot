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
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Action Button
    click element  ${actions}

Click On Process
    click element  ${processButton}

#Select Financial Year
#    [Arguments]  ${dataDictionary}
#    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
#    sleep  2s
#
#Select Month
#    [Arguments]  ${dataDictionary}
#    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${dataDictionary["Month"]["Locator"]}  ${SALARYCYCLEID}
#    run keyword if  ${SALARYCYCLEID} == None  FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}

Click On Process button
    click element  ${processSalary}

Process Salary
    click element  ${finalProcess}
    wait until page contains  No data available in table  50s
    sleep  10s

Open Filters
    click element  ${filterButton}
    ${status}  run keyword and return status  wait until element is visible  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  SalaryDetail.Open Filters

Apply Filters
    click element  ${applyFilterButton}

Select Employee
    wait until element is not visible  //div[@id='LoadingImage']//div//img  300
    FOR  ${employee}  IN RANGE  1  ${NUMBER_OF_EMPLOYEES}+1
    \   #page should contain element  //span[contains(text(),'Withheld')]
    \   #click element  //span[contains(text(),'Withheld')]/preceding-sibling::input
    \   select checkbox  //tr[${employee}]//td[1]//input[1]

Click On Lock
    sleep  2s
    click element  ${lock}

Lock Salary
    wait until page contains  Do you really want to Lock selected record(s) ?
    sleep  2s
    click element  ${lockConfirm}
    sleep  2s
    capture page screenshot

Select Employee Location
    [Arguments]  ${dataDictionary}
    click element  ${dataDictionary["Employee Location"]["Locator"]["Locator1"]}
    sleep  2s
    @{locators}  get webelements  //label[contains(text(),'${EMPLOYEELOCATION}')]
    FOR  ${locator}  IN  @{locators}
    \   run keyword and ignore error  click element  ${locator}
    press keys  ${dataDictionary["Employee Location"]["Locator"]["Locator1"]}  TAB
#    ${listLength}  get length   ${locators}
#    click element  ${locators}[${listLength-2}]
#    press keys  ${dataDictionary["Employee Location"]["Locator"]["Locator1"]}  TAB
#    ${status}  run keyword and return status  click element  ${locators}[1]
#    run keyword if  ${status} == ${FALSE}  click element  ${locators}[1]

Select All Employees
    switch window  NEW
    ${status}  set variable  ${TRUE}
    FOR  ${page}  IN RANGE  30
    \   SalaryDetail.Select Employees  //input[@id='chk_all']
    \   capture page screenshot
    \   EXIT FOR LOOP IF  ${status} == ${FALSE}
    \   ${status}  Click On Next Button

Click On Next Button
#    ${nextLocator}  get webelements  //li[@class='next disabled']
#    page should not contain  ${nextLocator}[0]
    click element  //a[contains(text(),'Next')]
    ${nextStatus}  run keyword and return status  page should not contain element  //li[@class='next disabled']
    return from keyword  ${nextStatus}

Select Employees
    [Arguments]  ${checkboxLocator}
    unselect checkbox  ${checkboxLocator}
    select checkbox  ${checkboxLocator}

Click On Actions Button
    #${employeeCode}  Get File  ${EMPLOYEE_FILE}
    #click element  //span[contains(text(),'${employeeCode}')]/following-sibling::td//[contains(text(),'Actions')]
    wait until page contains element  //th[contains(text(),'S.No.')]
    sleep  2s
    click element  //div[contains(@class,'btn-group-xs pull-right input-group')]//a[contains(@class,'btn btn-primary')][contains(text(),'Actions')]

Open Salary Slip
    sleep  5s
    #click element  //span[contains(text(),'${employeeCode}')]/following-sibling::a[@id='lnkMultipleSalarySlip_724902']
    click element  //div[contains(@class,'btn-group-xs pull-right input-group open')]//ul[contains(@class,'dropdown-menu pull-right')]

Verify Salary Slip
    ${employeeCode}  Get File  ${EMPLOYEE_FILE}
    page should contain  ${employeeCode}

Enter Employee Code In Search Box
    ${employeeCode}  Get File  ${EMPLOYEE_FILE}
    input text  //input[@id='SearchText']  ${employeeCode}

Click On Search Button
    click element  //button[@id='BtnSearchfilter']//i[contains(@class,'fa fa-search')]
    sleep  7s
    #wait until page contains element  //th[contains(text(),'S.No.')]  15s
