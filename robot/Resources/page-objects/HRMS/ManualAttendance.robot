*** Variables ***
${markAttendance}  //a[contains(@class,'btn btn-primary OpenAddEdit')]
${process}  //a[contains(text(),"Process")]
${openFilters}  //i[@class='fa fa-filter']
${financialYearFilter}  ddlFinyearFilter
${salaryCycleFilter}  //select[@id='ddlSalaryCycleIdFilter']
${applyFilters}  //button[@id='btnformfilter']
${actionButton}  //a[@class='btn btn-primary drpWorkflowAction']
${verify}  //a[contains(text(),'Verify')]
${confirmVerify}  //button[contains(text(),'OK')]
${approve}  //a[contains(text(),'Approve')]
${confirmApprove}  //button[contains(text(),'OK')]
${employeeTable}  //table[@id='tab']

*** Keywords ***
Go To Manual Attendance Page
    [Documentation]  Opens Manual Attendance Page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Mark Attendance Button
    [Documentation]  Clicks on Mark Attendance button and opens Mark Attendance filter.
    Click element  ${markAttendance}
    sleep  2s

#Select Financial Year
#    [Documentation]  Selects Financial Year in Mark Attendance Filter.
#    [Arguments]  ${dataDictionary}
#    ${currentFinancialYear}  Common_Keywords.Get Current Financial Year
#    ${financialYear}  set variable if  ${FINANCIALYEAR1} == None  ${currentFinancialYear}  ${FINANCIALYEAR1}          ###""" If User does not gives Financial Year then current financial year will be selected"""
#    set global variable  ${financialYear}
#    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
#    sleep  2s
#
#Select Month
#    [Documentation]  Selects Salary Cycle Month in Mark Attendance Filter
#    [Arguments]  ${dataDictionary}
#    ${salaryCycleName}  SalaryCycle.Get Current Salary Cycle
#    set global variable  ${salaryCycleName}
#    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${dataDictionary["Month"]["Locator"]}  ${SALARYCYCLEID}        ###""" If User does not gives Salary cycle then Current SAlary Cycle will be selected."""
#    run keyword if  ${SALARYCYCLEID} == None  FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}

Apply Criteria
    [Documentation]  Clicks on Apply Filter Button.
    click element  ${process}
    switch window  NEW

Select Employees
    FOR  ${employee}  IN RANGE  1  ${NUMBER_OF_EMPLOYEES}+1
    \   select checkbox  ${employeeTable}/tbody/tr[${employee}]/td[1]/input

Click On Submit Button
    click element  //input[@id='btnsave']

Verify Submit Popup
    wait until page contains  Do you want to submit attendance for the selected employees?

Click On Ok Button
    sleep  4s
    click element  //button[contains(@class,'btn btn-primary')]
    sleep  4s

Open Filters
    click element  ${openFilters}

Select Financial Year Filter
    select from list by value  ${financialYearFilter}  ${financialYear}

Select Salary Cycle Filter
    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${salaryCycleFilter}  ${SALARYCYCLEID}
    run keyword if  ${SALARYCYCLEID} == None  select from list by label   ${salaryCycleFilter}  ${salaryCycleName}

#Select Pay Group Filter
#    FillFields.Input Value Into Field  ${dataDictionary["Pay Group"]}  ${PAYGROUP}

Apply Filters
    click element  ${applyFilters}

Click On Actions Button
    click element  //td[contains(text(),'${PAYGROUP}')]/following-sibling::td[contains(text(),'Submitted')]/following-sibling::td${actionButton}

Verify Attendance
    wait until element is visible  ${verify}
    click element  ${verify}
    wait until page contains  Do you really want to Verify selected record(s) ?
    wait until element is enabled  ${confirmVerify}
    sleep  2s
    click element  ${confirmVerify}

Choose Approve
    wait until element is visible  ${approve}
    click element  ${approve}
    wait until page contains  Do you really want to Approve selected record(s) ?
    wait until element is enabled  ${confirmApprove}
    sleep  2s
    click element  ${confirmApprove}