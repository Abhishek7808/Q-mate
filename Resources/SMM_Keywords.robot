*** Settings ***
Resource  ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerProfileSelection.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerNavigation.robot
Resource  ${PAGE OBJECTS}/SMM/PlantList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerCustomerViewRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/PlantRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerGroups.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerAgentList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerMemberList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerPoRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerMemberList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerAgentRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerCRoList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerCRoRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/PurchaseOrderRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/PurchaseOrderList.robot
Resource  ${PAGE OBJECTS}/SMM/GroupRegistration.robot
Resource  ${PAGE OBJECTS}/SMM/GroupList.robot
Resource  ${PAGE OBJECTS}/SMM/CustomerPoList.robot
Resource  ${PAGE OBJECTS}/RenewPurchaseOrder.robot

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
    CustomerViewRegistration.Confirm That Update Button Is Interactable

View Customer Registration
    CustomerNavigation.Open Customer Registration Form

Check for draft state of Customer Registration
    CustomerViewRegistration.Check For Draft

Check for Approved state of Customer Registration
    CustomerViewRegistration.Confirm Approval Of Customer

Check for Rejected state of Customer Registration
    CustomerViewRegistration.Confirm Rejection Of Customer

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
    CustomerViewRegistration.View Plant Details By Customer

Fill Plant By Customer
    CustomerViewRegistration.Fill Plant Details By Customer

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
    CustomerPoList.Request Purchase Order

Add Agent Details
    CustomerPoRegistration.Add Agent
    CustomerPoRegistration.Fill Agent Details

Add Purchase Order Details
    CustomerPoRegistration.Fill Purchase Order Form

View Agent Details
    CustomerAgentList.Open Agent Details

Edit Agent Details
    [Arguments]  ${newName}
    CustomerAgentRegistration.Edit Agent Name  ${newName}

View Purchase Order List By Customer
    CustomerPoList.Open Purchase Order List

Select Purchase Order By Product From Customer
    [Arguments]  ${productName}
    CustomerPoList.Get Purchase Order Details By Product  ${productName}

Verify Agent Name In Purchase Order
    [Arguments]  ${agentName}
    CustomerPoRegistration.Check For Agent Name In Purchase Order Form  ${agentName}

Open Purchase Order List By Department
    PurchaseOrderList.Go To Purchase Order List Page

Filter Purchase Order List By Status
    [Arguments]  ${poStatus}
    PurchaseOrderList.Apply Purchase Order Filter  ${poStatus}

View Purchase Order By Product
    [Arguments]  ${productName}
    PurchaseOrderList.Open Details Of Purchase Order Selected By Product Name  ${productName}

Approve Pending Purchase Order
    [Arguments]  ${productName}
    Open Purchase Order List By Department
    Sleep  2s
    Filter Purchase Order List By Status  Pending
    sleep  3s
    View Purchase Order By Product  ${productName}
    Sleep  3s
    PurchaseOrderRegistration.Approve Purchase Order

Get Purchase Order Number
    [Arguments]  ${productName}
    ${poNumber}  PurchaseOrderList.Fetch Purchase Order Number  ${productName}
    [Return]    ${poNumber}

View CRO List In Po Form
    CustomerPoRegistration.Switch To CRO List

Request CRO From PO Form
    CustomerPoRegistration.Switch To CRO List
    CustomerPoRegistration.Request CRO

Select Purchase Order In CRO Form
    [Arguments]  ${poNumber}=None
    CustomerCRoRegistration.Select Purchase Order for CRO  ${poNumber}

Verify Agent Name In Contract Release Order
    [Arguments]  ${agentName}
    CustomerCRoRegistration.Check For Agent Name Contract Release Order Form

Filter Purchase Order List By Status From Customer
    [Arguments]  ${poStatus}
    CustomerPoList.Apply Purchase Order Filter  ${poStatus}

View CRO List By Customer
    CustomerCRoList.Open CRO List By Customer

Request CRO By Customer
    CustomerCRoList.Request CRO

Add Purchase Order From Department
    PurchaseOrderList.Generate Purchase Order

Fill Company Name In PO Form
    [Arguments]  ${panNo}  ${branchName}
    PurchaseOrderRegistration.Enter Customer PAN  ${panNo}  ${branchName}

Add Agent Details In PO Form
    PurchaseOrderRegistration.Add Agent
    PurchaseOrderRegistration.Fill Agent Registration Form

