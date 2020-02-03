*** Settings ***
Documentation    Add, edit and delete Hospital Empanelment. For more info visit http://support.e-connectsolutions.com/erp/how-to/hospital-empanelment-configuration/

*** Keywords ***
Search For Hospital Empanelment
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Hospital Empanelment Entry In Hospital Empanelment Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Hospital Empanelment Deletion In Hospital Empanelment Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]