*** Variables ***

${cycle}  SalaryCycleId
${paybillTableID}  //*[@id="classListing"]/div[1]/table
${paybillTableRow}     //*[@id="classListing"]/div[1]/table/tbody/tr
#${disbursementTableID}  xpath=//*[@id="EmpSalGrid"]
${reportPageTableID}  xpath=//table[@id='HBA']
${showMaxDD}  DDLpageSize
@{finalList}


*** Keywords ***
Go To Disbursement Index Page
    [Arguments]  ${disbursementUnitUrl}
    [Documentation]  Opens salary disbursement page
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/${disbursementUnitUrl}
    ${retryCount}  convert to integer  ${count}
    sleep  2s
    return from keyword  ${retryCount}


Open Filters
    NavigationHelper.Select Filter Menu

Apply Filters
    NavigationHelper.Apply Filter

Apply Given Financial Year
    [Arguments]  ${financialYearDD}=Finyear
    select from list by value  ${financialYearDD}  ${FINANCIALYEAR}

Apply Given Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the given salary cycle filter
    sleep  2s
    run keyword if  ${CYCLEID} != None  select from list by value  ${cycle}  ${CYCLEID}  ELSE  select last dropdown element  ${cycle}

Apply Last Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the last salary cycle filter
    NavigationHelper.Select Filter Menu
    select last dropdown element  ${cycle}
    NavigationHelper.Apply Filter

Show Maximum Entries
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  select last dropdown element  ${showMaxDD}

Check Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${financialYearDD}=Finyear  ${employeeIdColumn}=3
    ${PaybillTableColumnNumber}  Get Amount Column Number  ${paybillTableID}  Actions
    ${allPaybills}  Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  Get Paybill Number  ${paybill}
    \    Go To Report Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{ReportData}  Get Data Of Report Page
    \    Switch Tab
    \    Go To Disbursement Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{disbursementData}  Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    \    Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    Go To Disbursement Index Page  ${disbursementUnitUrl}
    \    Open Filters
    \    Apply Given Financial Year  ${financialYearDD}
    \    Apply Filters
    \    sleep  5s

Check Specified Paybill
    [Arguments]  ${PAYBILLNO}  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}=3
    ${PaybillTableColumnNumber}  Get Amount Column Number  ${paybillTableID}  Actions
    DisbursementIndex.Show Maximum Entries
    sleep  2s
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td/div/div/a/i[@class='fa fa-edit']
    sleep  1s
    click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td/div/div/ul/li/a[@title='Click here for Employee List']
    @{ReportData}  Get Data Of Report Page
    Switch Tab
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td/div/div/a/i[@class='fa fa-pencil']
    sleep  2s
    @{disbursementData}  Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    sleep  2s
    Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Get Paybill Count
    [Documentation]  Returns the number of rows in the given paybill
    ${rowsCount}  get element count  ${paybillTableRow}
    return from keyword  ${rowsCount}

Get Paybill Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Amount Column Number  ${paybillTableID}  Disbursement Detail
    ${payBillDetails}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${paybillTableID}  ${paybillTableRow+1}  ${columnNumber}
    ${paybillDetailSet1}  Split String From Right   ${payBillDetails}  Paybill No.
    ${paybillDetailSet2}  Split String From Right  ${paybillDetailSet1}[1]  ;
    return from keyword  ${paybillDetailSet2}[0]

Go To Report Page
    [Arguments]   ${paybillTableRow}  ${columnNumber}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/a[2]/i
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/ul/li[1]/a[1]

Get Data Of Report Page
    [Documentation]  Returns the list of salaries of employees listed in report page
    Switch Tab
    @{list}  create list
    ${numberOfRows}  get element count  ${reportPageTableID}/tbody/tr
    ${columnNumber}  get element count  ${reportPageTableID}/thead/tr/th
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${amount}  get table cell  ${reportPageTableID}  ${row+1}  ${columnNumber}
    \    ${formattedAmount}  Change The Number Into A Formatted Amount  ${amount}
    \    append to list   ${list}   ${formattedAmount}
    close window
    return from keyword  @{list}

