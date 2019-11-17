*** Variables ***

${cycle}  SalaryCycleId
${paybillTable}   //*[@id="classListing"]/div[1]/table
${paybillTableRow}     //*[@id="classListing"]/div[1]/table/tbody/tr
#${disbursementTable}  xpath=//*[@id="EmpSalGrid"]
${reportPageTable}  xpath=//table[@id='HBA']
@{finalList}


*** Keywords ***
Go To Disbursement Index Page
    [Arguments]  ${disbursementUnitUrl}
    [Documentation]  Opens salary disbursement page
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/${disbursementUnitUrl}
    ${testCount}  convert to integer  ${count}
    sleep  2s
    return from keyword  ${testCount}

#Go To Arrear Disbursement Index Page
#    go to erp page  ${BASE_URL.${ENVIRONMENT}}/${disbursementIndex}
#    ${testCount}  convert to integer  ${count}
#    sleep  2s
#    return from keyword  ${testCount}

#Complete follwoing keyword, it will take unit as an argument and perform tests on it.
#Match All Paybills Net Amount With The Report For Given Unit
#    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
#    [Arguments]  ${unitID}  ${testCount}  ${disbursementUrl}  ${columnText}  ${disbursementTable}
#    run keyword if  ${unitID} != None  TopNavigation.Select Unit In Preference Modal By ID  ${unitID}  ${testCount}
#    Go To Disbursement Index Page  ${disbursementUrl}
#    # Apply Given Cycle Filter
#    sleep  2s
#    Check Paybill  ${disbursementUrl}  ${columnText}  ${disbursementTable}

#Match All Paybills Net Amounts With Reports For All Units
#    [Documentation]  Matches the Salaries in disburement page and report page for all units
#    [Arguments]  ${testCount}  ${disbursementUrl}  ${columnText}  ${disbursementTable}
#    TopNavigation.Open Preference Unit Page
#    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
#    log to console  ${allUnits} number of total units
#    FOR  ${unit}  IN RANGE  1  ${allUnits}
#    \   log to console  ${unit} unit
#    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${testCount}
#    \   Go To Disbursement Index Page  ${disbursementUrl}
#    \   Apply Given Cycle Filter
#    \   sleep  2s
#    \   Check Paybill  ${disbursementUrl}  ${columnText}  ${disbursementTable}
#    \   TopNavigation.Open Preference Unit Page


Apply Given Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the given salary cycle filter
    NavigationHelper.Select Filter Menu
    run keyword if  ${cycleID} != None  select from list by value  ${cycle}  ${cycleID}  ELSE  select last dropdown element  ${cycle}
    NavigationHelper.Apply Filter

Apply Last Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the last salary cycle filter
    NavigationHelper.Select Filter Menu
    select last dropdown element  ${cycle}
    NavigationHelper.Apply Filter

Check Paybill
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTable}  ${employeeIdColumn}=3
    ${allPaybills}  Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    ${paybillNumber}  Get Paybill Number  ${paybill}
    \    @{list1}  Get Data Of Report Page  ${paybill}
    \    @{list2}  Get Data Of Disbursement Details Page  ${paybill}  ${columnToBeFetched}  ${disbursementTable}
    \    Compare And Add To Report  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    \    Go To Disbursement Index Page  ${disbursementUnitUrl}
   # log to console  ${finalList} Final List

Get Paybill Count
    [Documentation]  Returns the number of rows in the given paybill
    ${rowsCount}  get element count  ${paybillTableRow}
    log to console  ${rowsCount} rows in paybill table
    return from keyword  ${rowsCount}


Get Paybill Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Amount Column Number  ${paybillTable}  Disbursement Detail
    ${payBillDetails}  get table cell  ${paybillTable}  ${paybillTableRow+1}  ${columnNumber}
    #${paybillText}  get text  ${payBillDetails}
    ${paybillTextDict1}  Split String From Right   ${payBillDetails}  Paybill No.
    ${paybillTextDict2}  Split String From Right  ${paybillTextDict1}[1]  ;
    # log to console  ${paybillTextDict} paybill dictionary
    return from keyword  ${paybillTextDict2}[0]


Get Data Of Report Page
    [Documentation]  Returns the list of salaries of employees listed in report page
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Amount Column Number  ${paybillTable}  Actions
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/a[2]/i
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/ul/li[1]/a[1]
    Switch Tab
    @{list}  create list
    ${numberOfRows}  get element count  ${reportPageTable}/tbody/tr
    ${columnNumber}  get element count  ${reportPageTable}/thead/tr/th
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  get table cell  ${reportPageTable}  ${row+1}  ${columnNumber}
    \    ${decimalSalary}  Change The Number Into A Formatted Amount  ${salary}
    \    append to list   ${list}   ${decimalSalary}
    close window
    return from keyword  @{list}

