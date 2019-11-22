*** Variables ***

${cycle}  SalaryCycleId
${paybillTable}   //*[@id="classListing"]/div[1]/table
${paybillTableRow}     //*[@id="classListing"]/div[1]/table/tbody/tr
#${disbursementTable}  xpath=//*[@id="EmpSalGrid"]
${reportPageTable}  xpath=//table[@id='HBA']
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
    [Arguments]  ${finDropdownID}=Finyear
    select from list by value  ${finDropdownID}  ${financialYear}

Apply Given Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the given salary cycle filter
    sleep  2s
    run keyword if  ${cycleID} != None  select from list by value  ${cycle}  ${cycleID}  ELSE  select last dropdown element  ${cycle}

Apply Last Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the last salary cycle filter
    NavigationHelper.Select Filter Menu
    select last dropdown element  ${cycle}
    NavigationHelper.Apply Filter

Show Maximum Entries
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  select last dropdown element  ${showMaxDD}

Check Paybill
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTable}  ${finDropdownID}=Finyear  ${employeeIdColumn}=3
    ${PaybillActionsColumnNumber}  Get Amount Column Number  ${paybillTable}  Actions
    ${allPaybills}  Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  Get Paybill Number  ${paybill}
    \    Go To Report Page  ${paybill}  ${PaybillActionsColumnNumber}
    \    @{list1}  Get Data Of Report Page
    \    Switch Tab
    \    Go To Disbursement Page  ${paybill}  ${PaybillActionsColumnNumber}
    \    @{list2}  Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTable}
    \    Compare And Add To Report  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    \    Go To Disbursement Index Page  ${disbursementUnitUrl}
    \    Open Filters
    \    Apply Given Financial Year  ${finDropdownID}
    \    Apply Filters
    \    sleep  5s

Get Paybill Count
    [Documentation]  Returns the number of rows in the given paybill
    ${rowsCount}  get element count  ${paybillTableRow}
    return from keyword  ${rowsCount}

Get Paybill Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Amount Column Number  ${paybillTable}  Disbursement Detail
    ${payBillDetails}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${paybillTable}  ${paybillTableRow+1}  ${columnNumber}
    #${paybillText}  get text  ${payBillDetails}
    ${paybillTextDict1}  Split String From Right   ${payBillDetails}  Paybill No.
    ${paybillTextDict2}  Split String From Right  ${paybillTextDict1}[1]  ;
    return from keyword  ${paybillTextDict2}[0]

Go To Report Page
    [Arguments]   ${paybillTableRow}  ${columnNumber}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/a[2]/i
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/ul/li[1]/a[1]

Get Data Of Report Page
    [Documentation]  Returns the list of salaries of employees listed in report page
    Switch Tab
    @{list}  create list
    ${numberOfRows}  get element count  ${reportPageTable}/tbody/tr
    ${columnNumber}  get element count  ${reportPageTable}/thead/tr/th
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  get table cell  ${reportPageTable}  ${row+1}  ${columnNumber}
    \    ${formattedAmount}  Change The Number Into A Formatted Amount  ${salary}
    \    append to list   ${list}   ${formattedAmount}
    close window
    return from keyword  @{list}

Change The Number Into A Formatted Amount
    [Documentation]  Changes the given salary into a floating point number
    [Arguments]  ${salary}
    ${formattedSalary}=  replace string  ${salary}  ,  ${EMPTY}
    ${formattedAmount}  run keyword if  '${formattedSalary}' != '${EMPTY}'  Evaluate  "%.2f" % ${formattedSalary}
    return from keyword  ${formattedAmount}

Go To Disbursement Page
    [Arguments]   ${paybill}  ${columnNumber}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[${columnNumber}]/div/div/a[1]/i

Get Data Of Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTable}
    ${numberOfRows}  get element count  ${disbursementTable}/tbody/tr
    ${columnNumber}  Get Amount Column Number  ${disbursementTable}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${textValue}  get table cell  ${disbursementTable}  ${row+1}  ${columnNumber}
    \    ${formattedAmount}  Change The Number Into A Formatted Amount  ${textValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}

Compare And Add To Report
    [Documentation]  Compares both report page list and disbursement page list and add the result of camparision into a report
    [Arguments]  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    log to console  ${list1} Data of Report Page
    log to console  ${list2} Data of Disbursement Page
    ${numberOfItems}  get length  ${list1}
    FOR  ${index}  IN RANGE  ${numberOfItems}
    \   run keyword if  '@{list1}[${index}]' != '@{list2}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}  ${disbursementTable}  ${employeeIdColumn}

Add To The Disbusement Test Report
    [Documentation]  Add unmatched salaries to the Test Report
    [Arguments]  ${paybillNumber}  ${index}  ${disbursementTable}  ${employeeIdColumn}
    ${employeeID}  Get Employee ID   ${disbursementTable}  ${index}  ${employeeIdColumn}
    ${disbursementType}  Get Disbursement Type  ${disbursementUrl}
    run keyword and continue on failure  fail  ${disbursementType}: Disbursement Amount Of Employee ID ${employeeID} in ${paybillNumber} didn't match
    append to file  ${DV_REPORT}  ${disbursementType}, ${paybillNumber}, ${employeeID}\n


Send Disbursement Test Report To Developers
    Send Error Email Notification

Get Amount Column Number
    [Documentation]  Gives the column number of the 'Net Amount' column
    [Arguments]  ${tableUrl}  ${requiredText}
    ${text2}  set variable  ${requiredText}
    ${NumberOfColumns}   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get element count  ${tableUrl}/thead/tr/th
    FOR  ${columnNumber}  IN RANGE  1  ${NumberOfColumns+1}
    \   ${text}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${tableUrl}  1  ${columnNumber}
    \   ${status}  run keyword and return status  should be equal as strings  ${text}  ${text2}
    \   run keyword if  ${status} == ${true}  return from keyword  ${columnNumber}

Get Employee ID
    [Documentation]  Returns the employee ID from the given table data
    [Arguments]  ${tableID}  ${rowNumber}  ${columnNumber}
    ${employeeData}   get table cell  ${tableID}  ${rowNumber+2}  ${columnNumber}
    ${employeeDataDict}  split string  ${employeeData}  -
    ${employeeID}  get from list  ${employeeDataDict}  0
    return from keyword  ${employeeID}

Get Disbursement Type
  [Arguments]  ${disbursementUrl}
  ${disbursementUrlDict}  split string from right  ${disbursementUrl}  /  1
  ${formattedDict}  split string  ${disbursementUrlDict}[1]  Dis
  ${disbursementType}  Catenate  ${formattedDict}[0] Disbursement
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

