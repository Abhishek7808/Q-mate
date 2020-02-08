*** Variables ***
${pageUrl}  HRM/SalaryCycle
${addSalaryCycle}  //a[@id='modals-bootbox-custom']
${save}  //input[@id='btnSave']

*** Keywords ***
Go To Salary Cycle Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}
    sleep  2s

Click On Add Button
    click element  ${addSalaryCycle}

Fill Salary Cycle Form
    [Arguments]  ${dataDictionary}
    ${financialYear}  Common_Keywords.Get Current Financial Year
    ${salaryCycleName}  SalaryCycle.Get Current Salary Cycle
    ${currentMonth}  Common_Keywords.Get Current Month
    ${currentYear}  Common_Keywords.Get Current Year
    FillFields.Input Value Into Field  ${dataDictionary["Description"]}  ${salaryCycleName}
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
    FillFields.Input Value Into Field  ${dataDictionary["Type"]}  ${dataDictionary["Type"]["Value"]}
    set to dictionary  ${dataDictionary["Start_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}  ### """ Values are filled dynamically"""
    FillFields.Input Value Into Field  ${dataDictionary["Start_Date"]}  ${dataDictionary["Start_Date"]["Value"]}
    ${lastDayOfMonth}  Count Current Month days  ###"""Keyword is defined in Addendums.py file """
    set to dictionary  ${dataDictionary["End_Date"]["Value"]}  Day=${lastDayOfMonth}  Month=${currentMonth[0:3]}  Year=${currentYear}
    FillFields.Input Value Into Field  ${dataDictionary["End_Date"]}  ${dataDictionary["End_Date"]["Value"]}

Get Current Salary Cycle
    ${currentDate}  get current date
    ${date}  convert date  ${currentDate}  result_format= %B %Y
    return from keyword  ${date}

Submit Details
    click button  ${save}
    capture page screenshot

