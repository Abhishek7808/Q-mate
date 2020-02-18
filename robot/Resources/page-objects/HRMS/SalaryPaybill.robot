*** Variables ***
${addPaybill}  //a[@id='modals-bootbox-custom']
${savePaybill}  //input[@id='btnSave']
${paybillFilters}  //button[@class='btn btn-default']
${applyPaybillFilter}  //button[@id='btnformfilter']
${paybilltable}  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']
${searchBox}  //input[@id='SearchText']
${actionButton}  //a[contains(@class,'btn btn-primary drpWorkflowAction')]
${verifyText}  //a[contains(text(),'Verify and Forward for Approval')]
${approveText}  //a[contains(text(),'Verify and Forward for Approval')]
@{paybillNumbers}
*** Keywords ***
Go To Salary Paybill Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Go To Approve Salary Paybill Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/SalaryPaybill/Index?q=brGN8Kdx2cCexVuJlVC+Gg==

Click On Add Paybill button
    click element  ${addPaybill}

Fill Salary Paybill Form
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Bill Date"]}  ${dataDictionary["Bill Date"]["Value"]}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payslip Unit"]}  ${dataDictionary["Payslip Unit"]["Value"]}

Submit Details
    click element  ${savePaybill}

Open Filters
    click element  ${paybillFilters}

Apply Filters
    click element  ${applyPaybillFilter}

Get Latest Paybill Number
    Common_Keywords.Show Maximum Entries On Page
    ${allPaybills}  get element count  ${paybilltable}//tr
    FOR  ${paybill}  IN RANGE  2  ${allPaybills+1}
    \   ${paybilNumber}  Get Salary Paybill Number  ${paybill}
    \   ${paybilNumber}  convert to integer  ${paybilNumber}
    \   append to list  ${paybillNumbers}  ${paybilNumber}
    sort list  ${paybillNumbers}
    ${listLength}  get length  ${paybillNumbers}
    ${lastIndex}  set variable  ${listLength-1}
    log to console  ${paybillNumbers}[${lastIndex}]
    set global variable  ${latestPaybillCreated}  ${paybillNumbers}[${lastIndex}]
    return from keyword  ${paybillNumbers}[0]

Get Salary Paybill Number
    [Arguments]  ${paybill}
    ${paybillDetails}  get table cell  ${paybilltable}  ${paybill}  2
    ${paybill}  split string  ${paybillDetails}  No. :
    ${paybillNumber}  split string  ${paybill}[1]  /
    return from keyword  ${paybillNumber}[0]

Search Paybill
    input text  ${searchBox}  ${latestPaybillCreated}

Verify Paybill
    click element  ${actionButton}
    wait until element is visible  ${verifyText}
    click element  ${verifyText}

Approve Paybill
    click element  ${actionButton}
    wait until element is visible  ${approveText}
    click element  ${approveText}