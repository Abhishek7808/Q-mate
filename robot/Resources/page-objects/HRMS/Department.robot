*** Settings ***
Documentation    Create, edit and delete Department, for more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/

*** Keywords ***
Go To Department Page
    [Documentation]  Opens department page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Department Button
    [Documentation]  Clicks on add department page.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Click On Delete Button
    [Documentation]  Takes department name as argument and clicks on delete button then clicks on ok button.
    [Arguments]  ${departmentName}
    click element  //td[contains(text(),'${departmentName}')]/following-sibling::td//i[@class='fa fa-trash-o']
    wait until page contains   Are you Sure to Delete this Record?
    click element  //button[contains(text(),'OK')]
    reload page

Fill Department Details
    [Documentation]  Fills department name in the department form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}

Save Details
    [Documentation]  Clicks on save details button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Department
    [Documentation]  Takes department name as argument and searches it in the list.
    [Arguments]  ${departmentName}
    input text  SearchText  ${departmentName}
    click button  BtnSearchfilter

Check For Department Entry In Department Table
    [Documentation]  Takes department name as arguement checks that it is visible in the table.
    [Arguments]  ${departmentName}
    Page should contain element  //td[contains(text(),'${departmentName}')]

Check For Department Deletion In Department Table
    [Documentation]  Takes department name as arguement checks that it is not visible in the table.
    [Arguments]  ${departmentName}
    Page should not contain element  //td[contains(text(),'${departmentName}')]