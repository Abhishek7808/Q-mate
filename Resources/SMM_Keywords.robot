*** Settings ***
Resource  ${PAGE OBJECTS}/DeleteData.robot

*** Keywords ***

Delete All The Prewritten Data Of Company From ERP
    [Arguments]  ${companyPanNo}
    DeleteData.Delete Data Of Company  ${companyPanNo}

Delete All The Prewritten Data Of SSOID From ERP
    [Arguments]  ${ssoID}
    DeleteData.Delete Data Of SSOID  ${ssoID}

Select Customer Type
    [Arguments]  ${profileType}
    ProfileSeletion.Select Profile Of Customer  ${profileType}

Create New User Account
    [Arguments]  ${accountType}
    ProfileSelection.Create New Acccount

Company Registration By Customer
    [Arguments]  ${branchType}  ${Mode}
    CustomerRegistration.Company Registration By Customer  ${branchType}  ${Mode}