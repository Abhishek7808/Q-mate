*** Settings ***
Library           SeleniumLibrary
Resource          ${RESOURCES}${/}Fields${/}Field.robot

*** Keywords ***
Company Registration By Customer
    [Arguments]    ${Branch Creation}    ${Mode}
    sleep  2s
    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Type"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Name"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Pincode"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Address Line 1"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='New'    Set To Dictionary    ${Key Description["Company Address Line 2"]}    Type=Disabled
    ${Value}    Set Variable    Disabled
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Type"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Name"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Pincode"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Address Line 1"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Company Address Line 2"]}    Type=Disabled
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Name"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Pincode"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Address Line 1"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["Branch Address Line 2"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["GSTIN"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["TIN"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["IBM"]}    Type=${Value}
    Run Keyword If    '${Branch Creation}'=='Existing'    Set To Dictionary    ${Key Description["IBM Registration Date"]}    Type=${Value}
    #Log    ${Key Description}
    Input Valid Value    User Type    ${Branch["User Type"]}
    Run Keyword If    '${Branch["User Type"]}'=='Traders'    Input Valid Value    TCS Rate    ${Branch["TCS Rate"]}
    Input Valid Value    Enter PAN    ${Company["Enter PAN"]}
    Sleep    1s
    #
    ${status}  run keyword and return status  page should contain  Create New Branch?
    run keyword if  ${status} == ${True} and '${Branch Creation}'!='New'  click button  btnCancel
    Run Keyword If  ${status} == ${True} and '${Branch Creation}'=='New'    Input Valid Value    Create New Branch Button
    Run Keyword If    '${Branch Creation}'=='Existing'    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}')]
    run keyword and ignore error  Input Valid Value    Company Type    ${Company["Company Type"]}
    run keyword and ignore error  Input Valid Value    Company Name    ${Company["Company Name"]}
    run keyword and ignore error  Input Valid Value    Company Pincode    ${Company["Company Pincode"]}
    run keyword and ignore error  Input Valid Value    Company Address Line 1    ${Company["Company Address Line 1"]}
    run keyword and ignore error  Input Valid Value    Company Address Line 2    ${Company["Company Address Line 2"]}
    run keyword and ignore error  Input Valid Value    Company City    ${Company["Company City"]}
    run keyword and ignore error  Input Valid Value    Company State    ${Company["Company State"]}
    #run keyword and ignore error  click element  //*[@id="btnCancel"]/span[1]
    Input Valid Value    Branch Name    ${Branch["Name"]}
    Input Valid Value    Branch Pincode    ${Branch["Pincode"]}
    Input Valid Value    Branch State    ${Branch["State"]}
    Input Valid Value    Branch City    ${Branch["City"]}
    Input Valid Value    Branch Address Line 1    ${Branch["Address Line 1"]}
    Input Valid Value    Branch Address Line 2    ${Branch["Address Line 2"]}
    Run Keyword If    '${Mode}'!='Edit'    Input Valid Value    Company Details Submit Button
    Run Keyword If    '${Mode}'!='Edit'    Input Valid Value    Contact Details Submit Button
    Sleep    2s
    ${GSTIN}    Replace String    ${Branch["GSTIN"]}    __PAN__    ${Company["Enter PAN"]}
    Input Valid Value    PANFile    ${Company["Company PANFile"]}
    Sleep    1s
    Input Valid Value    GSTIN    ${GSTIN}
    Input Valid Value    GSTINFile    ${Branch["GSTINFile"]}
    Input Valid Value    TIN    ${Branch["TIN"]}
    Input Valid Value    TINFile    ${Branch["TINFile"]}
    Input Valid Value    IBM    ${Branch["IBM"]}
    Input Valid Value    IBMFile    ${Branch["IBMFile"]}
    Run Keyword If    '${Mode}'!='Edit'    Input Valid Value    IBM Registration Date    ${Branch["IBM Registration Date"]}
    Sleep    3s
    Run Keyword If    '${Mode}'=='Pending'    Input Valid Value    Customer Details Submit Button
    #Run Keyword If    '${Mode}'=='Draft'  click button  //button[@id='action-Submit']
    Run Keyword If    '${Mode}'=='Draft'    Input Valid Value    Customer Details Update Button
