*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

# robot -d Results Tests/SMM/01__Customer_Registration/03__Manage_Customer_Registration.robot


*** Test Cases ***
To check the edit process of customer details when customer is not approved by department
    [Documentation]    Edits the details of a customer when it has not been approved by department i.e. pending state
    [Tags]  manage  mnotapproved  manage1
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 3
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Filter Plants By Status    Draft      #Draft
    sleep  3s
    SMM_Keywords.View Details Of Selected Plant  ${Branch["Name"]}
    SMM_Keywords.Company Registration By Department    Draft
    SMM_Keywords.Open Plant List Page
    SMM_Keywords.Filter Plants By Status    Approved
    sleep  3s
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Approved   ${Branch["Name"]}

To check the edit process of customer details when customer is approved by department
    [Documentation]    Edits the details of a customer when it has been approved by department
    [Tags]  manage  mapproved  manage2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 2    SSO ID=SSOID 3
    #Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Select Customer By Name   ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep    2s
    Capture Page Screenshot
    SMM_Keywords.Check For Updating Customer Details Permissions

Check Cancel Customer Registration
    [Documentation]    Deactivates an application by Marketing Team Member
    [Tags]  manage  mcancle  manage3
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1    #jaipur
    SMM_Keywords.Filter Plants By Status    Approved
    sleep  3s
    SMM_Keywords.View Details Of Selected Plant  ${Branch["Name"]}
    SMM_Keywords.Cancel Plant Registration
    Sleep    2s
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Deactivated  ${Branch["Name"]}
    #&{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Company["Company Name"]} (${Company["Enter PAN"]})
    #Go To Add Purchase Order From Department
    #This needs to be checked The following keyword needs tob efailed for successfull execution
    #Run Keyword And Continue On Failure    Input Invalid Value    Purchase Order Enter Customer PAN or Name    ${Val}
    #Sleep    1s
    #Element Should Not Be Visible    //li[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]} (${Company["Enter PAN"]})')]
    #Nagarro Gurgaon, Nagarro (QMATE1234D)    #This branch should not be visible

Check registration edit functionality, when account deactivated
    [Documentation]    Checks if deactivated account information can be edited
    [Tags]  manage  mdeactivated  manage4
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Plant List Page
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1
    SMM_Keywords.Filter Plants By Status    Deactivated
    sleep  3s
    SMM_Keywords.View Details Of Selected Plant   ${Branch["Name"]}
    SMM_Keywords.Company Registration By Department    Activate
    BrowserControl.Switch To    Verify
    Common_Keywords.Login From Department    megha.rsmml    admin
    SMM_Keywords.Verify That Customer Has Been Approved   ${Branch["Name"]}
    #One more scenario gets added, here we don't have any button of update or submit, there is only one Active Button

#Check Login process after cancellation of customer registration
#    [Tags]    Skip
#
#To check the edit process of customer details when customer registration is cancelled by MTM
#    [Tags]    Skip
#
#Check Cancel registration process for pending CROs & due payments
#    [Tags]    Skip
