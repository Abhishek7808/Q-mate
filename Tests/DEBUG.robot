*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Library   ${LIBRARY}/Notifications.py
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Resource  ${PAGE OBJECTS}/ModuleNavigation.robot
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
Library   Collections
Resource  ${PAGE OBJECTS}/TopNavigation.robot


*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
#Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot --loglevel debug -d Results Tests/DEBUG.robot

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
${number} =  1
#${num}  convert to integer  3
${disbursementUrl}  HRM/HonorariumDisbursement/BonusDisbursementIndex
${paybillString}  Paybill No. :1011/2018-2019 Date : 04-DEC-2019 Pay Group :RIICO Staff (Head Office) ;

Paybill No. 1001/20182019 ; Date 30-Mar-2019
Paybill No. :1011/2018-2019 Date : 04-DEC-2019 Pay Group :RIICO Staff (Head Office) ;

*** Test Cases ***


Delete the data of all companies and ssoids
    [Documentation]    Deletes the data of company and SSO ID
    [Tags]  delete  Himself
    set test variable    ${panNo}    QMATE1234D
    Delete Data Of Company    ${panNo}
    set test variable    ${panNo}    QMATE1234C
    Delete Data Of Company    ${panNo}
    set test variable    ${panNo}    QMATE6665Q
    Delete Data Of Company    ${panNo}
    set test variable    ${panNo}    QMATE5555T
    Delete Data Of Company    ${panNo}
    set test variable    ${ssoId}    archit010
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    chauhan.yuvi
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    1860
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    1862
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    1863
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    shahshubham
    Delete Data Of SSOID    ${ssoId}

Delete Data Of Given SSOID Or Company
    [Tags]  deletegiven
    run keyword if  '${COMPANYPAN}' != 'None'  Delete Data Of Company  ${COMPANYPAN}
    run keyword if  '${SSOIDNAME}' != 'None'  Delete Data Of SSOID  ${SSOIDNAME}

Check Customer Registration Process
    [Documentation]    Done
    [Tags]  debug
    #go to  google.com
    Switch To    Customer
    #Delete Data of Company    ${Test Data["${CONFIG["Company Customer 1"]}"]["Enter PAN"]}
    #Delete Data of Company    ${Test Data["${CONFIG["Company Customer 2"]}"]["Enter PAN"]}
    set test variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Delete Data Of SSOID    ${SSO ID["SSOID"]}
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Sleep    2s
    Company Registration By Customer    Fresh    Pending
    Sleep    3s

Check new branch registration when the company already have branches registered in it
    [Documentation]    Done
    [Tags]  alreadybranches  Himself  himself2
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    xpath=//div/button//span[text()='Customer']
    Sleep    2s
    Company Registration By Customer    New    Pending
    Sleep    3s

Check the branch registration when user selects branch from an existing registered branches in a company with diffrent SSOID
    [Documentation]    This is not working when we are using same ssoid
    [Tags]  userselectsbranch  Himself  himself3
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 3
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Company Registration By Customer    Existing    Pending
    Sleep    3s

Check the registration process when customer has partially filled the application
    [Documentation]    Done
    [Tags]  partially  Himself  himself4
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 6    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Sleep    2s
    Company Registration By Customer    Fresh    Draft
    Sleep    1s
    go to  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    sleep  2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Click Link    \#CitizenServices
    Sleep    2s
    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Sleep    2s
    Page should Contain Element    //button/span[contains(text(),'Draft')]
    Click Button    btnSubmitCustDetail
    Sleep    5s
    Page should Contain Element    //span[text()='Pending']

Check the draft branch visibility in 'View Branch' option on registration form
    [Documentation]    Done
    [Tags]  branchvisibility  Himself  himself5
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 3    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Sleep    2s
    Company Registration By Customer    New    Draft
    go to  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click element    xpath=//div/button//span[text()='Customer']
    Input Text    ${Key Description["Enter PAN"]["Locator"]}    QMATE6665Q
    Set Focus To Element    ${Key Description["Enter PAN"]["Locator"]}
    Click Element    ${Key Description["Company Type"]["Locator"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should contain element    //div[contains(text(),'${Branch["Name"]}')]

Check the reject process of customer registration by departmental user
    [Documentation]    Done
    [Tags]  reject  Himself  himself6
    set test variables    Company=Company Customer 2    Branch=Branch Customer 6    SSO ID=SSOID 2
    Switch To    Department
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Customer/PlantList
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    uncontrolled    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    //div[@id='dropdownOpen']/button
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    chkViewAll
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    plantStatus    Pending
    Sleep    1s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnApplyFillter
    sleep  2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value    Customer Branch Reject Button
    Switch To    Customer
    Go To    http://demoprojects.e-connectsolutions.com/erp-demo/temp/sso.aspx
    Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  Click Element    //div[contains(text(),'I want to purchase mineral')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    //span[text()='Rejected']

Check the edit process of customer details when customer is not approved by department
    [Tags]  notapproved  Himself  himself7
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Sleep    2s
    Company Registration By Customer    Fresh    Edit
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnUpdateCustDetail
    #Sleep    5s

Check the approval process of customer registration by departmental user
    [Documentation]    Done
    [Tags]  approval  Himself  himself8
    Switch To    Department
    Login From Department    archit.rsmml    admin
    set test variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Customer/PlantList
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    uncontrolled    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    //div[@id='dropdownOpen']/button
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    chkViewAll
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    plantStatus    Pending
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnApplyFillter
    sleep  2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[@title='View']
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    action-Approve
    Sleep    5s
    Switch To    Customer
    Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  Click Element    //div[contains(text(),'I want to purchase mineral')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    //span[text()='Approved']

Check the edit process of customer details when customer is approved by department
    [Documentation]    Done
    [Tags]  customerapproved  Himself  himself9
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  Click Element    //div[contains(text(),'I want to purchase mineral')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Element should not be visible    btnUpdateCustDetail

Check the TCS rate applicable according to customer-wise
    [Documentation]    Done
    [Tags]  TCS  Himself  himself10
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Sleep    2s
    Input Select    ${Key Description["User Type"]["Locator"]}    Purchaser
    Sleep    2s
    Press Keys    ${Key Description["User Type"]["Locator"]}    TAB
    Element Should Be Disabled    ${Key Description["TCS Rate"]["Locator"]}



#
#    Common_Keywords.Open SalaryDisbursement Page  ${finalList}

#
#    sleep  10s
#
#    Mouse Down    xpath=//li[contains(.,'Udaipur')]
#   select last dropdown element  ${PERFERENCE DROPDOWN}

#
#    log to console  ${number}
#    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}${HRMS.link}
#    sleep  4s
#    ${floatnum}  Evaluate  "%.2f" % ${number}
#    #${floatnum2}  convert to number  ${floatnum}  2
#    log to console  ${floatnum}
     #${num}  convert to integer  ${number}

#     ${num}  set variable  ${num+1}
#     log to console  ${num}
#     FOR  ${i}  IN RANGE  1  5
#     \   ${num}  set variable  ${num+1}
#     \   log to console  ${num}
#    run keyword if  ${num} == '${EMPTY}'  log to console  hi

#   ${disbursementUrlDict}  split string from right  ${disbursementUrl}  /  1
#   log to console  ${disbursementUrlDict}
#   ${formattedDict}  split string  ${disbursementUrlDict}[1]  Dis
#   ${disbursementType}  Catenate  ${formattedDict}[0] Disbursement
#   log to console  ${disbursementType}
#    ${second}  Split String From Right  ${first}[1]  ;
#    log to console  ${second}

*** Keywords ***
