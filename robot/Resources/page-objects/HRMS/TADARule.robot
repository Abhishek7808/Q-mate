*** Settings ***
Documentation   Add, edit and delete TA/DA rules. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/

*** Keywords ***
Go To TA/DA Rule Page
    [Documentation]  Opens TA/DA rule page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Documentation]  Clicks on add new button.
    click element  modals-bootbox-custom

Click On Edit Button
    [Documentation]  Takes grade name as argument and clicks on edit button.
    [Arguments]  ${gradeName}
    click element  //td[contains(text(),'${gradeName}')]/following-sibling::td//i[@class='fa fa-pencil']

Fill Details
    [Documentation]  Fills details into TA/DA form.
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


Save Details
    [Documentation]  Clicks on save button.
    click button  btnSave

Delete Entry
    [Documentation]  Clicks on delete button, wait for delete pop up to be appear and then clicks on OK button.
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]::td//i[@class='fa fa-trash-o']
    wait until page contains   Do you really want to delete selected record(s) ?
    sleep  3s
    click element  //button[contains(text(),'OK')]

Search For TA/DA Rule
    [Documentation]  Searches for TA/DA rule.
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Grade"]["Value"]}
    click button  BtnSearchfilter

Check For TA/DA Rule Entry In TA/DA Rule Table
    [Documentation]  Checks that TA/DA rule is listed on the page.
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]

Check For TA/DA Rule Deletion In TA/DA Rule Table
    [Documentation]  Checks that TA/DA rule is not listed on the page.
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]