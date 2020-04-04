*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot

*** Keywords ***
Fill Customer Registration Form By Department
    [Documentation]  Fills details into customer registrataion form.
    [Arguments]    ${Mode}
    Input Valid Value    User Type    ${Branch["User Type"]}
    Run Keyword If    '${Branch["User Type"]}'=='Traders'    Input Valid Value    TCS Rate    ${Branch["TCS Rate"]}
    run keyword and ignore error  Input Valid Value    Enter PAN    ${Company["Enter PAN"]}
    sleep  1s
    ${status}  run keyword and return status  page should contain element  dailogPopup
    run keyword if  ${status} == ${True}  click button  btnCancel
#    Run Keyword If    '${Mode}'=='New Branch'    Input Valid Value    Create New Branch Button
#    ...    ELSE IF    '${Mode}'=='New Company'    Wait Until Keyword Succeeds    5s    250ms    Click Element
#    ...    PlantName-${Branch["Name"]}
    Input Valid Value    Company Type    ${Company["Company Type"]}
    Input Valid Value    Company Name    ${Company["Company Name"]}
    Input Valid Value    Company Pincode    ${Company["Company Pincode"]}
    Input Valid Value    Company Address Line 1    ${Company["Company Address Line 1"]}
    Input Valid Value    Company Address Line 2    ${Company["Company Address Line 2"]}
    Input Valid Value    Company City    ${Company["Company City"]}
    Input Valid Value    Company State    ${Company["Company State"]}
    Input Valid Value    Branch Name    ${Branch["Name"]}
    Input Valid Value    Branch Pincode    ${Branch["Pincode"]}
    Input Valid Value    Branch State    ${Branch["State"]}
    Input Valid Value    Branch City    ${Branch["City"]}
    Input Valid Value    Branch Address Line 1    ${Branch["Address Line 1"]}
    Input Valid Value    Branch Address Line 2    ${Branch["Address Line 2"]}
    run keyword and ignore error  Input Valid Value    PAN    ${Company["Enter PAN"]}
    run keyword and ignore error  Input Valid Value    PANFile    ${Company["Company PANFile"]}
    ${GSTIN}    Replace String    ${Branch["GSTIN"]}    __PAN__    ${Company["Enter PAN"]}
    Input Valid Value    GSTIN    ${GSTIN}
#    Input Valid Value    GSTINFile    ${Branch["GSTINFile"]}
    Input Valid Value    TIN    ${Branch["TIN"]}
#    Input Valid Value    TINFile    ${Branch["TINFile"]}
    Input Valid Value    IBM    ${Branch["IBM"]}
#    Input Valid Value    IBMFile    ${Branch["IBMFile"]}
    Input Valid Value    IBM Registration Date    ${Branch["IBM Registration Date"]}
#   Scroll Element Into View  //button[@id='action-Submit']

    #Run Keyword If    '${Mode}'=='Draft'    Input Valid Value    Customer Details Submit Button From Draft
    Wait Until Keyword Succeeds    5s    250ms  Run Keyword If    '${Mode}'=='Draft'  click button  //button[@id='action-Submit']
    sleep  5s
    Wait Until Keyword Succeeds    5s    250ms  Run Keyword If    '${Mode}'=='Draft'  click button  //button[@id='action-Approve']
    #Input Valid Value    Customer Details Approve Button
    #Run Keyword If    '${Mode}'=='Draft'    Input Valid Value    Customer Details Approve Button
    Run Keyword If    '${Mode}'=='Pending'    Input Valid Value    Customer Details Approve Button
    Run Keyword If    '${Mode}'=='New Company'    Input Valid Value    Customer Details Submit Button
    Run Keyword If    '${Mode}'=='New Branch'    Input Valid Value    Customer Details Submit Button
    Run Keyword If    '${Mode}'=='Existing'    Input Valid Value    Customer Details Update Button
    Run Keyword If    '${Mode}'=='Activate'    Input Valid Value    Customer Details Active Button

Fill Add Member Form
    [Documentation]  Fills details into add member form.
    ${status}  run keyword and return status  page should contain element  //span[contains(text(),'Add Member')]
    run keyword if  ${status} == ${True}  click element  //button[@id='btnView']
    Input Valid Value    SSO ID    ${SSO ID["SSOID"]}
    Input Valid Value    Your Name    ${SSO ID["Name"]}
    Input Valid Value    Your Designation    ${SSO ID["Designation"]}
    Input Valid Value    Mobile Number    ${SSO ID["Mobile Number"]}
    Input Valid Value    Alternate Mobile Number    ${SSO ID["Alternate Mobile Number"]}
    Input Valid Value    Email ID    ${SSO ID["Email ID"]}
    Input Valid Value    Fax    ${SSO ID["Fax"]}
    Input Valid Value    Member List Submit Button

Fill Plant Details Form By Department
    [Documentation]  Fills details into plant details form.
    #[Arguments]    ${Key Description}
    wait until page contains element  //*[@id="plantLocation"]
    Input Valid Value    Plant Location    ${Plant["Plant Location"]}
    Input Valid Value    Capacity of Production (in MT)    ${Plant["Capacity of Production (in MT)"]}
    Input Valid Value    Year of Commissioning    ${Plant["Year of Commissioning"]}
    Input Valid Value    Production(MT)(Prev. Year)    ${Plant["Production(MT)(Prev. Year)"]}
    Input Valid Value    Do you Purchase Minerals from Others    ${Plant["Do you Purchase Minerals from Others"]}
    sleep  3s
    run keyword and ignore error  Input Valid Value    Ratio of Other:RSMML    ${Plant["Ratio of Other:RSMML"]}
    Input Valid Value    Estimate Yearly Req.(MT)    ${Plant["Estimate Yearly Req.(MT)"]}
    Input Valid Value    Registration Number    ${Plant["Registration Number"]}
    Input Valid Value    Approx Transport Charges    ${Plant["Approx Transport Charges"]}
    Input Valid Value    Plant Capacity    ${Plant["Plant Capacity"]}
    Input Valid Value    Document Upload    ${Plant["Document Upload"]}
    Input Valid Value    Plant Details Submit Button

Approve Plant
    [Documentation]  Clicks on approve button.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    action-Approve

Reject Plant
    [Documentation]  Clicks on reject button.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value    Customer Branch Reject Button

Activate Plant
    [Documentation]  Clicks on active button.
    Input Valid Value    Customer Details Active Button

Deactivate Plant
    [Documentation]  Clicks on deactivae button.
    Input Valid Value    Customer Details Deactive Button

View Customer List
    [Documentation]  Clicks on view customer list button
    Input Valid Value    View Customer List

View Member List
    [Documentation]  Clicks on mumber list button.
    Input Valid Value    Customer Details Member List Button

View Plant Details
    [Documentation]  Clicks on plant details button.
    Wait Until Keyword Succeeds    5s    250ms    Click Button    plantDetail