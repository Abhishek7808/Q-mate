*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot




*** Test Cases ***
Check edit functionality for pending PO
    [Documentation]    Edits the PO form when it is in pending mode
    [Tags]  approvepo  approvepo1
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Purchase Order List
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 3
    View Company Details
    Update PO By Department

PO Request Approval Process
    [Documentation]    Approves PO when submitted by the customer
    [Tags]  approvepo  approvepo2
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 3
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    #Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    Purchase Order=PO 1
    Go To Purchase Order List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    plantStatus    41
    Click Button    btnApplyFillter
    Sleep    5s
    View Company Details
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Approve Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Confirm Approval Button
    Sleep    5s
    #Apply Filter    4
    #Page Should Not Contain Element    ${Branch["Name"]},${Company["Company Name"]}
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Purchase Order List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    plantStatus    4
    Click Button    btnApplyFillter
    Sleep    5s
    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]

PO Request Rejection Process
    [Documentation]    Rejects PO when submitted by the customer
    [Tags]  approvepo  approvepo3
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Purchase Order List
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2    PO=PO 2
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    plantStatus    4
    Click Button    btnApplyFillter
    sleep  3s
    View Company Details
    sleep  2s
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Reject Button
    Input Valid Value    Purchase Order Reject Remarks    ${PO["Reject Remarks"]}
    #Input Valid Value    Purchase Order Reject Edit Request    ${PO["Edit Request"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button
    Sleep    3s
    BrowserControl.Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Purchase Order List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    plantStatus    5
    Click Button    btnApplyFillter
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]

Check PO cancellation when status is approved or pending
    [Tags]  approvepo  approvepo4
    #When PO is in pending state
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    #Needs help from yuvraj
    Go To Purchase Order List
    Common_Keywords.Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 3    PO=PO 1
    input text  searchText  ${Branch["Name"]}
    sleep  3s
    View Company Details
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Reject Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Reject Remarks    ${PO["Reject Remarks"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button
    #When PO is in Approved state
    BrowserControl.Switch To    Department
    Go To Purchase Order List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    plantStatus    4
    Click Button    btnApplyFillter
    Sleep    5s
    View Company Details
    #Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Reject Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Reject Remarks    ${PO["Reject Remarks"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button
    Sleep    2s

#Check edit functionality for approved PO
#    [Tags]    Skip
#
#Check edit functionality for rejected PO
#    [Tags]    Skip
