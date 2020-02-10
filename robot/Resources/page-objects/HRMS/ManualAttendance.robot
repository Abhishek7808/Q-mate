*** Variables ***
${markAttendance}  //a[contains(@class,'btn btn-primary OpenAddEdit')]
${process}  //a[@id='btnSave']

*** Keywords ***
Go To Manual Attendance Page
    [Documentation]  Opens Manual Attendance Page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Mark Attendance Button
    [Documentation]  Clicks on Mark Attendance button and opens Mark Attendance filter.
    Click element  ${markAttendance}
    sleep  2s

Select Financial Year
    [Documentation]  Selects Financial Year in Mark Attendance Filter.
    [Arguments]  ${dataDictionary}
    ${currentFinancialYear}  Common_Keywords.Get Current Financial Year
    log to console  ${FINANCIALYEAR1}
    ${financialYear}  set variable if  ${FINANCIALYEAR} == None  ${currentFinancialYear}  ${FINANCIALYEAR1}          ###""" If User does not gives Financial Year then current financial year will be selected"""
    #\
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
    sleep  2s

Select Month
    [Documentation]  Selects Salary Cycle Month in Mark Attendance Filter
    [Arguments]  ${dataDictionary}
    ${salaryCycleName}  SalaryCycle.Get Current Salary Cycle
    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${dataDictionary["Month"]["Locator"]}  ${SALARYCYCLEID}        ###""" If User does not gives Salary cycle then Current SAlary Cycle will be selected."""
    run keyword if  ${SALARYCYCLEID} == None  FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}

Apply Filters
    [Documentation]  Clicks on Apply Filter Button.
    click element  ${process}
    sleep  4s
    capture page screenshot