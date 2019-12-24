*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
Check edit functionality for pending PO
    [Documentation]    Edits the PO form when it is in pending mode
    [Tags]  approvepo  approvepo1
    BrowserControl.Switch To    Department
    SMM_Keywords.Open Purchase Order List By Department
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 3
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}
    SMM_Keywords.Update Details Of Purchase Order

PO Request Approval Process
    [Documentation]    Approves PO when submitted by the customer
    [Tags]  approvepo  approvepo2
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 3
    BrowserControl.Switch To    Department
    SMM_Keywords.Open Purchase Order List By Department
    SMM_Keywords.Filter Purchase Order List By Status  Pending
    Sleep    5s
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}
    SMM_Keywords.Approve Pending Purchase Order
    BrowserControl.Switch To    Verify
    SMM_Keywords.Open Purchase Order List By Department
    SMM_Keywords.Filter Purchase Order List By Status  Approved
    Sleep    5s
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}

PO Request Rejection Process
    [Documentation]    Rejects PO when submitted by the customer
    [Tags]  approvepo  approvepo3
    BrowserControl.Switch To    Department
    SMM_Keywords.Open Purchase Order List By Department
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 2
    SMM_Keywords.Filter Purchase Order List By Status  Approved
    sleep  3s
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}
    sleep  2s
    SMM_Keywords.Reject Purchase Order By Department
    Sleep    3s
    BrowserControl.Switch To    Verify
    SMM_Keywords.Open Purchase Order List By Department
    SMM_Keywords.Filter Purchase Order List By Status  Rejected
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}

Check PO cancellation when status is approved or pending
    [Tags]  approvepo  approvepo4
    #When PO is in pending state
    BrowserControl.Switch To    Department
    SMM_Keywords.Open Purchase Order List By Department
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 3    PO=PO 1
    SMM_Keywords.Search Purchase Order By Branch Name   ${Branch["Name"]}
    sleep  3s
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}
    SMM_Keywords.Reject Purchase Order By Department
    #When PO is in Approved state
    BrowserControl.Switch To    Department
    SMM_Keywords.Open Purchase Order List By Department
    SMM_Keywords.Filter Purchase Order List By Status  Approved
    Sleep    5s
    SMM_Keywords.View Purchase Order By Branch Name  ${Branch["Name"]}
    #Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    SMM_Keywords.Reject Purchase Order By Department

#Check edit functionality for approved PO
#    [Tags]    Skip
#
#Check edit functionality for rejected PO
#    [Tags]    Skip
