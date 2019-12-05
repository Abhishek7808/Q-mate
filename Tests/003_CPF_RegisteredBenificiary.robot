*** Settings ***
Documentation  ERP Tests
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
Resource  ${PAGE OBJECTS}/Generic.robot
Resource  ${DATA}/Login_Data.robot
#Resource  ${COMMONDATA}
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Library   Collections
Library   OperatingSystem


*** Variables ***

${ENVIRONMENT}   production
${pageUrl}  CPF/RegisteredBenificiary

# login data added into Data/Login_Data.robot
${wrongEmployeeID}  05385
${beneficiaryTable}  //*[@id="classListing"]
&{employeeIdDict}

*** Keywords ***

Go To Registered Benificiary Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Get Employee ID From Summary Report Url
    [Arguments]  ${rowNumber}
    ${summaryReportUrl}  get element attribute  ${beneficiaryTable}/div[1]/table/tbody/tr[${rowNumber}]/td[8]/a  href
    ${employeeID}  split string from right  ${summaryReportUrl}  =
    return from keyword  ${employeeID}[1]

Get Employee Code from Registered Benificiary Table
    [Arguments]  ${tableID}  ${rowNumber}
    ${employeeCode}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  //*[@id="classListing"]/div[1]/table  ${rowNumber+1}  2
    return from keyword  ${employeeCode}

Apply Organisation Filter
    [Arguments]  ${organisationIndex}
    ${index}  convert to string  ${organisationIndex}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  //*[@id="DivSearchPanel"]/div[3]/button
    sleep  4s
    select from list by index  OrgCode  ${index}
    ${organisationName}  get selected list label  OrgCode
    log to console  ${organisationName} organisation
    click button  btnformfilter
    return from keyword  ${organisationName}

Select Most Number Of Elements In Page
     [Arguments]  ${pageSizeDD}
     wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  Select Last Dropdown Element  ${pageSizeDD}
     sleep  5s

Open New Tab
    Execute Javascript    window.open('')
    Get Window Titles
    Select Window    title=undefined
    # Go To   ${URL}

Check For Errors In Registered Benificiary Table
    [Arguments]  ${tableRows}  ${organisationName}
    FOR  ${row}  IN RANGE  1  ${tableRows+1}
    \   ${employeeCode}  Get Employee Code from Registered Benificiary Table  ${beneficiaryTable}  ${row}
    \   ${employeeID}  Get Employee ID From Summary Report Url  ${row}
    \   log to console  ${row}. ${employeeCode} ${employeeID} Employee Code and Empoyee ID
    \   Check Ledger Error  ${employeeID}  ${employeeCode}  ${organisationName}  2018-2019
    \   Check Ledger Error  ${employeeID}  ${employeeCode}  ${organisationName}  2019-2020
    \   Check Balance Summary Error  ${employeeID}  ${employeeCode}  ${organisationName}  2018-2019
    \   Check Balance Summary Error  ${employeeID}  ${employeeCode}  ${organisationName}  2019-2020
    \   Check Summary Report Error  ${employeeID}  ${employeeCode}  ${organisationName}

Check Ledger Error
    [Arguments]  ${employeeID}  ${employeeCode}  ${organisationName}  ${financialYear}
    Open New Tab
    Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/Reports/LedgerAccountPrint?employee_id=${employeeID}&fy=${financialYear}
    ${result}  Generic.Check Error Occurred
    run keyword if  ${result} == 1  append to file  ${CPF_REPORT}  ${organisationName}, ${employeeCode}, ${financialYear}, Error in Ledger Print\n
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  DisbursementIndex.Close Current Tab
    DisbursementIndex.Switch Tab
    #Go To Registered Benificiary Page

Check Balance Summary Error
    [Arguments]  ${employeeID}  ${employeeCode}  ${organisationName}  ${financialYear}
    Open New Tab
    Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/CPFEmployeeDetails/CPFEmployeeAccountSummary?employee_id=${employeeID}&fy=${financialYear}
    ${result}  Generic.Check Error Occurred
    # ${errorResult}  set variable if  ${result} == '1'  2
    run keyword if  ${result} == '1'  append to file  ${CPF_REPORT}  ${employeeCode}, ${financialYear}, Error in Balance Summary\n
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  DisbursementIndex.Close Current Tab
    DisbursementIndex.Switch Tab
    #Go To Registered Benificiary Page

Check Summary Report Error
    [Arguments]  ${employeeID}  ${employeeCode}  ${organisationName}
    Open New Tab
    Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/RegisteredBenificiary/EmployeeSummaryReport?emid=${employeeID}
    ${result}  Generic.Check Error Occurred
    # ${errorResult}  set variable if  ${result} == '1'  3
    run keyword if  ${result} == '1'  append to file  ${CPF_REPORT}  ${employeeCode}, Error in Summary Report\n
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  DisbursementIndex.Close Current Tab
    DisbursementIndex.Switch Tab
    #Go To Registered Benificiary Page