Change The Number Into A Formatted Amount
    [Documentation]  Changes the given salary into a floating point number
    [Arguments]  ${amount}
    ${formattedAmount}=  replace string  ${amount}  ,  ${EMPTY}
    ${formattedAmount}  run keyword if  '${formattedAmount}' != '${EMPTY}'  Evaluate  "%.2f" % ${formattedAmount}
    return from keyword  ${formattedAmount}

Go To Disbursement Page
    [Arguments]   ${paybill}  ${columnNumber}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[${columnNumber}]/div/div/a[1]/i

Get Data Of Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTableID}
    ${numberOfRows}  get element count  ${disbursementTableID}/tbody/tr
    ${columnNumber}  Get Amount Column Number  ${disbursementTableID}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${amount}  get table cell  ${disbursementTableID}  ${row+1}  ${columnNumber}
    \    ${formattedAmount}  Change The Number Into A Formatted Amount  ${amount}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}

Compare And Add To Report
    [Documentation]  Compares both report page list and disbursement page list and add the result of camparision into a report
    [Arguments]  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    log to console  Comparing the amounts of Report page and Disbursement Page for paybill Number ${paybillNumber}...\n ${ReportData} ${disbursementData}
    ${numberOfItems}  run keyword if  ${ReportData} != []  get length  ${ReportData}  ELSE  get length  ${disbursementData}
    FOR  ${index}  IN RANGE  ${numberOfItems}
    \   run keyword and continue on failure  run keyword if  '@{ReportData}[${index}]' != '@{disbursementData}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}  ${disbursementTableID}  ${employeeIdColumn}
    #\   run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  There is an error in one of the pages of paybill ${paybillNumber}

Add To The Disbusement Test Report
    [Documentation]  Add unmatched salaries to the Test Report
    [Arguments]  ${paybillNumber}  ${index}  ${disbursementTableID}  ${employeeIdColumn}
    ${employeeID}  Get Employee ID   ${disbursementTableID}  ${index}  ${employeeIdColumn}
    ${disbursementType}  Get Disbursement Type  ${disbursementUrl}
    run keyword and continue on failure  fail  ${disbursementType}: Disbursement Amount Of Employee ID ${employeeID} in Paybill NUmber: ${paybillNumber} didn't match
    append to file  ${DV_REPORT}  ${disbursementType}, ${paybillNumber}, ${employeeID}\n

Send Disbursement Test Report To Developers
    Send Error Email Notification

Get Amount Column Number
    [Documentation]  Gives the column number of the 'Net Amount' column
    [Arguments]  ${tableID}  ${requiredText}
    #${text2}  set variable  ${requiredText}
    ${NumberOfColumns}   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get element count  ${tableID}/thead/tr/th
    FOR  ${column}  IN RANGE  1  ${NumberOfColumns+1}
    \   ${columnText}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${tableID}  1  ${column}
    \   ${status}  run keyword and return status  should be equal as strings  ${columnText}  ${requiredText}
    \   run keyword if  ${status} == ${true}  return from keyword  ${column}

Get Employee ID
    [Documentation]  Returns the employee ID from the given table data
    [Arguments]  ${tableID}  ${rowNumber}  ${columnNumber}
    ${employeeData}   get table cell  ${tableID}  ${rowNumber+2}  ${columnNumber}
    ${employeeDataSet}  split string  ${employeeData}  -
    ${employeeID}  get from list  ${employeeDataSet}  0
    return from keyword  ${employeeID}

Get Disbursement Type
  [Arguments]  ${disbursementUrl}
  ${disbursementUrlSet}  split string from right  ${disbursementUrl}  /  1
  ${stringSet}  split string  ${disbursementUrlSet}[1]  Dis
  ${disbursementType}  Catenate  ${stringSet}[0] Disbursement
  return from keyword   ${disbursementType}

Switch Tab
    [Documentation]  Switches the robot to the previous tab
    @{windowTitles}    get window handles
    ${windowToOpen}=    get from list    ${windowTitles}  -1
    Select Window    ${windowToOpen}

Close Last Tab
    [Documentation]  Closes the last tab
    ${title_var}        Get Window Titles
    Select Window       title=@{title_var}[0]
    close window

Close Current Tab
    [Documentation]  Closes the current tab
    ${title_var}        Get Window Titles
    Select Window       title=@{title_var}[1]
    close window