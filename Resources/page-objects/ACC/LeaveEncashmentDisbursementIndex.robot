*** Keywords ***

Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/LeaveEncashmentDisbursement/LeaveEncashDisbursmentIndex
    set test variable  ${disburseTableColumnText}  Leave Encashment Amount
    set test variable  ${disbursementTableID}  //*[@id="classlisting"]/div/table
    set test variable  ${employeeIdColumn}  2

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${UNITID}  ${retryCount}
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    sleep  5s
    log to console  ${PAYBILLNO} paybill number
    ${PAYBILLNO}  convert to string  ${PAYBILLNO}
    run keyword if  ${PAYBILLNO} == None  LeaveEncashmentDisbursementIndex.Check Leave Encashment Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${employeeIdColumn}
    run keyword if  ${PAYBILLNO} != None  LeaveEncashmentDisbursementIndex.Check Specified Leave Encashment Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   sleep  2s
    \   LeaveEncashmentDisbursementIndex.Check Leave Encashment Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${employeeIdColumn}
    \   TopNavigation.Open Preference Unit Page

Check Leave Encashment Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}
    ${PaybillTableColumnNumber}  DisbursementIndex.Get Amount Column Number  ${paybillTableID}  Actions
    DisbursementIndex.Show Maximum Entries
    sleep  2s
    ${allPaybills}  Get Paybill Count
    # TODO: change the Check Paybills range before testing on live ,it should start from 1, remove comments from show max entries
    FOR  ${paybill}  IN RANGE  2  ${allPaybills+1}
    \    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  LeaveEncashmentDisbursementIndex.Get Voucher Number  ${paybill}
    \    DisbursementIndex.Go To Report Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    DisbursementIndex.Switch Tab
    \    DisbursementIndex.Go To Disbursement Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{disbursementData}  LeaveEncashmentDisbursementIndex.Get Data Of Leave Encashment Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}

Check Specified Leave Encashment Paybill
    [Arguments]  ${PAYBILLNO}  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}=3
    ${PaybillTableColumnNumber}  Get Amount Column Number  ${paybillTableID}  Actions
    DisbursementIndex.Show Maximum Entries
    sleep  2s
    DisbursementIndex.Go To Report Page Of Specified Paybill  ${PAYBILLNO}
    sleep  1s
    @{ReportData}  Get Data Of Report Page
    Switch Tab
    LeaveEncashmentDisbursementIndex.Go To Disbursement Page Specified By Paybill  ${PAYBILLNO}
    page should contain  Leave Encashment Disbursement Process
    @{disbursementData}  Get Data Of Leave Encashment Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    sleep  2s
    Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Go To Disbursement Page Specified By Paybill
    [Arguments]  ${PAYBILLNO}
    click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//i[@class='fa fa-eye']

Get Data Of Leave Encashment Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTableID}
    ${numberOfRows}  get element count  ${disbursementTableID}/tbody/tr
    ${columnNumber}  DisbursementIndex.Get Amount Column Number  ${disbursementTableID}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows+1}
    \    sleep  2s
    \    ${textValue}  get table cell  ${disbursementTableID}  ${row+1}  ${columnNumber}
    \    ${formattedAmount}  DisbursementIndex.Change The Number Into A Formatted Amount  ${textValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}

Get Voucher Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Amount Column Number  ${paybillTableID}  Voucher Detail
    ${payBillDetails}  get table cell  ${paybillTableID}  ${paybillTableRow+1}  ${columnNumber}
    ${paybillDetailSet1}  Split String From Right   ${payBillDetails}  ;
    return from keyword  ${paybillDetailSet1}[0]