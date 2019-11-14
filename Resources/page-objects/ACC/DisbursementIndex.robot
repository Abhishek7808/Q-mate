*** Variables ***
${disbursementIndex}  HRM/salaryDisbursment/SalayDisbursmentIndex
${cycle}  SalaryCycleId
${paybillTableRow}     //*[@id="classListing"]/div[1]/table/tbody/tr
${disbursementTable}  xpath=//*[@id="EmpSalGrid"]
${reportPageTable}  xpath=//table[@id='HBA']
@{finalList}


*** Keywords ***
Go To Disbursement Index Page
    [Documentation]  Opens salary disbursement page
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/${disbursementIndex}
    ${testCount}  convert to integer  ${count}
    sleep  2s
    return from keyword  ${testCount}

#Complete follwoing keyword, it will take unit as an argument and perform tests on it.
Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${unitID}  ${testCount}
    run keyword if  ${unitID} != None  TopNavigation.Select Unit In Preference Modal By ID  ${unitID}  ${testCount}
    Go To Disbursement Index Page
    Apply Given Cycle Filter
    sleep  2s
    Check Paybill

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${testCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    log to console  ${allUnits} number of total units
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   log to console  ${unit} unit
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${testCount}
    \   Go To Disbursement Index Page
    \   Apply Given Cycle Filter
    \   sleep  2s
    \   Check Paybill
    \   TopNavigation.Open Preference Unit Page


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
    ${allPaybills}  Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    ${paybillNumber}  Get Paybill Number  //tr[${paybill}]//td[2]//span[2]
    \    @{list1}  Get Data Of Report Page  ${paybill}
    \    @{list2}  Get Data Of Disbursement Details Page  ${paybill}
    \    Compare And Add To Report  ${list1}  ${list2}  ${paybillNumber}
    \    Go To Disbursement Index Page
   # log to console  ${finalList} Final List

Get Paybill Count
    [Documentation]  Returns the number of rows in the given paybill
    ${rowsCount}  get element count  ${paybillTableRow}
    log to console  ${rowsCount} rows in paybill table
    return from keyword  ${rowsCount}


Get Paybill Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillSpan}
    ${paybillText}  get text  ${paybillSpan}
    ${paybillTextDict}  split string  ${paybillText}
    return from keyword  ${paybillTextDict}[2]


Get Data Of Report Page
    [Documentation]  Returns the list of salaries of employees listed in report page
    [Arguments]  ${paybillTableRow}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[7]/div/div/a[2]/i
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[7]/div/div/ul/li[1]/a[1]
    Switch Tab
    @{list}  create list
    ${numberOfRows}  get element count  ${reportPageTable}/tbody/tr
    ${columnNumber}  get element count  ${reportPageTable}/thead/tr/th
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  ${reportPageTable}  ${row+1}  ${columnNumber}
    \    ${decimalSalary}  Change The Number Into A Formatted Amount  ${salary}
    \    append to list   ${list}   ${decimalSalary}
    close window
    return from keyword  @{list}

Change The Number Into A Formatted Amount
    [Documentation]  Changes the given salary into a floating point number
    [Arguments]  ${salary}
    ${formattedSalary}=  replace string  ${salary}  ,  ${EMPTY}
    ${decimalSalary}=  Evaluate  "%.2f" % ${formattedSalary}
    return from keyword  ${decimalSalary}

Get Data Of Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${paybill}
    Switch Tab
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[7]/div/div/a[1]/i
    ${numberOfRows}  get element count  ${disbursementTable}/tbody/tr
    ${columnNumber}  Get Amount Column Number  ${disbursementTable}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  ${disbursementTable}  ${row+1}  ${columnNumber}
    \    ${decimalSalary}  Change The Number Into A Formatted Amount  ${salary}
    \    append to list  ${list}  ${decimalSalary}
    return from keyword  @{list}

Compare And Add To Report
    [Documentation]  Compares both report page list and disbursement page list and add the result of camparision into a report
    [Arguments]  ${list1}  ${list2}  ${paybillNumber}
    log to console  ${list1} data of disbursement page
    log to console  ${list2} data of report page
    ${numberOfItems}  get length  ${list1}
    FOR  ${index}  IN RANGE  ${numberOfItems}
    \   run keyword if  '@{list1}[${index}]' != '@{list2}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}


Get Amount Column Number
    [Documentation]  Gives the column number of the 'Net Amount' column
    [Arguments]  ${tableUrl}
    ${text2}  set variable  Net Amount
    ${NumberOfColumns}  get element count  ${tableUrl}/thead/tr/th
    FOR  ${columnNumber}  IN RANGE  2  ${NumberOfColumns+1}
    \   ${text}   Get Table Cell  ${tableUrl}  1  ${columnNumber}
    \   ${status}  run keyword and return status  should be equal as strings  ${text}  ${text2}
    \   run keyword if  ${status} == ${true}  return from keyword  ${columnNumber}


Add To The Disbusement Test Report
    [Documentation]  Add unmatched salaries to the Test Report
    [Arguments]  ${paybillNumber}  ${index}
    ${employeeID}  Get Employee ID  ${disbursementTable}  ${index}  3
    run keyword and continue on failure  fail  Salary of Employee ID. ${employeeID} in ${paybillNumber} didn't match
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