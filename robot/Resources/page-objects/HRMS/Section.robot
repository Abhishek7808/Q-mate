*** Settings ***
Documentation    Add, edit and delete sections. For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/

*** Keywords ***
Go To Section Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add Section"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Fill Section Details
    [Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Department"]}  ${dataDictionary["Department"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Code"]}  ${dataDictionary["Code"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Active"]}  ${dataDictionary["Is Active"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Section
    [Arguments]  ${sectionName}
    input text  SearchText  ${sectionName}
    click button  BtnSearchfilter

Select Section
    [Arguments]  ${sectionName}
    select checkbox  //td[contains(text(),'${sectionName}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Section
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page

Check For Section Entry In Section Table
    [Arguments]  ${sectionName}
    Page should contain element  //td[contains(text(),'${sectionName}')]

Check For Section Deletion In Section Table
    [Arguments]  ${sectionName}
    Page should not contain element  //td[contains(text(),'${sectionName}')]

