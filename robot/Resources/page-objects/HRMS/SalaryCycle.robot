*** Variables ***
${pageUrl}  HRM/SalaryCycle
${addSalaryCycle}  //a[@id='modals-bootbox-custom']
${save}  //input[@id='btnSave']

*** Keywords ***
Go To Salary Cycle Page
    [Documentation]  Opens Salary Cycle Page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}
    sleep  2s

Click On Add Button
    [Documentation]  Clicks on Add Salary Cycle button.
    click element  ${addSalaryCycle}

Fill Salary Cycle Form
    [Documentation]  Fills Salary Cycle Details in Salary Cycle form.
    [Arguments]  ${dataDictionary}
#    ${financialYear}  Common_Keywords.Get Current Financial Year        ###""" Returns Current Financial Year """
#    ${salaryCycleName}  SalaryCycle.Get Current Salary Cycle            ###""" Returns Current Salary Cycle """
#    ${currentMonth}  Common_Keywords.Get Current Month                  ###""" Returns Current Month """
#    ${currentYear}  Common_Keywords.Get Current Year                    ###""" Returns Current Year """
    FillFields.Input Value Into Field  ${dataDictionary["Description"]}  ${currentSalaryCycleName}
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${currentFinancialYear}
    FillFields.Input Value Into Field  ${dataDictionary["Type"]}  ${dataDictionary["Type"]["Value"]}
    set to dictionary  ${dataDictionary["Start_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}  ### """ Values are filled dynamically into data dictionary"""
    FillFields.Input Value Into Field  ${dataDictionary["Start_Date"]}  ${dataDictionary["Start_Date"]["Value"]}
    ${lastDayOfMonth}  Count Current Month days  ###"""Keyword is defined in Addendums.py file """
    set to dictionary  ${dataDictionary["End_Date"]["Value"]}  Day=${lastDayOfMonth}  Month=${currentMonth[0:3]}  Year=${currentYear}
    FillFields.Input Value Into Field  ${dataDictionary["End_Date"]}  ${dataDictionary["End_Date"]["Value"]}

Get Current Salary Cycle
    [Documentation]  Returns Current Date in the 'Month Year' format.
    ${currentDate}  get current date
    ${date}  convert date  ${currentDate}  result_format= %B %Y
    return from keyword  ${date}

Submit Details
    [Documentation]  Clicks on Submit Details button.
    click button  ${save}
    capture page screenshot

