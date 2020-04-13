*** Settings ***
Documentation  ERP Tests
Resource  ../../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/CPF_Keywords.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
Resource  ${PAGE OBJECTS}/Generic.robot
Resource  ${DATA}/Login_Data.robot
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Library   Collections
Library   OperatingSystem


*** Variables ***

${ENVIRONMENT}   production
${pageUrl}  CPF/RegisteredBenificiary

# login data added into Data/Login_Data.robot
${wrongEmployeeID}  05385

&{employeeIdDict}

*** Test Cases ***
Benificiary details of each employee should be displayed
    [Documentation]  Checks for employees ledger in registered beneficiary table.
    [Tags]  Beneficiary
    CPF_Keywords.Open Registered Benificiary Page
    Common_Keywords.Show Maximum Entries on Page
    CPF_Keywords.Check Registered Benificiary













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