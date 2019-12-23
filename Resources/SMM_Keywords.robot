*** Settings ***
Resource  ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/ProfileSelection.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerNavigation.robot
Resource  ${PAGE OBJECTS}/SMM/PlantList.robot
Resource  ${PAGE OBJECTS}/SMM/ViewRegistration.robot

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
    CustomerRegistration.Fill Customer Registration Form By Customer  ${branchType}  ${Mode}

Company Registration By Department
    [Arguments]  ${branchType}
    CustomerRegistration.Fill Customer Registration Form By Department  ${branchType}

Check For Updating Customer Details Permissions
    ViewRegistration.Confirm Update Button Is Interactable

View Customer Registration
    CustomerNavigation.Open Customer Registration Form

Check for draft state of Customer Registration
    ViewRegistration.Check For Draft

Check for Approved state of Customer Registration
    ViewRegistration.Confirm Approval Of Customer

Check for Rejected state of Customer Registration
    ViewRegistration.Confirm Rejection Of Customer

Check Draft Branch Visibility
    CustomerRegistration.Check For Draft Branch In The Draft Branches Popup

Open Plant List Page
    PlantList.Go To Plant List Page

Open Member List
    CustomerRegistration.View Member List

Open Customer List
    CustomerRegistration.View Customer List

Open Plant Details
    CustomerRegistration.View Plant Details

Filter Plants By Status
    [Arguments]  ${plantStatus}
    PlantList.Apply Plant Status Filter  ${plantStatus}

View Details Of Selected Plant
    [Arguments]  ${branchName}
    PlantList.View Plant By Branch Name  ${branchName}

Approve Selected Plant
    PlantList.Approve Plant

Reject Selected Plant
    PlantList.Reject Plant

Add Customer From Department
    PlantList.Add Customer

Add Member From Department
    CustomerRegistration.Fill Add Member Form

Add Plant Details From Department
    CustomerRegistration.Fill Plant Details Form By Department

Verify That Customer Has Been Registered
    [Arguments]  ${branchName}
    PlantList.Verify Customer Registration  ${branchName}

Verify That Customer Has Been Approved
    [Arguments]  ${branchName}
    PlantList.Verify Customer Approval  ${branchName}