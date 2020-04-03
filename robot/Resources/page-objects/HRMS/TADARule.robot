*** Settings ***
Documentation   Add, edit and delete TA/DA rules. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/

*** Keywords ***
Go To TA/DA Rule Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    click element  modals-bootbox-custom

Click On Edit Button
    [Arguments]  ${gradeName}
    click element  //td[contains(text(),'${gradeName}')]/following-sibling::td//i[@class='fa fa-pencil']

Fill Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Unit"]}  ${dataDictionary["Unit"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Allowance Type"]}  ${dataDictionary["Allowance Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective From"]}  ${dataDictionary["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Grade"]}  ${dataDictionary["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Rule"]}  ${dataDictionary["Rule"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Travel Mode"]}  ${dataDictionary["Travel Mode"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Travel Class"]}  ${dataDictionary["Travel Class"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Mileage Allowance"]}  ${dataDictionary["Mileage Allowance"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${dataDictionary["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Amount"]}  ${dataDictionary["Amount"]["Value"]}

Fill Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Unit"]}  ${dataDictionary["Edit TA/DA Rule"]["Unit"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Allowance Type"]}  ${dataDictionary["Edit TA/DA Rule"]["Allowance Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Effective From"]}  ${dataDictionary["Edit TA/DA Rule"]["Effective From"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Grade"]}  ${dataDictionary["Edit TA/DA Rule"]["Grade"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Rule"]}  ${dataDictionary["Edit TA/DA Rule"]["Rule"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Travel Mode"]}  ${dataDictionary["Edit TA/DA Rule"]["Travel Mode"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Travel Class"]}  ${dataDictionary["Edit TA/DA Rule"]["Travel Class"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Mileage Allowance"]}  ${dataDictionary["Edit TA/DA Rule"]["Mileage Allowance"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["City"]}  ${dataDictionary["Edit TA/DA Rule"]["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit TA/DA Rule"]["Amount"]}  ${dataDictionary["Edit TA/DA Rule"]["Amount"]["Value"]}

Save Details
    click button  btnSave

Delete Entry
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]::td//i[@class='fa fa-trash-o']
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    click element  //button[contains(text(),'OK')]

Search For TA/DA Rule
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Grade"]["Value"]}
    click button  BtnSearchfilter

Check For TA/DA Rule Entry In TA/DA Rule Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]

Check For TA/DA Rule Deletion In TA/DA Rule Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]