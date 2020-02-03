*** Settings ***
Documentation     Create, edit and delete empanelled officer. For more info visit http://support.e-connectsolutions.com/erp/how-to/assigning-empanelled-officer/


*** Keywords ***
Search For Empanelled Officer
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Empanelled Officer Entry In Empanelled Officer Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Empanelled Officer Deletion In Empanelled Officer Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]