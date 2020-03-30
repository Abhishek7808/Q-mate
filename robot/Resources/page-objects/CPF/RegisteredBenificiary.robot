*** Variables ***
${pageUrl}  CPF/RegisteredBenificiary

*** Keywords ***
Go To Registered Benificiary Page
    [Documentation]  switches user and opens registered beneficiary page.
    Go To ERP Page  http://rajerp.rajasthan.gov.in/Utility/PerformSwithcUser?q=UdPCBYkedDKLgHzXPnh2wg==  risl
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Get Employee ID From Summary Report Url
    [Documentation]  Fetches employee id from summery url.
    [Arguments]  ${rowNumber}
    ${summaryReportUrl}  get element attribute  ${beneficiaryTable}/div[1]/table/tbody/tr[${rowNumber}]/td[8]/a  href
    ${employeeID}  split string from right  ${summaryReportUrl}  =
    return from keyword  ${employeeID}[1]

Get Employee Code from Registered Benificiary Table
    [Documentation]  Gets employee code from registered benificiary table.
    [Arguments]  ${tableID}  ${rowNumber}
    ${employeeCode}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  //*[@id="classListing"]/div[1]/table  ${rowNumber+1}  2
    return from keyword  ${employeeCode}

Apply Organisation Filter
    [Documentation]  Opens Organisation filters and selects organisation.
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
    [Documentation]  lists maximum entries on a page.
    [Arguments]  ${pageSizeDD}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  Select Last Dropdown Element  ${pageSizeDD}
    sleep  5s

Open New Tab
    [Documentation]  Opens new tab.
    Execute Javascript    window.open('')
    Get Window Titles
    Select Window    title=undefined
    # Go To   ${URL}

Check For Errors In Registered Benificiary Table
    [Documentation]  checks ledger, balance summary and summary report errors for each employee.
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
    [Documentation]  Checks for error in ledger summery page.
    [Arguments]  ${employeeID}  ${employeeCode}  ${organisationName}  ${financialYear}
    Open New Tab
    Go To ERP Page  http://rajerp.rajasthan.gov.in/CPF/Reports/LedgerAccountPrint?employee_id=${employeeID}&fy=${financialYear}
    ${result}  Generic.Check Error Occurred
    run keyword if  ${result} == 1  append to file  ${CPF_REPORT}  ${organisationName}, ${employeeCode}, ${financialYear}, Error in Ledger Print\n
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  DisbursementIndex.Close Current Tab
    DisbursementIndex.Switch Tab
    #Go To Registered Benificiary Page

Check Balance Summary Error
    [Documentation]  Checks for error in balance summery page.
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
    [Documentation]  Chekcs for error in summery report page.
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
    [Documentation]  Sends an email in which employees with errors are listed.
    sleep  10s
    Send Error Email Notification  None  None  Cpf Beneficiary