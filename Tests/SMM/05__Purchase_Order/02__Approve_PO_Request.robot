*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing


*** Test Cases ***
Check edit functionality for pending PO
    [Documentation]    Edits the PO form when it is in pending mode
    [Tags]  approvepo  approvepo1
    Switch To    Department
    Go To Purchase Order List
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    PO=PO 3
    View Company Details
    Update PO By Department

PO Request Approval Process
    [Documentation]    Approves PO when submitted by the customer
    [Tags]  approvepo  approvepo2
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    PO=PO 3
    Switch To    Department
    #Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    Purchase Order=PO 1
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
    Switch To    Verify
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
    Switch To    Department
    Go To Purchase Order List
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1    PO=PO 2
    View Company Details
    sleep  2s
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Reject Button
    Input Valid Value    Purchase Order Reject Remarks    ${PO["Reject Remarks"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button
    Input Valid Value    Purchase Order Reject Edit Request    ${PO["Edit Request"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button
    Sleep    3s
    Switch To    Verify
    Go To Purchase Order List
    Click Element    //div[@id='dropdownOpen']/button/i
    Sleep    1s
    Select From List By Value    plantStatus    5
    Click Button    btnApplytFillter
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]

Check PO cancellation when status is approved or pending
    [Tags]  approvepo  approvepo4
    #When PO is in pending state
    Switch To    Department
    #Needs help from yuvraj
    Go To Purchase Order List
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 3    PO=PO 1
    View Company Details
    Input Valid Value    Purchase Order Agreement    ${PO["Document Upload"]}
    Input Valid Value    Purchase Order Reject Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Reject Remarks    ${PO["Reject Remarks"]}
    Input Valid Value    Purchase Order Reject Remarks Submit Button
    #When PO is in Approved state
    Switch To    Department
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
