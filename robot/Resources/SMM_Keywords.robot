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
Resource  ${PAGE OBJECTS}/SMM/RenewPurchaseOrder.robot

*** Variables ***
${profileSelectionPage}  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection

*** Keywords ***

Go To Profile Selection Page
    [Documentation]  Opens profile selection page.
    Go To  ${profileSelectionPage}

Select Customer Type
    [Documentation]  Selects type of customer.
    [Arguments]  ${profileType}
    CustomerProfileSelection.Select Profile Of Customer  ${profileType}

Create New User Account
    [Documentation]  Opens add new customer form and fills details into it.
    [Arguments]  ${accountType}
    CustomerProfileSelection.Create New Acccount  ${accountType}

Select Customer By Name
    [Documentation]  Selects customer by name.
    [Arguments]  ${branchName}  ${companyName}
    CustomerProfileSelection.Select Branch Of The given Company  ${branchName}  ${companyName}

Company Registration By Customer
    [Documentation]  Opens company registration form and fills details into it from customer side.
    [Arguments]  ${branchType}  ${Mode}
    CustomerRegistration.Fill Customer Registration Form By Customer  ${branchType}  ${Mode}

Company Registration By Department
    [Documentation]  Opens company registration form and fills details into it from admin side.
    [Arguments]  ${branchType}
    PlantRegistration.Fill Customer Registration Form By Department  ${branchType}

Check For Updating Customer Details Permissions
    [Documentation]  Checks for the update button when customer details page is open.
    CustomerViewRegistration.Confirm That Update Button Is Interactable

View Customer Registration
    [Documentation]  Opens details of registered customer.
    CustomerNavigation.Open Customer Registration Form

Check For Draft State Of Customer Registration
    [Documentation]  Searches for draft tag in the customer details page.
    CustomerViewRegistration.Check For Draft

Verify Pending State Of Customer Registration
    [Documentation]  Searches for pending tag in the customer details page.
    CustomerViewRegistration.Check For Pending State

Update Draft From Customer
    [Documentation]  Edits details of customer whose registration is in draft form.
    CustomerViewRegistration.Update draft registration

Check for Approved state of Customer Registration
    [Documentation]  Searches for approved tag in the customer details page.
    CustomerViewRegistration.Confirm Approval Of Customer

Check for Rejected state of Customer Registration
    [Documentation]  Searches for rejected tag in the customer details page.
    CustomerViewRegistration.Confirm Rejection Of Customer

Check Draft Branch Visibility
    [Documentation]  Verifies that branch visibility popup apprears during filling company pan into pan field and branch name exists in the popup.
    CustomerRegistration.Check For Draft Branch In The Draft Branches Popup

Open Plant List Page
    [Documentation]  Opens plant list page.
    PlantList.Go To Plant List Page

Open Member List
    [Documentation]  Opens member list page.
    PlantRegistration.View Member List

Open Customer List
    [Documentation]  Opens customer list page.
    PlantRegistration.View Customer List

Open Plant Details
    [Documentation]  Opens plant list page.
    PlantRegistration.View Plant Details

Filter Plants By Status
    [Documentation]  Sets filters for plants.
    [Arguments]  ${plantStatus}
    PlantList.Apply Plant Status Filter  ${plantStatus}

View Details Of Selected Plant
    [Documentation]  Opens details of plant of given branch.
    [Arguments]  ${branchName}
    PlantList.View Plant By Branch Name  ${branchName}

Approve Selected Plant
    [Documentation]  Approves plant by admin.
    PlantRegistration.Approve Plant

Reject Selected Plant
    [Documentation]  Rejects plant request.
    PlantRegistration.Reject Plant

Cancel Plant Registration
    [Documentation]  Cancels plant registration by admin side.
    PlantRegistration.Deactivate Plant

Activate Plant Registration
    [Documentation]  Activates plant registration by admin side.
    PlantRegistration.Activate Plant

Add Customer From Department
    [Documentation]  Clicks on add customer button.
    PlantList.Add Customer

Add Member From Department
    [Documentation]  Fills details into add member form from admin side.
    PlantRegistration.Fill Add Member Form

Add Plant Details From Department
    [Documentation]  Fills plant details into plant details form from admin side.
    PlantRegistration.Fill Plant Details Form By Department

