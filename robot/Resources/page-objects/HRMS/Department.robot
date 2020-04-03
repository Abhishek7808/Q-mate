*** Settings ***
Documentation    Create, edit and delete Department, for more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/

*** Keywords ***
Go To Department Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Department Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Click On Delete Button
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]/following-sibling::td//i[@class='fa fa-trash-o']
    wait until page contains   Are you Sure to Delete this Record?
    click element  //button[contains(text(),'OK')]
    reload page

Fill Department Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}

Save Details
     [Arguments]  ${dataDictionary}
     FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Department
    [Arguments]  ${value}
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Check For Department Entry In Department Table
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Department Deletion In Department Table
    [Arguments]  ${value}
    Page should not contain element  //td[contains(text(),'${value}')]