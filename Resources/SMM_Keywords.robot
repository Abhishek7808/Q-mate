*** Settings ***
Resource  ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/ProfileSelection.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerNavigation.robot
Resource  ${PAGE OBJECTS}/SMM/PlantList.robot
Resource  ${PAGE OBJECTS}/SMM/ViewRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/PlantRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerGroup.robot
Resource  ${PAGE OBJECTS}/SMM/MemberList.robot

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
    PlantRegistration.Fill Customer Registration Form By Department  ${branchType}

Check For Updating Customer Details Permissions
    ViewRegistration.Confirm That Update Button Is Interactable

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
    PlantRegistration.View Member List

Open Customer List
    PlantRegistration.View Customer List

Open Plant Details
    PlantRegistration.View Plant Details

Filter Plants By Status
    [Arguments]  ${plantStatus}
    PlantList.Apply Plant Status Filter  ${plantStatus}

View Details Of Selected Plant
    [Arguments]  ${branchName}
    PlantList.View Plant By Branch Name  ${branchName}

Approve Selected Plant
    PlantRegistration.Approve Plant

Reject Selected Plant
    PlantRegistration.Reject Plant

Cancel Plant Registration
    PlantRegistration.Deactivate Plant

Activate Plant Registration
    PlantRegistration.Activate Plant

Add Customer From Department
    PlantList.Add Customer

Add Member From Department
    PlantRegistration.Fill Add Member Form

Add Plant Details From Department
    PlantRegistration.Fill Plant Details Form By Department

Verify That Customer Has Been Registered
    [Arguments]  ${branchName}
    PlantList.Verify Customer Registration  ${branchName}

Verify That Customer Has Been Approved
    [Arguments]  ${branchName}
    PlantList.Verify Customer Approval  ${branchName}

Verify That Customer Has Been Deactivated
    [Arguments]  ${branchName}
    PlantList.Verify Customer Deactivation  ${branchName}

Add Plant By Customer
    ViewRegistration.View Plant Details By Customer

Fill Plant By Customer
    ViewRegistration.Fill Plant Details By Customer

View Customer Group
    CustomerNavigation.Open Group List Page

Create New Group
    CustomerGroup.Create Customer Group
    CustomerGroup.Fill Customer Group

Check For The Group On The Customer Group Page
    [Arguments]  ${groupName}
    CustomerGroup.Verify That Given Group Is Exists On The Page  ${groupName}

Open Memeber List Of The Group
    [Arguments]  ${groupName}
    CustomerGroup.View Memeber List Of The Group  ${groupName}

Add Member To The Group
    MemberList.Send Add Request

Verify That Member Is Added To The Group
    [Arguments]  ${branchName}
    MemberList.Check For Member By Branch Name  ${branchName}