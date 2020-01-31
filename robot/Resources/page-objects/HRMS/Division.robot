*** Settings ***
Documentation    Create, edit and delete Divisions. for more info visit http://support.e-connectsolutions.com/erp/how-to/division-configuration/

*** Keywords ***
Check For Division Entry In Division Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Division Deletion In Division Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]