Verify That Customer Has Been Registered
    [Documentation]  Sets approved filter, and searches for customer entry in the list.
    [Arguments]  ${branchName}
    PlantList.Verify Customer Registration  ${branchName}

Verify That Customer Has Been Approved
    [Documentation]  Verifies approved tag name in the customer entry.
    [Arguments]  ${branchName}
    PlantList.Verify Customer Approval  ${branchName}

Verify That Customer Has Been Deactivated
    [Documentation]  Sets deactivate filter, and searches for customer entry in the list.
    [Arguments]  ${branchName}
    PlantList.Verify Customer Deactivation  ${branchName}

Add Plant By Customer
    [Documentation]  Open plant details from customer.
    CustomerViewRegistration.View Plant Details By Customer

Fill Plant By Customer
    [Documentation]  Fills details into plant registration form from customer side.
    CustomerViewRegistration.Fill Plant Details By Customer

View Customer Group
    [Documentation]  Opens customer group list.
    CustomerNavigation.Open Group List Page

Create New Group
    [Documentation]  Opens create new customer group popup and fills details into it.
    CustomerGroup.Create Customer Group
    CustomerGroup.Fill Customer Group

Check For The Group On The Customer Group Page
    [Documentation]  Verifies that customer group is created.
    [Arguments]  ${groupName}
    CustomerGroup.Verify That Given Group Is Exists On The Page  ${groupName}

Open Memeber List Of The Group
    [Documentation]  Opens member list of group.
    [Arguments]  ${groupName}
    CustomerGroup.View Memeber List Of The Group  ${groupName}

Send Add Member Request To The Group
    [Documentation]  Sends request from a member to join a customer group.
    CustomerMemberList.Send Add Request

Verify That Member Is Added To The Group
    [Documentation]  Verifies that add member request is approved.
    [Arguments]  ${branchName}
    CustomerMemberList.Check For Member By Branch Name  ${branchName}

Add Member To The Group
    [Documentation]  approves add member request.
    [Arguments]  ${memberBranchName}
    CustomerMemberList.Accept Member Request  ${memberBranchName}

Verify Member Status
    [Documentation]  Verifies customer is member of group.
    CustomerMemberList.Check For Membership

Verify Absence Of Group Admin Rights
    [Documentation]  Verifies that normal member do not have admin rights.
    CustomerMemberList.Check For Absence Of Add Member Button

Remove Member From The Group
    [Documentation]  Rejects membership of customer.
    [Arguments]  ${branchName}
    CustomerMemberList.Reject Membership  ${branchName}

Approve Member
    [Documentation]  Approves membership of customer.
    [Arguments]  ${branchName}
    CustomerMemberList.Approve Membership  ${branchName}

Change Group Admin
    [Documentation]  Switches admin.
    [Arguments]  ${newAdmin}
    CustomerMemberList.Switch Admin  ${newAdmin}

Verify Presence Of Group Admin Rights
    [Documentation]  Verifies that group admin have admin rights.
    CustomerMemberList.Check For Presence Of Add Member Button

Open Customer Group List Page
    [Documentation]  Opens customer group list page.
    GroupList.Go To Customer Group List Page

Add New Customer Group
    [Documentation]  Regiesters group from admin side.
    GroupList.Add New Customer Group By Department
    GroupRegistration.Fill Group Registration Form By Department

Expect Alert
    [Documentation]  Checks for the alert on the page.
    [Arguments]  ${alertText}
    GroupRegistration.Check For Alert  ${alertText}

View Customer Group List
    [Documentation]  Opens customer group page from admin side.
    GroupRegistration.Open Customer Group List

Search For Customer Group
    [Documentation]  Search customer group by name.
    [Arguments]  ${groupName}
    GroupList.Search Customer Group  ${groupName}

View Details Of Selected Group
    [Documentation]  Open details of given group
    [Arguments]  ${groupName}
    GroupList.Open Group Details  ${groupName}

Add Member To The Group By Department
    [Documentation]  Adds member to the group by admin side.
    [Arguments]  ${groupName}
    GroupList.Add Member  ${groupName}

View Agent List
    [Documentation]  Opens agent list page.
    CustomerNavigation.Open Agent List Page