Send CPF Test Report To Developers
    sleep  10s
    Send Error Email Notification

*** Test Cases ***
Benificiary details of each employee should be displayed
    [Tags]  Beneficiary
    set test variable  ${LOGIN}  risl
    log to console  ${LOGIN}
    Go To ERP Page  http://rajerp.rajasthan.gov.in/Utility/PerformSwithcUser?q=UdPCBYkedDKLgHzXPnh2wg==  ${LOGIN}
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}
    #Select Most Number Of Elements In Page  DDLpageSize
    select from list by value  DDLpageSize  10
    FOR  ${item}  IN RANGE  1  6
    \   ${organisatioName}  Apply Organisation Filter  ${item}
    \   ${tableRows}  get element count  ${beneficiaryTable}/div/table/tbody/tr
    \   log to console  ${tableRows} table rows
    \   Check For Errors In Registered Benificiary Table  ${tableRows}  ${organisatioName}
    Send CPF Test Report To Developers













#For testing purpose
#    [Tags]  Testing
#    Go To ERP Page  http://rajerp.rajasthan.gov.in/Utility/PerformSwithcUser?q=UdPCBYkedDKLgHzXPnh2wg==
#    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}
#    Select Most Number Of Elements In Page  DDLpageSize
#    Check Ledger Error  39857  2126105  jvnl





#    Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/Reports/LedgerAccountPrint?employee_id=${wrongEmployeeID}&fy=2018-2019
#    sleep  10s
#    ${result}  Generic.Check Error Occurred
#    run keyword if  ${result} == '1'  append to file  ${ERRORFILE}  ${employeeCode}
#    sleep  2s

#For testing pupose
#    [Tags]  RegisteredBenificiary  ledger
#    Go To ERP Page  http://rajerp.rajasthan.gov.in/Utility/PerformSwithcUser?q=UdPCBYkedDLI4M45JKrvFg==
#    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}
#    click button  //*[@id="DivSearchPanel"]/div[3]/button
#    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  select from list by value  OrgCode  117
#    ${organisationName}  get selected list label  OrgCode
#    click button  btnformfilter
#    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  Select Last Dropdown Element  DDLpageSize
#    wait until page does not contain  //*[@id="classListing"]/comment()
#    wait until page contains element  ${beneficiaryTable}
#    sleep  5s
#    ${tableRows}  get element count  ${beneficiaryTable}/div/table/tbody/tr
#    log to console  ${tableRows} table rows
#    Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/Reports/LedgerAccountPrint?employee_id=${wrongEmployeeID}&fy=2018-2019
#    ${result}  Generic.Check Error Occurred
#    run keyword if  ${result} == '1'  append to file  ${ERRORFILE}  ${employeeCode}
#
#    FOR  ${row}  IN RANGE  1  ${tableRows}
#    \   ${employeeCode}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  //*[@id="classListing"]/div[1]/table  ${row+1}  2
#    \   ${summaryReportUrl}  get element attribute  //*[@id="classListing"]/div[1]/table/tbody/tr[${row}]/td[8]/a  href
#    \   ${employeeID}  Get Employee ID From Summary Report Url  ${summaryReportUrl}
#    \   Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/Reports/LedgerAccountPrint?employee_id=${employeeID}&fy=2018-2019
#    \   ${result}  Generic.Check Error Occurred
#    \   run keyword if  ${result} == '1'  append to file  ${ERRORFILE}  ${employeeCode}
#    \   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  DisbursementIndex.Close Last Tab
#    \   DisbursementIndex.Switch Tab
#
#
#
#
#
#Summery report of all employees should be displayed
#    [Tags]  RegisteredBenificiary
#    Go To ERP Page  http://rajerp.rajasthan.gov.in/Utility/PerformSwithcUser?q=UdPCBYkedDLI4M45JKrvFg==
#    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}
#    Select Last Dropdown Element  DDLpageSize
#    wait until page does not contain  //*[@id="classListing"]/comment()
#    wait until page contains element  ${beneficiaryTable}
#    sleep  5s
#    ${tableRows}  get element count  ${beneficiaryTable}/div/table/tbody/tr
#    log to console  ${tableRows}
#
#    FOR  ${row}  IN RANGE  1  ${tableRows}
#    \   ${employeeCode}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  //*[@id="classListing"]/div[1]/table  ${row}  2
#    \   log to console  ${employeeCode}
#    \   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${row}]/td[8]/a
#    \   ${result}  Generic.Check Error Occurred
#    \   run keyword if  ${result} == '1'  append to file  ${ERRORFILE}  ${employeeCode}
#    \   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  DisbursementIndex.Close Last Tab
#    \   DisbursementIndex.Switch Tab