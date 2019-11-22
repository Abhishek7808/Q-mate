*** Keywords ***

Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/LeaveEncashmentDisbursement/LeaveEncashDisbursmentIndex
    set test variable  ${disburseTableColumnText}  Leave Encashment Amount
    set test variable  ${disbursementTable}  //*[@id="classlisting"]/div/table
    set test variable  ${employeeIdColumn}  2

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${UNITID}  ${retryCount}
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    #DisbursementIndex.Open Filters
    #DisbursementIndex.Apply Given Financial Year
    #DisbursementIndex.Apply Given Cycle Filter
    #DisbursementIndex.Apply Filters
    sleep  5s
    LeaveEncashmentDisbursementIndex.Check Leave Encashment Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTable}  ${employeeIdColumn}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
#    \   DisbursementIndex.Open Filters
#    \   DisbursementIndex.Apply Given Financial Year
#    \   DisbursementIndex.Apply Given Cycle Filter
#    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   LeaveEncashmentDisbursementIndex.Check Leave Encashment Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTable}  ${employeeIdColumn}
    \   TopNavigation.Open Preference Unit Page

Check Leave Encashment Paybill
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTable}  ${employeeIdColumn}
    ${PaybillActionsColumnNumber}  DisbursementIndex.Get Amount Column Number  ${paybillTable}  Actions
    #DisbursementIndex.Show Maximum Entries
    #sleep  2s
    ${allPaybills}  Get Paybill Count
    # TODO: change the Check paybill range before testing on live ,it should start from 1 remove comments from show max entries
    FOR  ${paybill}  IN RANGE  2  ${allPaybills+1}
    #\    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  LeaveEncashmentDisbursementIndex.Get Voucher Number  ${paybill}
    \    DisbursementIndex.Go To Report Page  ${paybill}  ${PaybillActionsColumnNumber}
    \    @{list1}  DisbursementIndex.Get Data Of Report Page
    \    DisbursementIndex.Switch Tab
    \    DisbursementIndex.Go To Disbursement Page  ${paybill}  ${PaybillActionsColumnNumber}
    \    @{list2}  LeaveEncashmentDisbursementIndex.Get Data Of Leave Encashment Disbursement Details Page  ${columnToBeFetched}  ${disbursementTable}
    \    DisbursementIndex.Compare And Add To Report  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}
#    \    Open Filters
#    \    Apply Given Financial Year  ${finDropdownID}
#    \    Apply Filters
#    \    sleep  5s

Get Data Of Leave Encashment Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTable}
    ${numberOfRows}  get element count  ${disbursementTable}/tbody/tr
    ${columnNumber}  DisbursementIndex.Get Amount Column Number  ${disbursementTable}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows+1}
    \    sleep  2s
    \    ${textValue}  get table cell  ${disbursementTable}  ${row+1}  ${columnNumber}
    \    ${formattedAmount}  DisbursementIndex.Change The Number Into A Formatted Amount  ${textValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}

Get Voucher Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Amount Column Number  ${paybillTable}  Voucher Detail
    ${payBillDetails}  get table cell  ${paybillTable}  ${paybillTableRow+1}  ${columnNumber}
    ${paybillTextDict1}  Split String From Right   ${payBillDetails}  ;
    return from keyword  ${paybillTextDict1}[0]