Check For an Agent On Agent List Page
    [Documentation]  Verifies that given agent name is listed on agent list.
    [Arguments]  ${agentName}
    CustomerAgentList.Verify Presence Of Agent  ${agentName}

View Purchase Order List As A Customer
    [Documentation]  Opens purchase order list from customer side.
    CustomerNavigation.Open Purchase Order List Page

Request Purchase Order By Customer
    [Documentation]  Fills details into request purchase order form.
    CustomerPoList.Request Purchase Order

Add Agent Details
    [Documentation]  Opens add agent form and fills details into it.
    CustomerPoRegistration.Add Agent
    CustomerPoRegistration.Fill Agent Details

Add Purchase Order Details
    [Documentation]  Fills details into purchase order form.
    CustomerPoRegistration.Fill Purchase Order Form

View Agent Details
    [Documentation]  Opens details of agent.
    CustomerAgentList.Open Agent Details

Edit Agent Details
    [Documentation]  Edits details of previously created agent.
    [Arguments]  ${newName}
    CustomerAgentRegistration.Edit Agent Name  ${newName}

View Purchase Order List By Customer
    [Documentation]  Opens purchase order list from customer side.
    CustomerPoList.Open Purchase Order List

Select Purchase Order By Product From Customer
    [Documentation]  Fills product name in the product field and selects purchase order related to that product.
    [Arguments]  ${productName}
    CustomerPoList.Get Purchase Order Details By Product  ${productName}

Verify Agent Name In Purchase Order
    [Documentation]  Checks for agent name in the purchase order.
    [Arguments]  ${agentName}
    CustomerPoRegistration.Check For Agent Name In Purchase Order Form  ${agentName}

Open Purchase Order List By Department
    [Documentation]  Opens purchase order list by admin side.
    PurchaseOrderList.Go To Purchase Order List Page

Filter Purchase Order List By Status
    [Documentation]  Sets status filter on purchase order list page.
    [Arguments]  ${poStatus}
    PurchaseOrderList.Apply Purchase Order Filter  ${poStatus}

View Purchase Order By Product
    [Documentation]  Fills product name in the product field and selects purchase order related to that product.
    [Arguments]  ${productName}
    PurchaseOrderList.Open Details Of Purchase Order Selected By Product Name  ${productName}

Approve Pending Purchase Order
    [Documentation]  Filter outs pending purchase orders and then selects purchase order by product name.
    [Arguments]  ${productName}
    Open Purchase Order List By Department
    Sleep  2s
    Filter Purchase Order List By Status  Pending
    sleep  3s
    View Purchase Order By Product  ${productName}
    Sleep  3s
    PurchaseOrderRegistration.Approve Purchase Order

Get Purchase Order Number
    [Documentation]  Fetch purchase order numbe from the purchase order listing.
    [Arguments]  ${productName}
    ${poNumber}  PurchaseOrderList.Fetch Purchase Order Number  ${productName}
    [Return]    ${poNumber}

View CRO List In Po Form
    [Documentation]  Opens CRO list from purchase order details section.
    CustomerPoRegistration.Switch To CRO List

View CRO From Customer
    [Documentation]  Open CRO details.
    [Arguments]  ${agentName}=None  ${branchName}=None  ${reqQuanity}=None
    CustomerCRoList.Open CRO Details  ${agentName}  ${branchName}  ${reqQuanity}

Request CRO From PO Form
    [Documentation]  Request for cro when Purchase order form is open.
    CustomerPoRegistration.Switch To CRO List
    CustomerPoRegistration.Request CRO

Fill CRO From Customer
    [Documentation]  Fills details in CRO form from customer.
    CustomerCRoRegistration.Fill CRO Form

Request CRO From Customer
    [Documentation]  Requests CRO from customer side.
    CustomerCRoList.Request CRO

Get PO Remaining Quantity
    [Documentation]  Get number of purchase order remaining.
    ${amount}  CustomerCRoRegistration.Fetch PO Balance
    return from keyword  ${amount}

Fill CRO Required Quantity
    [Documentation]  Input amount into CRO required quanitity.
    [Arguments]  ${amount}
    CustomerCRoRegistration.Input Required Quantity  ${amount}

