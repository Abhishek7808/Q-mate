*** Settings ***
Documentation    Create, edit and delete designations. For more info visit http://support.e-connectsolutions.com/erp/how-to/designation/

*** Keywords ***
Go To Designation Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Designation

Search For Designation
    [Arguments]  ${dataDictionary}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Designation Entry In Designation Table
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Designation Deletion In Designation Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Click On Add New Designation Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary}

Fill Designation Form
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Post"]}  ${dataDictionary["Post"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Fourth Class"]}  ${dataDictionary["Is Fourth Class"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Input Designation Name Into Search Box
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${value}

Click On Search Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    page should contain element  //a[@class='btn btn-success OpenAddEdit']  5s
    wait until page contains element   //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]  5s
    click element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]/following-sibling::td//a[@class='btn btn-success OpenAddEdit']

Edit Designation Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Name"]}  ${dataDictionary["Edit Designation"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Post"]}  ${dataDictionary["Edit Designation"]["Post"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Is Fourth Class"]}  ${dataDictionary["Edit Designation"]["Is Fourth Class"]["Value"]}

Select Designation Checkbox
    [Arguments]  ${dataDictionary}  ${desingnationName}
    #FillFields.Input Value Into Field  ${dataDictionary["Select Designation"]}  ${desingnationName}
    sleep  3s
    select checkbox  //td[contains(text(),'${desingnationName}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Designation Entry
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}


#
#Save Details
#    [Arguments]  ${dataDictionary}
#    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
