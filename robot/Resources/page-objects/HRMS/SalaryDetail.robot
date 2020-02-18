*** Variables ***
${actions}  //div[contains(@class,'heading-buttons border-bottom innerLR')]//a[contains(@class,'btn btn-primary')][contains(text(),'Actions')]
${processButton}  //a[@class='OpenAddEdit'][contains(text(),'Process')]
${processSalary}  //a[@id='btnSave']
${lock}  //a[contains(text(),'Lock')]
${lockConfirm}  //button[contains(text(),'OK')]
${finalProcess}  //input[@id='btnSave']
${employeeStatus}  Status
${filterButton}  //i[contains(@class,'fa fa-filter')]
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
    switch window  NEW
    click element  ${finalProcess}

Open Filters
    click element  ${filterButton}

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




