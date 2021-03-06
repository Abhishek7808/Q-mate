*** Variables ***
${addNewEntry}  //a[@id='modals-bootbox-custom']
${submit}  //input[@id='btnSubmit']

*** Keywords ***
Go To Third Party Deduction Page
    [Documentation]  Opens third party deduction page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On ADD New Entry Button
    [Documentation]  clicks on add new entry button.
    click element  ${addNewEntry}

Select Employee
    [Documentation]  Takes employee name as argument and selects it from the dropdown.
    [Arguments]  ${dataDictionary}  ${employeeCode}
    FillFields.Input Value Into Field  ${dataDictionary["Employee_Name"]}  ${employeeCode}

Fill Third Party Deduction
    [Documentation]  Fills third party deduction form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Deduction_type"]}  ${dataDictionary["Deduction_type"]["Value"]}
    ###""" ${currentMonth} and ${currentYear} variables were set from "__init__.robot" file in the beginning of this suit."""
    set to dictionary  ${dataDictionary["Start_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}
    InputFields.Input Date  ${dataDictionary["Start_Date"]["Locator"]}  ${dataDictionary["Start_Date"]["Value"]}
    ${lastDayOfMonth}  Count Current Month days                         ###"""Keyword is defined in Addendums.py file """
    set to dictionary  ${dataDictionary["End_Date"]["Value"]}  Day=${lastDayOfMonth}  Month=${currentMonth[0:3]}  Year=${currentYear}
    InputFields.Input Date  ${dataDictionary["End_Date"]["Locator"]}  ${dataDictionary["End_Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Amount"]}  ${dataDictionary["Amount"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    click element  ${submit}
