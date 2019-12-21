*** Settings ***
Resource  ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/ProfileSelection.robot
#Resource  ${PAGE OBJECTS}/DeleteData.robot

*** Variables ***
${profileSelectionPage}  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection

*** Keywords ***
#
#Delete All The Prewritten Data Of Company From ERP
#    [Arguments]  ${companyPanNo}
#    DeleteData.Delete Data Of Company  ${companyPanNo}
#
#Delete All The Prewritten Data Of SSOID From ERP
#    [Arguments]  ${ssoID}
#    DeleteData.Delete Data Of SSOID  ${ssoID}
Go To Profile Selection Page
    Go To  ${profileSelectionPage}

Select Customer Type
    [Arguments]  ${profileType}
    ProfileSelection.Select Profile Of Customer  ${profileType}

Create New User Account
    [Arguments]  ${accountType}
    ProfileSelection.Create New Acccount  ${accountType}

Select Customer By Name
    [Arguments]  ${branchName}  ${companyName}
    ProfileSelection.Select Branch Of The given Company  ${branchName}  ${companyName}

Company Registration By Customer
    [Arguments]  ${branchType}  ${Mode}
    CustomerRegistration.Company Registration By Customer  ${branchType}  ${Mode}

View Customer Registration
    CustomerNavigation.Open Customer Registration Form

Check for draft state of Customer Registration
    ViewRegistration.Check For Draft

