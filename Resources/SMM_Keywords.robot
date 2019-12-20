*** Settings ***
Resource  DeleteData.robot

*** Keywords ***

Delete All The Prewritten Data Of Company From ERP
    [Arguments]  ${companyPanNo}
    DeleteData.Delete Data Of Company  ${companyPanNo}

Delete All The Prewritten Data Of SSOID From ERP
    [Arguments]  ${ssoID}
    DeleteData.Delete Data Of SSOID  ${ssoID}