Select Agent In PO Form
    [Arguments]  ${agentName}
    PurchaseOrderRegistration.Select Agent From Registered Agents  ${agentName}

Submit PO Form
    PurchaseOrderRegistration.Submit Form

Generate Purchase Order By Customer
    CustomerPoList.Request Purchase Order
    CustomerPoRegistration.Fill Purchase Order Form

Get Purchase Order Number From Pending PO
    [Arguments]  ${productName}
    ${poNumber}  CustomerPoList.Fetch PO Number From Pending PO  ${productName}
    Return From Keyword  ${poNumber}

Approve Pending PO By PO Number
    [Arguments]  ${poNumber}
    Open Purchase Order List By Department
    Sleep  2s
    Filter Purchase Order List By Status  Pending
    sleep  3s
    View Purchase Order By Purchase Order Number  ${poNumber}
    Sleep  3s
    PurchaseOrderRegistration.Approve Purchase Order

Approve Pending Purchase Order
    PurchaseOrderRegistration.Approve Purchase Order

Reject Purchase Order By Department
    PurchaseOrderRegistration.Reject Purchase Order

View Purchase Order By Purchase Order Number
    [Arguments]  ${poNumber}
    PurchaseOrderList.Open Details Of Purchase Order Selected By Purchase Order Number  ${poNumber}

View Purchase Order By Branch Name
    [Arguments]  ${branchName}
    PurchaseOrderList.Open Details Of Purchase Order Selected By Branch Name  ${branchName}

Update Details Of Purchase Order
    PurchaseOrderRegistration.Update PO By Department

Search For Purchase Order in Purchase Order List By Customer
    [Arguments]  ${poNumber}
    CustomerPoList.Search Purchase Order By PO Number

View Purchase Order By PO Number From Customer
    [Arguments]  ${poNumber}
    CustomerPoList.Open Purchase Order By PO Number  ${poNumber}

Verify Approval Of Purchase Order
    CustomerPoRegistration.Check For Approval Of Purchase Order From Customer

Edit Purchase Order Details
    CustomerPoRegistration.Edit Purchase Order

Search Purchase Order By Branch Name
    [Arguments]  ${branchName}
    PurchaseOrderList.Search For Purchase Order  ${branchName}

Register Purchase Order From Department
    PurchaseOrderRegistration.Fill Purchase Order Form By Department

Open Renew PO page
    RenewPurchaseOrder.Go To Renew Po Page

Search For Purchase Order In Renew PO Page
    [Arguments]  ${branchName}
    RenewPurchaseOrder.Search For Purchase Order  ${branchName}

Select Purchase Order From Renew PO List
    [Arguments]  ${branchName}
    RenewPurchaseOrder.Select Purchase Order  ${branchName}

Renew Purchase Order
    [Arguments]  ${branchName}
    RenewPurchaseOrder.Select Purchase Order  ${branchName}
    RenewPurchaseOrder.Renew Selected Purchase Order

View Financial Instrument List From Customer
    CustomerNavigation.Open Financial Instrument List

Generate Financial Instrument From Customer
    CustomerFinancialInstrument.Add Financial Instrument
    CustomerFinancialInstrument.Fill Financial Instrument By Customer

Add Financial Instrument By Customer
    CustomerFinancialInstrument.Add Financial Instrument

Fill Financial Instrument Form
    CustomerFinancialInstrument.Fill Financial Instrument By Customer

View Financial Instrument By FI Number From Customer
    [Arguments]  ${fiNumber}
    CustomerFinancialInstrument.Open Financial Instrument By FI Number  ${fiNumber}

Check CRO Form Submission Without Financial Insturment
    CustomerCRoRegistration.Fill CRO Form Without Financial Insturment

Open Financial Instrument List From Department
    FinancialInstrument.Go To Financial Instrument List Page

Filter Financial Instruments by Instrument Type From Department
    [Arguments]  ${instrumentType}
    FinancialInstrument.Apply Financial Instrument Filter  ${instrumentType}

View Financial Instrument By Branch Name From Department
    [Arguments]  ${branchName}
    FinancialInstrument.Open Financial Instrument By Branch Name  ${branchName}

Approve Financial Instrument From Department
    FinancialInstrument.Approve Financial Instrument

Verify Updation Permissions
    FinancialInstrument.Check For Presence Of Update Button