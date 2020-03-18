*** Variables ***
${addNewEntry}  //a[@id='modals-bootbox-custom']
${submit}  //input[@id='btnSubmit']
*** Keywords ***
Go To Third Party Deduction Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On ADD New Entry Button
    click element  ${addNewEntry}

Select Employee
    [Arguments]  ${dataDictionary}  ${employeeName}
    FillFields.Input Value Into Field  ${dataDictionary["Employee_Name"]}  ${employeeName}

Fill Third Party Deduction
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Deduction_type"]}  ${dataDictionary["Deduction_type"]["Value"]}
    set to dictionary  ${dataDictionary["Start_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}
    InputFields.Input Date  ${dataDictionary["Start_Date"]["Locator"]}  ${dataDictionary["Start_Date"]["Value"]}
    ${lastDayOfMonth}  Count Current Month days  ###"""Keyword is defined in Addendums.py file """
    set to dictionary  ${dataDictionary["End_Date"]["Value"]}  Day=${lastDayOfMonth}  Month=${currentMonth[0:3]}  Year=${currentYear}
    InputFields.Input Date  ${dataDictionary["End_Date"]["Locator"]}  ${dataDictionary["End_Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Amount"]}  ${dataDictionary["Amount"]["Value"]}

Save Details
    click element  ${submit}
