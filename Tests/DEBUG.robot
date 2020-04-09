*** Settings ***
Documentation  ERP Tests
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${DATA}/Login_Data.robot
#Resource  ${COMMONDATA}
Library   Collections
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
#*** Settings ***
#Resource  ../Configuration.resource
#Resource  ${RESOURCES}/Common_Keywords.robot
#Library   ${LIBRARY}/Notifications.py
#Resource  ${RESOURCES}/ERP_Keywords.robot
#Resource  ${DATA}/Login_Data.robot
#Resource  ${PAGE OBJECTS}/ModuleNavigation.robot
#Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
#Library   Collections
#Resource  ${PAGE OBJECTS}/TopNavigation.robot
#
#
#*** Settings ***
#Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
#Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Clear.robot
#Resource          ${RESOURCES}${/}SMMFormHelpers${/}Input.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}InputFields.robot
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
<<<<<<< HEAD
${string}  Period:September Date: 15-Nov-2019 Paybill No. 1012/2019-2020 ; Date 15-Nov-2019 Amount: 70,459.00 ; Payment Mode: Cheque (Disburse Bank : Bank of Baroda Tilak Marg) Unit: Head Office ; Remarks:



=======
${disbursementUrl}  HRM/HonorariumDisbursement/BonusDisbursementIndex
${paybillString}  Paybill No. :1011/2018-2019 Date : 04-DEC-2019 Pay Group :RIICO Staff (Head Office) ;
${configurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json
#Paybill No. 1001/20182019 ; Date 30-Mar-2019
#Paybill No. :1011/2018-2019 Date : 04-DEC-2019 Pay Group :RIICO Staff (Head Office) ;
>>>>>>> 7191cb72d3076808980cc9862382ddd79e36f721

*** Test Cases ***
Testing hrms
    [Tags]  debughrms
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    click element  modals-bootbox-custom
    ${configJson}  Common_Keywords.Load Json File  ${configurationData}
    InputFields.input date  ${configJson["Tea Rate Definition"]["Effective Date"]["Locator"]}  ${configJson["Tea Rate Definition"]["Effective Date"]["Value"]}
    Clear Date  ${configJson["Tea Rate Definition"]["Effective Date"]["Locator"]}
    sleep  2s

Testing xpaths
    [Tags]  debugxpath
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/salaryDisbursment/SalayDisbursmentIndex
    sleep  2s
    DisbursementIndex.Show Maximum Entries
    sleep  3s
    click element  //span[contains(text(),'1012/2019-2020')]/../following-sibling::td//i[@class='fa fa-pencil']
    click element  //span[contains(text(),'1012/2019-2020')]/../following-sibling::td//a[@class='btn btn-sm btn-primary']
    sleep  1s
    click element  //span[contains(text(),'1012/2019-2020')]/../following-sibling::td//a[contains(text(),'Employee List')]
    #${text}  get text  //span[contains(text(),'1001/20182019')]/../child::span[position()=1]
    click element  //span[contains(text(),'1001/20182019')]/../following-sibling::td//i[@class='fa fa-eye']
    click element  //span[contains(text(),'1001/20182019')]/../following-sibling::td//a[@class='btn btn-sm btn-primary']
    sleep  1s
    click element  //a[contains(text(),'Employee List')]
    sleep  3s
    #log to console  ${text}


#    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/URM/WORKFLOW
#    sleep  2s
#    page should contain element  //td[contains(text(),'138')]
#    #click element  //td[contains(text(),'138')]/following-sibling::td//a[contains(text(),'Actions')]//a[@class='btn btn-primary']
#    click element  //td[contains(text(),'138')]/following-sibling::td//a[@class='btn btn-primary']
#    sleep  2s
#    click element  //a[contains(text(),'Configure')]
#    #select from list by index  //td[contains(text(),'138')]/following-sibling::td//a[@class='btn btn-primary']  0
#    sleep  2s

#     Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EmployeePosition/AddEditPosition
#     sleep  3s
#     Wait Until Keyword Succeeds    5s    250ms    click element  //div[@class='btn-group']
#     click element  //label[contains(text(),'AAO')]
     #Wait Until Keyword Succeeds    5s    250ms    select from list by label  MSDECISION_IMPACT_ON  Salary
#     sleep  4s
#     ${configJson}  Common_Keywords.Load Json File  ${configurationData}
#     set test variable  ${postClass}  ${configJson["Post Class"]}
#     #log to console  ${postClass["Add New Post Class"]["Locator"]}
#     Wait Until Keyword Succeeds    5s    250ms    click link  ${postClass["Add New Post Class"]["Locator"]}
#     sleep  2s
#     input text  ${postClass["Name"]["Locator"]}  ${postClass["Name"]["Value"]}
##     click element  ${postClass["Class Group"]["Locator"]}
##     sleep  3s
#     Wait Until Keyword Succeeds    5s    250ms    select from list by label  ${postClass["Class Group"]["Locator"]}  ${postClass["Class Group"]["Value"]}
#     input text  ${postClass["Seniority Level"]["Locator"]}  ${postClass["Seniority Level"]["Value"]}
#     click button  ${postClass["Save"]["Locator"]}




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

<<<<<<< HEAD
    log to console  ${string}
    ${first}  Split String From Right  ${string}  Paybill No.
    log to console  ${first}
    ${second}  Split String From Right  ${first}[1]  ;
    log to console  ${second}
=======
#   ${disbursementUrlDict}  split string from right  ${disbursementUrl}  /  1
#   log to console  ${disbursementUrlDict}
#   ${formattedDict}  split string  ${disbursementUrlDict}[1]  Dis
#   ${disbursementType}  Catenate  ${formattedDict}[0] Disbursement
#   log to console  ${disbursementType}
#    ${second}  Split String From Right  ${first}[1]  ;
#    log to console  ${second}
>>>>>>> 7191cb72d3076808980cc9862382ddd79e36f721

*** Keywords ***
