*** Settings ***
Documentation    Suite description

*** Variables ***
${tableID}  //table[contains(@class,'table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable')]

*** Keywords ***
Go To Entertainment Declaration Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex

Click On Declare Button
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Declare"]}

Search Tea Rate Definition In Entertainment Declaration Table
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Search box"]}  ${formField["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Search button"]}

Click On Filter
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Filter"]}

Select Type In Dropdown
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Filter Type"]}  ${formField["Filter Type"]["Value"]}

Apply Filter
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Apply Filter"]}

Click On Edit Button
    [Arguments]  ${formField}
    Wait Until Keyword Succeeds    10s    250ms   click element  //td[contains(text(),'${formField["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formField["Rate"]["Value"]}')]/following-sibling::${formField["Edit Button"]["Locator"]}
    #FillFields.Input Value Into Field  ${formField["Edit Button"]}
    #/following-sibling::td[contains(text(),'${formField["Rate"]["Value"]}')]

Click On Delete Button
    [Arguments]  ${formField}
    Wait Until Keyword Succeeds    10s    250ms  click element  //td[contains(text(),'${formField["Edit Tea Rate Definition"]["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formField["Edit Tea Rate Definition"]["Rate"]["Value"]}')]/following-sibling::${formField["Delete"]["Locator"]}

Confirm Delete Entry Popup Appeared
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Ok"]}

Fill Entertainment Declaration Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}

Submit Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Save"]}


Check For The New Entry In Entertainment Declaration Table
    [Arguments]  ${formField}
    ${effectivefrom}  get table cell  ${tableID}  2  3
    ${type}  get table cell  ${tableID}  2  4
    ${rate}  get table cell  ${tableID}  2  5
    ${date}  set variable  ${formField["Effective Date"]["Value"]["Day"]}-${formField["Effective Date"]["Value"]["Month"]}-${formField["Effective Date"]["Value"]["Year"]}
    ${formatteddate}  set variable if  ${formField["Effective Date"]["Value"]["Day"]}<10  0${date}  ELSE  ${date}
    ${formattedrate}  Common_Keywords.Change The Number Into A Formatted Amount  ${formField["Rate"]["Value"]}
    should be equal  ${effectivefrom}  ${formatteddate}
    should be equal  ${type}  ${formField["Type"]["Value"]}
    should be equal  ${rate}  ${formattedrate}
    page should contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'${formatteddate}')]/following-sibling::td[contains(text(),'${formField["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formattedrate}')]

Check For The Deletion In Entertainment Declaration Table
    [Arguments]  ${formField}
    ${date}  set variable  ${formField["Effective Date"]["Value"]["Day"]}-${formField["Effective Date"]["Value"]["Month"]}-${formField["Effective Date"]["Value"]["Year"]}
    ${formatteddate}  set variable if  ${formField["Effective Date"]["Value"]["Day"]}<10  0${date}  ELSE  ${date}
    ${formattedrate}  Common_Keywords.Change The Number Into A Formatted Amount  ${formField["Rate"]["Value"]}
    reload page
    page should not contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'${formatteddate}')]/following-sibling::td[contains(text(),'${formField["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formattedrate}')]