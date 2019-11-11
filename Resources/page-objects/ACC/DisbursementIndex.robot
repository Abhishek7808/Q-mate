*** Variables ***
${disbursementIndex}  /HRM/salaryDisbursment/SalayDisbursmentIndex
${cycle}  SalaryCycleId
${paybillTableRow}     //*[@id="classListing"]/div[1]/table/tbody/tr
@{finalList}


*** Keywords ***
Go To Disbursement Index Page
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/${disbursementIndex}
    sleep  2s

#Complete follwoing keyword, it will take unit as an argument and perform tests on it.
Match All Paybills Net Amount With The Report For Given Unit
    [Arguments]  ${unitName}
    TopNavigation.Open User Action Menu
    TopNavigation.Open Change Preference Modal
    TopNavigation.Open Unit Dropdown In Preference Modal
    TopNavigation.Select Unit In Preference Modal By Name  ${unitName}
    Apply Pereference
    sleep  3s
    Apply Last Cycle Filter
    sleep  2s
    Check Paybill

Match All Paybills Net Amounts With Reports For All Units
    TopNavigation.Open Change Preference Modal
    TopNavigation.Open Unit Dropdown In Preference Modal
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  4  ${allUnits}
    \   log to console  ${unit} unit
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   Apply Pereference
    \   sleep  2s
    \   Apply Last Cycle Filter
    \   sleep  2s
    \   Check Paybill
    \   TopNavigation.Open User Action Menu
    \   TopNavigation.Open Change Preference Modal
    \   TopNavigation.Open Unit Dropdown In Preference Modal


Match All Paybills Net Amounts with Reports
    TopNavigation.Open User Action Menu
    TopNavigation.Open Change Preference Modal
    TopNavigation.Open Unit Dropdown In Preference Modal
    ${allUnits}  TopNavigation.Return Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   Apply Pereference
    \   sleep  4s
#    \   Apply Last Cycle Filter
    \   sleep  2s
    \   Check Paybill
    \   TopNavigation.Open User Action Menu
    \   TopNavigation.Open Change Preference Modal
    \   TopNavigation.Open Unit Dropdown In Preference Modal

Apply Last Cycle Filter
    NavigationHelper.Select Filter Menu
    select last dropdown element  ${cycle}
    NavigationHelper.Apply Filter

Check Paybill
    ${allPaybills}  Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    ${paybillNumber}  Get Paybill Number  //tr[${paybill}]//td[2]//span[2]
    \    @{list1}  Get Data Of Report Page  ${paybill}
    \    @{list2}  Get Data Of Disbursement Details Page  ${paybill}
    \    Compare And Add To List  ${list1}  ${list2}  ${paybillNumber}
    \    Go To Disbursement Index Page
    log to console  ${finalList} Final List

Get Paybill Count
    ${rowsCount}  get element count  ${paybillTableRow}
    log to console  ${rowsCount} rows in paybill table
    return from keyword  ${rowsCount}


Get Paybill Number
    [Arguments]  ${paybillSpan}
    ${paybillText}  get text  ${paybillSpan}
    ${paybillTextDict}  split string  ${paybillText}
    return from keyword  ${paybillTextDict}[2]


Get Data Of Report Page
    [Arguments]  ${paybillTableRow}
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[7]/div/div/a[2]/i
    sleep  3s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[7]/div/div/ul/li[1]/a[1]
    Switch Tab
    @{list}  create list
    ${numberOfRows}  get element count  //*[@id="HBA"]/tbody/tr
    ${columnNumber}  get element count  //*[@id="HBA"]/thead/tr/th
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  xpath=//table[@id='HBA']  ${row+1}  ${columnNumber}
    \    ${decimalSalary}  Change The Number Into A Formatted Amount  ${salary}
    \    append to list   ${list}   ${decimalSalary}
    close window
    return from keyword  @{list}

Change The Number Into A Formatted Amount
    [Arguments]  ${salary}
    ${formattedSalary}=  replace string  ${salary}  ,  ${EMPTY}
    ${decimalSalary}=  Evaluate  "%.2f" % ${formattedSalary}
    return from keyword  ${decimalSalary}

Get Data Of Disbursement Details Page
    [Arguments]  ${paybill}
    Switch Tab
    sleep  2s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[7]/div/div/a[1]/i
    ${numberOfRows}  get element count  xpath=//*[@id="EmpSalGrid"]/tbody/tr
    ${columnNumber}  Get Amount Column Number  xpath=//*[@id="EmpSalGrid"]
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  xpath=//*[@id="EmpSalGrid"]  ${row+1}  ${columnNumber}
    \    ${decimalSalary}  Change The Number Into A Formatted Amount  ${salary}
    \    append to list  ${list}  ${decimalSalary}
    return from keyword  @{list}

Compare And Add To List
    [Arguments]  ${list1}  ${list2}  ${paybillNumber}
    log to console  ${list1} data of disbursement page
    log to console  ${list2} data of report page
    ${numberOfItems}  get length  ${list1}
    FOR  ${index}  IN RANGE  ${numberOfItems}
     \     run keyword if  '@{list1}[${index}]' != '@{list2}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}


Get Amount Column Number
    [Arguments]  ${tableUrl}
    ${text2}  set variable  Net Amount
    ${NumberOfColumns}  get element count  ${tableUrl}/thead/tr/th
    FOR  ${columnNumber}  IN RANGE  2  ${NumberOfColumns+1}
    \   ${text}   Get Table Cell  ${tableUrl}  1  ${columnNumber}
    \   ${status}  run keyword and return status  should be equal as strings  ${text}  ${text2}
    \   run keyword if  ${status} == ${true}  return from keyword  ${columnNumber}

Add To The Disbusement Test Report
    [Arguments]  ${paybillNumber}  ${index}
    ${employeeID}  Get Employee ID  xpath=//table[@id='EmpSalGrid']  ${index}
    run keyword and continue on failure  fail  Salary of Employee ID. ${employeeID} in ${paybillNumber} didn't match
    append to list   ${finalList}  Paybill No. ${paybillNumber}: Employee ID. ${employeeID}

Get Employee ID
    [Arguments]  ${tableID}  ${index}
    ${employeeData}   get table cell  ${tableID}  ${index+2}  3
    ${employeeDataDict}  split string  ${employeeData}  -
    ${employeeID}  get from list  ${employeeDataDict}  0
    return from keyword  ${employeeID}

Switch Tab
    @{windowTitles}    get window handles
    ${windowToOpen}=    get from list    ${windowTitles}  -1
    Select Window    ${windowToOpen}

Close Last Tab
    ${title_var}        Get Window Titles
    Select Window       title=@{title_var}[0]
    close window


#Set This Variable
#    [Arguments]  ${number}  ${item}
#    ${number}  set variable  ${item}
#    log to console  ${number}
#
#    return from keyword  ${number}