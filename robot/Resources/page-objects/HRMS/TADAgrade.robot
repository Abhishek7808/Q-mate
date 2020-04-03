*** Settings ***
Documentation    Add, edit and delete TA/DA grade. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/

*** Keywords ***
Go To TA/DA Grade Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Button
    click element  modals-bootbox-custom
    switch window  NEW

Click On Edit Button
    [Arguments]  ${gradeName}
    click element  //td[contains(text(),'${gradeName}')]/following-sibling::td//i[@class='fa fa-pencil']

Click On Delete Button
    [Arguments]  ${gradeName}
    click element  //td[contains(text(),'${gradeName}')]/following-sibling::td//i[@class='fa fa-trash-o']

Click On Revise Button
    [Arguments]  ${gradeName}
    click element  //td[contains(text(),'${gradeName}')]/following-sibling::td//i[@class='fa fa-pencil-square-o']
    switch window  NEW

Delete TA/DA Grade
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    press keys  //button[@class='btn btn-primary']  ENTER

Fill Details Into TA/DA Grade Form
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Grade"]}  ${dataDictionary["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Min Range"]}  ${dataDictionary["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Max Range"]}  ${dataDictionary["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Level Number"]}  ${dataDictionary["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designaton"]}  ${dataDictionary["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}

Edits Details Of TA/DA grade
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Effective From"]}  ${dataDictionary["Edit TA/DA Grade"]["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Min Range"]}  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Max Range"]}  ${dataDictionary["Edit TA/DA Grade"]["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Edit TA/DA Grade"]["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]}  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Designaton"]}  ${dataDictionary["Edit TA/DA Grade"]["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}

Fill Revised Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Revised Effective From"]}  ${dataDictionary["Revised Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Min Range"]}  ${dataDictionary["Basic Pay Min Range"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Basic Pay Max Range"]}  ${dataDictionary["Basic Pay Max Range"]["Value"]}
    ${webelements}  get webelements  ${dataDictionary["Level Number"]["Locator"]["Locator0"]}
    set to dictionary  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Locator"]}  Locator1=${webelements}[0]
    set to dictionary  ${dataDictionary["Designaton"]["Locator"]}  Locator1=${webelements}[1]
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]}  ${dataDictionary["Edit TA/DA Grade"]["Level Number"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designaton"]}  ${dataDictionary["Designaton"]["Value"]}
    click element  ${dataDictionary["Basic Pay Max Range"]["Locator"]}

Save Details
    click button  btnSave

Search For TA/DA grade
    [Arguments]  ${value}
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Check For TA/DA grade Entry In TA/DA grade Table
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For TA/DA grade Deletion In TA/DA grade Table
    [Arguments]  ${value}
    Page should not contain element  //td[contains(text(),'${value}')]