Select Purchase Order In CRO Form
    [Documentation]  Selects purchase order by PO number while CRO form is open.
    [Arguments]  ${poNumber}=None
    CustomerCRoRegistration.Select Purchase Order for CRO  ${poNumber}

Verify Agent Name In Contract Release Order
    [Documentation]  Checks for agent name in CRO form.
    [Arguments]  ${agentName}
    CustomerCRoRegistration.Check For Agent Name Contract Release Order Form  ${agentName}

Filter Purchase Order List By Status From Customer
    [Documentation]  Sets status filter for listing purchase order when logged in as customer.
    [Arguments]  ${poStatus}
    CustomerPoList.Apply Purchase Order Filter  ${poStatus}

View CRO List By Customer
    [Documentation]  Opens CRO list page while logged in as customer.
    CustomerCRoList.Open CRO List By Customer

Verify That CRO Is Not Approved
    [Documentation]  Checks for pending tag in CRO details page.
    CustomerCRoRegistration.Check For Pending CRO

Add Purchase Order From Department
    [Documentation]  Adds purchase order from admin side.
    PurchaseOrderList.Generate Purchase Order

Fill Company Name In PO Form
    [Documentation]  Fills company pan and name in the PO form.
    [Arguments]  ${panNo}  ${branchName}
    PurchaseOrderRegistration.Enter Customer PAN  ${panNo}  ${branchName}

Add Agent Details In PO Form
    [Documentation]  Fills details of agent in the purchase order form.
    PurchaseOrderRegistration.Add Agent
    PurchaseOrderRegistration.Fill Agent Registration Form

Select Agent In PO Form
    [Documentation]  Selects agent in purchase order form.
    [Arguments]  ${agentName}
    PurchaseOrderRegistration.Select Agent From Registered Agents  ${agentName}

Submit PO Form
    [Documentation]  Submits purchase order details.
    PurchaseOrderRegistration.Submit Form

Generate Purchase Order By Customer
    [Documentation]  Requests purchse order from customer side.
    CustomerPoList.Request Purchase Order
    CustomerPoRegistration.Fill Purchase Order Form

Get Purchase Order Number From Pending PO
    [Documentation]  Fetch and return purchase order form purchase order form.
    [Arguments]  ${productName}
    ${poNumber}  CustomerPoList.Fetch PO Number From Pending PO  ${productName}
    Return From Keyword  ${poNumber}

Approve Pending PO By PO Number
    [Documentation]  Takes PO number as argument. Selects pending status filter and approves purchase order of given number.
    [Arguments]  ${poNumber}
    Open Purchase Order List By Department
    Sleep  2s
    Filter Purchase Order List By Status  Pending
    sleep  3s
    View Purchase Order By Purchase Order Number  ${poNumber}
    Sleep  3s
    PurchaseOrderRegistration.Approve Purchase Order

Approve Purchase Order From Department
    [Documentation]  Approves purchase order request from admin side.
    PurchaseOrderRegistration.Approve Purchase Order

Reject Purchase Order By Department
    [Documentation]  Rejects purchase order request from admin side.
    PurchaseOrderRegistration.Reject Purchase Order

View Purchase Order By Purchase Order Number
    [Documentation]  Opens purchase order by PO number.
    [Arguments]  ${poNumber}
    PurchaseOrderList.Open Details Of Purchase Order Selected By Purchase Order Number  ${poNumber}

View Purchase Order By Branch Name
    [Documentation]  Open purchase order details, choosen by branch name.
    [Arguments]  ${branchName}
    PurchaseOrderList.Open Details Of Purchase Order Selected By Branch Name  ${branchName}

Update Details Of Purchase Order
    [Documentation]  Edits details of previuosly created purchase order.
    PurchaseOrderRegistration.Update PO By Department

Search For Purchase Order in Purchase Order List By Customer
    [Documentation]  Searches purchase order in the purchase order list.
    [Arguments]  ${poNumber}
    CustomerPoList.Search Purchase Order By PO Number

View Purchase Order By PO Number From Customer
    [Documentation]  Open ourchase order details, choosen by PO number.
    [Arguments]  ${poNumber}
    CustomerPoList.Open Purchase Order By PO Number  ${poNumber}

Verify Approval Of Purchase Order
    [Documentation]  Checks for approve tag in the purchase order details page.
    CustomerPoRegistration.Check For Approval Of Purchase Order From Customer

