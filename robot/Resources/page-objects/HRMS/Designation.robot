*** Settings ***
Documentation    Create, edit and delete designations. For more info visit http://support.e-connectsolutions.com/erp/how-to/designation/

*** Keywords ***
Search For Designation
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Designation Entry In Designation Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Designation Deletion In Designation Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]