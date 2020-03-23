*** Settings ***
Documentation    Create, edit and delete cadre, For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/

*** Keywords ***
Go To Cadre Detail Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Cadre Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add Cadre"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Select Cadre
    [Arguments]  ${cadreName}
    click element  //td[contains(text(),'${cadreName}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Cadre
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}


Fill Cadre Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Cadre Detail
    [Arguments]  ${cadreName}
    input text  SearchText  ${cadreName}
    click button  BtnSearchfilter

Check For Cadre Detail Entry In Cadre Detail Table
    [Arguments]  ${cadreName}
    Page should contain element  //td[contains(text(),'${cadreName}')]

Check For Cadre Detail Deletion In Cadre Detail Table
    [Arguments]  ${cadreName}
    Page should not contain element  //td[contains(text(),'${cadreName}')]