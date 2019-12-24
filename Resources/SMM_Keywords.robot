*** Settings ***
Resource  ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerProfileSelection.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerNavigation.robot
Resource  ${PAGE OBJECTS}/SMM/PlantList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerViewRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/PlantRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerGroups.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerAgentList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerMemberList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerPurchaseOrder.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerMemberList.robot
*** Variables ***
${profileSelectionPage}  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection

*** Keywords ***

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

Send Add Member Request To The Group
    MemberList.Send Add Request

Verify That Member Is Added To The Group
    [Arguments]  ${branchName}
    MemberList.Check For Member By Branch Name  ${branchName}

Add Member To The Group
    [Arguments]  ${memberBranchName}
    MemberList.Accept Member Request  ${memberBranchName}

Verify Member Status
    MemberList.Check For Membership

Verify Absence Of Group Admin Rights
    MemberList.Check For Absence Of Add Member Button

Remove Member From The Group
    [Arguments]  ${branchName}
    MemberList.Reject Membership  ${branchName}

Approve Member
    [Arguments]  ${branchName}
    MemberList.Approve Membership  ${branchName}

Change Group Admin
    [Arguments]  ${newAdmin}
    MemberList.Switch Admin  ${newAdmin}

Verify Presence Of Group Admin Rights
    MemberList.Check For Presence Of Add Member Button

Open Customer Group List Page
    GroupList.Go To Customer Group List Page

Add New Customer Group
    GroupList.Add New Customer Group By Department
    GroupRegistration.Fill Group Registration Form By Department

Expect Alert
    [Arguments]  ${alertText}
    GroupRegistration.Check For Alert  ${alertText}

View Customer Group List
    GroupRegistration.Open Customer Group List

Search For Customer Group
    [Arguments]  ${groupName}
    GroupList.Search Customer Group  ${groupName}

View Details Of Selected Group
    [Arguments]  ${groupName}
    GroupList.Open Group Details  ${groupName}

Add Member To The Group By Department
    [Arguments]  ${groupName}
    GroupList.Add Member  ${groupName}

View Agent List
    CustomerNavigation.Open Agent List Page

Check For an Agent On Agent List Page
    [Arguments]  ${agentName}
    CustomerAgentList.Verify Presence Of Agent  ${agentName}

View Purchase Order List As A Customer
    CustomerNavigation.Open Purchase Order List Page

Request Purchase Order By Customer
    CustomerPurchaseOrder.Request Purchase Order

Add Agent Details
    CustomerPurchaseOrder.Add Agent
    CustomerPurchaseOrder.Fill Agent Details

Fill Purchase Order Form
    CustomerPurchaseOrder.Fill Purchase Order Details

View Agent Details
    CustomerAgentList.Open Agent Details

Edit Agent Details
    [Arguments]  ${newName}
    CustomerAgentRegistration.Edit Agent Name  ${newName}

View Purchase Order List By Customer
    CustomerPOList.Open Purchase Order List