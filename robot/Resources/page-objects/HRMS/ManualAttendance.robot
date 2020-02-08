*** Variables ***
${markAttendance}  //a[contains(@class,'btn btn-primary OpenAddEdit')]
${process}  //a[@id='btnSave']

*** Keywords ***
Go To Manual Attendance Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Mark Attendance Button
    Click element  ${markAttendance}
    sleep  2s

Select Financial Year
    [Arguments]  ${dataDictionary}
    ${financialYear}  Common_Keywords.Get Current Financial Year
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}

Select Month
    [Arguments]  ${dataDictionary}
    ${salaryCycleName}  SalaryCycle.Get Current Salary Cycle
    FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}

Apply Filters
    click element  ${process}
    sleep  4s
    capture page screenshot