Edit Purchase Order Details
    [Documentation]  Edits details of previously created purchase order.
    CustomerPoRegistration.Edit Purchase Order

Search Purchase Order By Branch Name
    [Documentation]  Search purchase order by branch name in the purchase order list.
    [Arguments]  ${branchName}
    PurchaseOrderList.Search For Purchase Order  ${branchName}

Register Purchase Order From Department
    [Documentation]  Fills details in purchase order registration form.
    PurchaseOrderRegistration.Fill Purchase Order Form By Department

Open Renew PO page
    [Documentation]  Opens renew purchase order page.
    RenewPurchaseOrder.Go To Renew Po Page

Search For Purchase Order In Renew PO Page
    [Documentation]  Selects purchase order for renewal by branch name.
    [Arguments]  ${branchName}
    RenewPurchaseOrder.Search For Purchase Order  ${branchName}

Select Purchase Order From Renew PO List
    [Documentation]  Selects required purchase order.
    [Arguments]  ${branchName}
    RenewPurchaseOrder.Select Purchase Order  ${branchName}

Renew Purchase Order
    [Documentation]  Updates expiry date in the purchase order details.
    [Arguments]  ${branchName}
    RenewPurchaseOrder.Select Purchase Order  ${branchName}
    RenewPurchaseOrder.Renew Selected Purchase Order

View Financial Instrument List From Customer
    [Documentation]  Opens financial instrument page from customer side.
    CustomerNavigation.Open Financial Instrument List

Generate Financial Instrument From Customer
    [Documentation]  Fills and adds financial instrument details from customer side.
    CustomerFinancialInstrument.Add Financial Instrument
    CustomerFinancialInstrument.Fill Financial Instrument By Customer

Add Financial Instrument By Customer
    [Documentation]  Adds financial instrument from customer side.
    CustomerFinancialInstrument.Add Financial Instrument

Fill Financial Instrument Form By Customer
    [Documentation]  Fills financial instrument details from customer side.
    CustomerFinancialInstrument.Fill Financial Instrument By Customer

View Financial Instrument By FI Number From Customer
    [Documentation]  Searches financial instrument by FI number.
    [Arguments]  ${fiNumber}
    CustomerFinancialInstrument.Open Financial Instrument By FI Number  ${fiNumber}

Check CRO Form Submission Without Financial Insturment
    [Documentation]  Fills CRO form without adding financial instrument.
    CustomerCRoRegistration.SMM_Keywords.Fill CRO From Customer Form Without Financial Insturment

Open Financial Instrument List From Department
    [Documentation]  Opens financial instrument list from admin side.
    FinancialInstrument.Go To Financial Instrument List Page

Verify FI Balance Is Greater Than CRO Balance
    [Documentation]  Verifies that CRO can not be requested if FI balance is less than CRO balance.
    CustomerCRoRegistration.Compare FI Balance And CRO Amount

Filter Financial Instruments by Instrument Type From Department
    [Documentation]  Filter outs financial instrument by financial instrument type.
    [Arguments]  ${instrumentType}
    FinancialInstrument.Apply Financial Instrument Filter  ${instrumentType}

View Financial Instrument By Branch Name From Department
    [Documentation]  Open financial instrument details selected by branch name.
    [Arguments]  ${branchName}
    FinancialInstrument.Open Financial Instrument By Branch Name  ${branchName}

View Financial Instrument By FI Number From Department
    [Documentation]  Open financial instrument details selected by FI number.
    [Arguments]  ${fiNumber}
    FinancialInstrument.Open Financial Instrument By FI Number  ${fiNumber}

View Approved Financial Instrument By FI Number From Customer
    [Documentation]  Opens approved financial instrument form FI list while logged in as customer.
    [Arguments]  ${fiNumber}
    CustomerFinancialInstrument.Open Approved Financial Instrument By FI Number  ${fiNumber}

Approve Financial Instrument From Department
    [Documentation]  Approves financial instrument by admin side.
    FinancialInstrument.Approve Financial Instrument

Verify Updation Permissions
    [Documentation]  Checks for update button in the financial instrument details page.
    FinancialInstrument.Check For Presence Of Update Button

