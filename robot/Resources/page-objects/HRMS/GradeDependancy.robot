*** Settings ***
Documentation    Add, edit and delete grade dependancy. For more info visit http://support.e-connectsolutions.com/erp/how-to/grade-dependency/

*** Keywords ***
Check For Grade Dependancy Entry In Grade Dependancy Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]

Check For Grade Dependancy Deletion In Grade Dependancy Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]