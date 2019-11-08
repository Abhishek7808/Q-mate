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
    [Arguments]  ${unit}


Match All Paybills Net Amounts With Reports For All Units
    TopNavigation.Open User Action Menu
    TopNavigation.Open Change Preference Modal
    TopNavigation.Open Unit Dropdown In Preference Modal
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   Apply Pereference
    \   sleep  4s
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
    \   Apply Last Cycle Filter
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
    [Arguments]  ${finalList}
    ${allPaybills}  Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    ${paybillNumber}  Get Paybill Number  //tr[${paybill}]//td[2]//span[2]
    \    @{list1}  Get Data Of Disbursement Details Page  ${paybill}
    \    @{list2}  Get Data Of Report Page  ${paybill}
    \    Compare And Add To List  ${list1}  ${list2}  ${paybillNumber}  ${finalList}
#   \    append to list  ${finalList}  ${errorSalary}
    \    Go To ERP Page  ${salaryUrl}
    log to console  ${finalList}

Get Paybill Count
    ${rowsCount}  get element count  ${paybillTableRow}
    log to console  ${rowsCount}
    return from keyword  ${rowsCount}


Get Paybill Number
    [Arguments]  ${paybillSpan}
    ${paybillText}  get text  ${paybillSpan}
    log to console  ${paybillText}
    ${paybillTextDict}  split string  ${paybillText}
    log to console  ${paybillTextDict}[0]
    return from keyword  ${paybillTextDict}[0]


Get Data Of Report Page
    [Arguments]  ${paybillTableRow}
    Go To Disbursement Index Page
    sleep  2s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[7]/div/div/a[2]/i
    sleep  3s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[7]/div/div/ul/li[1]/a[1]
    @{windowTitles}    get window handles
    ${windowToOpen}=    get from list    ${windowTitles}  -1
    Select Window    ${windowToOpen}
    @{list}  create list
    ${numberOfRows}  get element count  //*[@id="HBA"]/tbody/tr
    ${columnNumber}  get element count  //*[@id="HBA"]/thead/tr/th
#    log to console  ${numberOfRows}
#    log to console  ${columnNumber}
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  xpath=//table[@id='HBA']  ${row+1}  ${columnNumber}
    \    log to console  ${salary}
#    \    ${employeeName}  Get Table Cell  xpath=//table[@id='HBA']  ${row}  2
#  TODO: Remove this .00 suffix and make a dynamic check for this
    \    append to list   ${list}   ${salary}.00
    return from keyword  @{list}


Get Data Of Disbursement Details Page
    [Arguments]  ${paybill}
    sleep  2s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[7]/div/div/a[1]/i
    ${numberOfRows}  get element count  xpath=//*[@id="EmpSalGrid"]/tbody/tr
    ${columnNumber}  Get Amount Column Number  xpath=//*[@id="EmpSalGrid"]
    log to console   ${columnNumber}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  xpath=//*[@id="EmpSalGrid"]  ${row+1}  ${columnNumber}
#    \    ${Name}  Get Table Cell  xpath=//*[@id="EmpSalGrid"]  ${row}  3
    \    append to list  ${list}  ${salary}
    return from keyword  @{list}

Compare And Add To List
    [Arguments]  ${list1}  ${list2}  ${paybillNumber}  ${finalList}
    log to console  ${list1}
    log to console  ${list2}
    ${numberOfItems}  get length  ${list1}
    FOR  ${index}  IN RANGE  ${numberOfItems}
#    \     log to console  @{list1}[${item}]
#    \     log to console  @{list2}[${item}]
     \     run keyword if  '@{list1}[${index}]' != '@{list2}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}  ${finalList}


Get Amount Column Number
    [Arguments]  ${tableUrl}
    ${text2}  set variable  Net Amount
    ${NumberOfColumns}  get element count  ${tableUrl}/thead/tr/th
    FOR  ${columnNumber}  IN RANGE  2  ${NumberOfColumns+1}
    \   log to console  ${item}
    \   ${text}   Get Table Cell  ${tableUrl}  1  ${columnNumber}
    \   log to console  ${text}
    \   log to console  ${text2}
    \   ${status}  run keyword and return status  should be equal as strings  ${text}  ${text2}
    \   run keyword if  ${status} == ${true}  return from keyword  ${columnNumber}
    #return from keyword  ${colums}


Add To The Disbusement Test Report
    [Arguments]  ${paybillNumber}  ${index}  ${finalReport}
    ${employeeID}  get table cell  xpath=//table[@id='HBA']  ${index+2}  2
    run keyword and continue on failure  fail  Salary of Employee ID. ${employeeID} in ${paybillNumber} didn't match
    append to list   ${finalReport}  ${paybillNumber}: Employee ID. ${employeeID}

#Set This Variable
#    [Arguments]  ${number}  ${item}
#    ${number}  set variable  ${item}
#    log to console  ${number}
#
#    return from keyword  ${number}