Search Financial Instrument By FI Number From Department
    [Documentation]  Searchs financial instrument by FI number from admin side.
    [Arguments]  ${fiNumber}
    FinancialInstrument.Search Financial Instrument  ${fiNumber}

Verify Approval Of Financial Instruments
    [Documentation]  Checks for approved tag in the listing of financial instrument.
    [Arguments]  ${fiNumber}
    FinancialInstrument.Check For Approved State Of Financial Instruments  ${fiNumber}

Reject Pending Financial Instrument From Department
    [Documentation]  Rejects financial instrument from admin side.
    [Arguments]  ${fiNumber}
    FinancialInstrument.Search Financial Instrument  ${fiNumber}
    FinancialInstrument.Reject Financial Instrument

Verify Financial Instrument Is Rejected
    [Documentation]  Checks for reject tag in the financial instrument details.
    [Arguments]  ${fiNumber}
    FinancialInstrument.Search Financial Instrument  ${fiNumber}
    FinancialInstrument.Check For Financial Instrument Is Rejected  ${fiNumber}

Print Financial Instrument
    [Documentation]  Saves financial intrument slip.
    [Arguments]  ${fiNumber}
    FinancialInstrument.Search Financial Instrument  ${fiNumber}
    FinancialInstrument.Print FI

Request Transfer Instument From Customer
    [Documentation]  Requests transfer instrument from customer side.
    [Arguments]  ${branchName}  ${amount}=5000
    CustomerFinancialInstrument.Request Transfer Instument  ${branchName}  ${amount}

View Financial Instrument By FI Number For Selected Branch From Department
    [Documentation]  Opens financial instrument details selected by FI number and branch.
    [Arguments]  ${fiNumber}  ${branchName}
    FinancialInstrument.Open Financial Instrument By FI Number For Selected Branch  ${fiNumber}  ${branchName}

Approve Financial Instrument Transfer Request From Department
    [Documentation]  Approves financial instrument transfer request by admin side.
    [Arguments]  ${branchName}  ${fiAmount}
    FinancialInstrument.Approve Transfer Request  ${branchName}  ${fiAmount}

Reject Financial Instrument Transfer Request From Department
    [Documentation]  Rejects financial instrument transfer request by admin side.
    [Arguments]  ${branchName}  ${fiAmount}
    FinancialInstrument.Reject Transfer Request  ${branchName}  ${fiAmount}

Verify Transfer Instrument Members
    [Documentation]  Verifies that appropriate members are listed in the transfer instrument popup.
    CustomerFinancialInstrument.Check For Transfer Instrument Group Members

Get Available Amount Value Of Financial Instrument
    [Documentation]  Fetches available amount of financial instrument.
    CustomerFinancialInstrument.Get Amount Value

View Financial Instrument From Department
    [Documentation]  Open financial instrument details selected by branch, FI number and validity date.
    [Arguments]  ${branchName}  ${fiNumber}  ${validityDate}
    FinancialInstrument.Open Financial Instrument From Department

Open Weighbridge Operations Page
    [Documentation]  Opens weighnridge operations page.
    WeighBridgeOperation.Go To Weighbridge Operations Page

Generate Inward Slip
    [Documentation]  Fills inward slip details.
    [Arguments]  ${croNumber}
    WeighBridgeOperation.Fill Inward Slip  ${croNumber}

Generate Outward Slip
    [Documentation]  Fills outward slip details.
    [Arguments]  ${croNumber}
    WeighBridgeOperation.Fill Outward Slip  ${croNumber}

Open Loading Advice List From Department
    [Documentation]  Opens loading advice page while logged in as admin.
    LoadingAdvice.Go To Loading Advice List

View Loading Advice From Department
    [Documentation]  Open loading advice details.
    [Arguments]  ${branchName}
    LoadingAdvice.Open Loading Advice

Approve Loading Advice From Department
    [Documentation]  Approves loading advice from admin side.
    LoadingAdvice.Approve Loading Advice

Open Schedule Page From Department
    [Documentation]  Open schedule page.
    Schedule.Go To Schedule Page

View Schedule By Name
    [Documentation]  Open schedule details selected by name.
    [Arguments]  ${scheduleName}
    Schedule.Open Schedule  ${scheduleName}

