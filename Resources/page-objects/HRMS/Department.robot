*** Settings ***
Documentation    Create, edit and delete Department, for more info visit http://support.e-connectsolutions.com/erp/how-to/configure-department/

*** Keywords ***
Search For Department
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Department Entry In Department Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Department Deletion In Department Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]