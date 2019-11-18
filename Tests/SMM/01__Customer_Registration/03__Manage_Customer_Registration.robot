*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot

# robot -d Results Tests/SMM/01__Customer_Registration/03__Manage_Customer_Registration.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing

*** Test Cases ***
To check the edit process of customer details when customer is not approved by department
    [Documentation]    Edits the details of a customer when it has not been approved by department i.e. pending state
    set test variables    Company=Company Customer 3    Branch=Branch Customer 5
    Switch To    Department
    Go To Customer List
    Apply Filter    1
    sleep  2s
    View Company Details
    Company Registration By Department    Draft
    #Input Valid Value    Customer Details Approve Button
    Go To Customer List
    Apply Filter    4
    Go To Add Purchase Order From Department
    #Fill PO By Department
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Button    btnSubmit
    #Switch To    Verify
    #Go To Customer List
    #Apply Filter    4
    #Needs to be checked

To check the edit process of customer details when customer is approved by department
    [Documentation]    Edits the details of a customer when it has been approved by department
    Switch To    Customer
    set test variables    Company=Company Department 1    Branch=Branch Department 3    SSO ID=SSOID 3
    #set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    5s    250ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Capture Page Screenshot
    Element Should Not Be Visible    btnUpdateCustDetail

Check Cancel Customer Registration
    [Documentation]    Deactivates an application by Marketing Team Member
    Switch To    Department
    set test variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1
    Go To Customer List
    Apply Filter    4
    View Company Details
    Input Valid Value    Customer Details Deactive Button
    Sleep    2s
    Switch To    Verify
    Go To Customer List
    Apply Filter    667
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain    ${Branch["Name"]},${Company["Company Name"]}
    #&{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Company["Company Name"]} (${Company["Enter PAN"]})
    #Go To Add Purchase Order From Department
    #This needs to be checked The following keyword needs tob efailed for successfull execution
    #Run Keyword And Continue On Failure    Input Invalid Value    Purchase Order Enter Customer PAN or Name    ${Val}
    #Sleep    1s
    #Element Should Not Be Visible    //li[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]} (${Company["Enter PAN"]})')]
    #Nagarro Gurgaon, Nagarro (QMATE1234D)    #This branch should not be visible

Check registration edit functionality, when account deactivated
    [Documentation]    Checks if deactivated account information can be edited
    Switch To    Department
    set test variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1
    Go To Customer List
    Apply Filter    667
    View Company Details
    Company Registration By Department    Activate
    Switch To    Verify
    Go To Customer List
    Input Valid Value    Customer Search By Branch    ${Branch["Name"]}
    Apply Filter    4
    Sleep    2s
    Page Should Contain Element    //td[contains(text(),'${Branch["Name"]},${Company["Company Name"]}')]
    #One more scenario gets added, here we don't have any button of update or submit, there is only one Active Button

#Check Login process after cancellation of customer registration
#    [Tags]    Skip
#
#To check the edit process of customer details when customer registration is cancelled by MTM
#    [Tags]    Skip
#
#Check Cancel registration process for pending CROs & due payments
#    [Tags]    Skip