Add Formula In Schedule
    [Documentation]  Adds formula in schedule.
    Schedule.Add Formula

Open Invoice Page From Department
    [Documentation]  Opens invoice page while logged in as admin.
    Invoice.Go To Invoice Page

Print Invoice From Department
    [Documentation]  Opens invoice slip.
    [Arguments]  ${invoiceNumber}
    Invoice.Print Invoice  ${invoiceNumber}

Open Differentials Adjustments Page From Department
    [Documentation]  Opens differentials adjustments page
    DifferentialsAdjustments.Go To Differentials Adjustments Page

Generate Debit Note
    [Documentation]  Generates Debit note.
    [Arguments]  ${croNumber}  ${invoiceNumber}
    DifferentialsAdjustments.Fill Debit Note Form

Open Product Page From Department
    [Documentation]  Opens product page.
    Product.Go To Product Page

Fill Product From Department
    [Documentation]  Fills details into product registration form.
    Product.Add Product
    Product.Fill Product Form

Fill Schedule From Department
    [Documentation]  Fills details in schedule form.
    Schedule.Add Schedule
    Schedule.Fill Schedule Form

Add Product From Department
    [Documentation]  Fills product details.
    Product.Add Product

Fill Schedule On Product Page
    [Documentation]  Fills schedule details while shifted from product tab.
    Product.Add Schedule From Product Page

Search Product On Product Page
    [Documentation]  Searches product on the product page.
    [Arguments]  ${productName}
    Product.Search Product  ${productName}

Edit Price Component For Product
    [Documentation]  Edits price component details in the product details page.
    Product.Edit Product Details

Open Receipt List Page From Department
    [Documentation]  Opens reciept list page.
    Receipt.Go To Receipt List Page From Department

Generate Receipt
    [Documentation]  Adds new receipt and fills details into it.
    Receipt.Add New Receipt
    Receipt.Fill Receipt Form

Approve Reciept From Department
    [Documentation]  Approves reciept from admin side.
    [Arguments]  ${branchName}
    Receipt.View Reciept Details  ${branchName}
    Receipt.Approve Reciept

View CRO List From Department
    [Documentation]  Open CRO list while logged in as admin.
    ContractReleaseOrderList.Go To Contract Release Order List Page

View CRO From Department
    [Documentation]  Open CRO details selected by agent, branch and required quantity.
    [Arguments]  ${agentName}=None  ${branchName}=None  ${reqQuanity}=None
    ContractReleaseOrder.Open CRO  ${agentName}  ${branchName}  ${reqQuanity}

Forward CRO To Marketing Executive From Department
    [Documentation]  Forwards CRO to Marketing executive.
    ContractReleaseOrder.Forward CRO To ME

Forward CRO To SE From Department
    [Documentation]  Frowards CRO to SE.
    ContractReleaseOrder.Forward CRO To SE

Approve CRO From Department
    [Documentation]  Approves CRO from admin side.
    ContractReleaseOrder.Approve CRO

Filter CRO List By Status
    [Documentation]  Filter out CRO by status.
    [Arguments]  ${croStatus}
    ContractReleaseOrderList.Apply Filter By Status  ${croStatus}

Reject CRO From Department
    [Documentation]  Rejects CRO request.
    ContractReleaseOrder.Reject CRO

Get CRO Number
    [Documentation]  Fetches and returns the CRO number.
    [Arguments]  ${branchName}  ${quantityReq}
    ${croNumber}  ContractReleaseOrder.Fetch CRO Number  ${branchName}  ${quantityReq}
    return from keyword  ${croNumber}

Get CRO Remaining Quantity
    [Documentation]  Fetches and returns CRO remaining quantity.
    ${quantity}  ContractReleaseOrder.Fetch CRO Remaining Quantity
    return from keyword  ${quantity}

Create Financial Instrument
    [Documentation]  Fills details in financial instrument form.
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2   SSO ID=SSOID 2    FI=FI 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    SMM_Keywords.View Financial Instrument List From Customer
    SMM_Keywords.View Approved Financial Instrument By FI Number From Customer  ${FI["BG/LC Number"]}
    SMM_Keywords.Request Transfer Instument From Customer  ${Branch["Name"]}  ${FI["Transfer Amount"]}