Change The Number Into A Formatted Amount
    [Documentation]  Changes the given salary into a floating point number
    [Arguments]  ${salary}
    ${formattedSalary}=  replace string  ${salary}  ,  ${EMPTY}
    ${decimalSalary}  run keyword if  '${formattedSalary}' != '${EMPTY}'  Evaluate  "%.2f" % ${formattedSalary}
    return from keyword  ${decimalSalary}

Get Data Of Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${paybill}  ${columnToBeFetched}  ${disbursementTable}
    Switch Tab
    ${columnNumber}  Get Amount Column Number  ${paybillTable}  Actions
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[${columnNumber}]/div/div/a[1]/i
    ${numberOfRows}  get element count  ${disbursementTable}/tbody/tr
    ${columnNumber}  Get Amount Column Number  ${disbursementTable}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${status}  run keyword and return status  should be equal as strings  ${columnToBeFetched}  Amount to be Disbursed
    \    ${elementValue}  Run Keyword if  ${status} == ${True}  get element attribute  //*[@id="EmpSalGrid"]/tbody/tr[1]/td[${columnNumber}]/input  value
    \    log to console  ${elementValue} value red from table
    \    ${textValue}  get table cell  ${disbursementTable}  ${row+1}  ${columnNumber}
    \    ${finalValue}  set variable if  ${elementValue} == None or ${elementValue} == '${EMPTY}'  ${textValue}  ${elementValue}
    \    log to console  ${finalValue} value of disbursed amount
    \    ${decimalSalary}  Change The Number Into A Formatted Amount  ${finalValue}
    \    append to list  ${list}  ${decimalSalary}
    return from keyword  @{list}

Compare And Add To Report
    [Documentation]  Compares both report page list and disbursement page list and add the result of camparision into a report
    [Arguments]  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    log to console  ${list1} data of report page
    log to console  ${list2} data of disbursement page
    ${numberOfItems}  get length  ${list1}
    FOR  ${index}  IN RANGE  ${numberOfItems}
    \   run keyword if  '@{list1}[${index}]' != '@{list2}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}  ${disbursementTable}  ${employeeIdColumn}


Get Amount Column Number
    [Documentation]  Gives the column number of the 'Net Amount' column
    [Arguments]  ${tableUrl}  ${requiredText}
    log to console  ${requiredText}
    ${text2}  set variable  ${requiredText}
    log to console  ${text2}
    ${NumberOfColumns}  get element count  ${tableUrl}/thead/tr/th
    log to console  ${NumberOfColumns} total number of columns in disbursement table
    FOR  ${columnNumber}  IN RANGE  1  ${NumberOfColumns+1}
    \   ${text}   get table cell  ${tableUrl}  1  ${columnNumber}
    \   log to console  ${text}
    \   ${status}  run keyword and return status  should be equal as strings  ${text}  ${text2}
    \   run keyword if  ${status} == ${true}  return from keyword  ${columnNumber}
    \   log to console  ${columnNumber}


Add To The Disbusement Test Report
    [Documentation]  Add unmatched salaries to the Test Report
    [Arguments]  ${paybillNumber}  ${index}  ${disbursementTable}  ${employeeIdColumn}
    ${employeeID}  DisbursementIndex.Get Employee ID   ${disbursementTable}  ${index}  ${employeeIdColumn}
    run keyword and continue on failure  fail  Salary of Employee ID ${employeeID} in ${paybillNumber} didn't match
    append to file  ${ERRORFILE}  Paybill No. ${paybillNumber}, Employee ID. ${employeeID}\n

Get Employee ID
    [Documentation]  Returns the employee ID from the given table data
    [Arguments]  ${tableID}  ${rowNumber}  ${columnNumber}
    ${employeeData}   get table cell  ${tableID}  ${rowNumber+2}  ${columnNumber}
    ${employeeDataDict}  split string  ${employeeData}  -
    ${employeeID}  get from list  ${employeeDataDict}  0
    return from keyword  ${employeeID}

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


#Set This Variable
#    [Arguments]  ${number}  ${item}
#    ${number}  set variable  ${item}
#    log to console  ${number}
#
#    return from keyword  ${number}