*** Settings ***
Documentation    Add edit and delete Payment type. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/

*** Keywords ***
Go To Payment Type Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Payment Type Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add Payment Type"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Select Payment Type
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Payment Type
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Fill Payment Type Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Description"]}  ${dataDictionary["Description"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
Search For Payment Type
    [Arguments]  ${value}
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Check For Payment Type Entry In Payment Type Table
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Payment Type Deletion In Payment Type Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Description"]["Value"]}')]