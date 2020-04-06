*** Settings ***
Documentation    Add, edit and delete grade dependancy. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/

*** Keywords ***
Go To Grade Dependancy Page
    [Documentation]  Opens grade dependancy page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Dependancy Button
    [Documentation]  Clicks on add new link.
    click element  modals-bootbox-custom

Fill Details
    [Documentation]  Fills details into grade dependancy form.
    [Arguments]  ${dataDictionary}
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    log to console  ${lastGradeDate}
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    log to console  ${day}-${month}-${year}
    ${intday}  convert to integer  ${day}
    ${day}  run keyword if  ${intday}<10  remove string  ${day}  0  ELSE  set variable  ${day}
    ${day}  convert to integer  ${day}
    ${day}  set variable  ${day+1}
    set to dictionary  ${dataDictionary["Effective From"]["Value"]}  Day=${day}  Month=${month}  Year=${year}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]}  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]}  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]}  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Designation"]}  ${dataDictionary["TA/DA Grade depends on"]["Designation"]["Value"]}

Edit Grade Dependancy Details
    [Documentation]  Edit details into grade dependancy form.
    [Arguments]  ${dataDictionary}
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    log to console  ${lastGradeDate}
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    log to console  ${day}-${month}-${year}
    ${intday}  convert to integer  ${day}
    ${day}  run keyword if  ${intday}<10  remove string  ${day}  0  ELSE  set variable  ${day}
    ${day}  convert to integer  ${day}
    ${day}  set variable  ${day+1}
    set to dictionary  ${dataDictionary["Effective From"]["Value"]}  Day=${day}  Month=${month}  Year=${year}
    set to dictionary  ${dataDictionary["Edit"]}  Locator=//td[contains(text(),'${lastGradeDate}')]/following-sibling::td//i[@class='fa fa-pencil']
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]}  ${dataDictionary["TA/DA Grade depends on"]["Basic Pay"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]}  ${dataDictionary["TA/DA Grade depends on"]["Pay Scale"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]}  ${dataDictionary["TA/DA Grade depends on"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["TA/DA Grade depends on"]["Designation"]}  ${dataDictionary["TA/DA Grade depends on"]["Designation"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    click button  btnSave

Delete Grade Dependancy
    [Documentation]  Fetches date of latest grade created and clicks on delete button related to it and then clicks on OK button.
    [Arguments]  ${dataDictionary}
    ${numberOfRows}  get element count  //div[@id='TADAGradeListing']//tr
    ${lastGradeDate}  get table cell  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']  ${numberOfRows}  2
    ${date}  split string  ${lastGradeDate}  -
    ${day}  set variable  ${date}[0]
    ${month}  set variable  ${date}[1]
    ${year}  set variable  ${date}[2]
    set to dictionary  ${dataDictionary["Delete"]}  Locator=//td[contains(text(),'${lastGradeDate}')]/following-sibling::td//i[@class='fa fa-trash-o']
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Check For Grade Dependancy Entry In Grade Dependancy Table
    [Documentation]  Checks that given grade dependancy is listed on the current page.
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]

Check For Grade Dependancy Deletion In Grade Dependancy Table
    [Documentation]  Checks that given grade dependancy is not listed on the current page.
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]