*** Variables ***
${actions}  //div[contains(@class,'heading-buttons border-bottom innerLR')]//a[contains(@class,'btn btn-primary')][contains(text(),'Actions')]
${processButton}  //a[@class='OpenAddEdit'][contains(text(),'Process')]
${processSalary}  //a[@id='btnSave']
${lock}  //a[contains(text(),'Lock')]
${lockConfirm}  //button[contains(text(),'OK')]
${finalProcess}  //input[@id='btnSave']
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

Select Employee
    select checkbox  //tr[1]//td[1]//input[1]

Click On Lock
    sleep  2s
    click element  ${lock}

Lock Salary
    wait until page contains  Do you really want to Lock selected record(s) ?
    sleep  2s
    click element  ${lockConfirm}
    sleep  2s
    capture page screenshot




