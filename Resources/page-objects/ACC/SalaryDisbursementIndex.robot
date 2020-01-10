*** Keywords ***

Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/salaryDisbursment/SalayDisbursmentIndex
    set test variable  ${disburseTableColumnText}  Net Amount
    set test variable  ${disbursementTableID}  //*[@id="EmpSalGrid"]
    set test variable  ${paybillDetailsColumnHead}  PayBill Detail

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${UNITID}  ${retryCount}
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Apply Given Financial Year
    DisbursementIndex.Apply Given Cycle Filter
    DisbursementIndex.Apply Filters
    sleep  5s
    run keyword if  ${PAYBILLNO} == None  SalaryDisbursementIndex.Check Salary Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${paybillDetailsColumnHead}
    run keyword if  ${PAYBILLNO} != None  SalaryDisbursementIndex.Check Specified Salary Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Apply Given Financial Year
    \   DisbursementIndex.Apply Given Cycle Filter
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   SalaryDisbursementIndex.Check Salary Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${paybillDetailsColumnHead}
    \   TopNavigation.Open Preference Unit Page

Check Salary Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${paybillDetailsColumnHead}=Disbursement Detail  ${employeeIdColumn}=3
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    ${PaybillTableColumnNumber}  DisbursementIndex.Get Amount Column Number  ${paybillTableID}  Actions
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  SalaryDisbursementIndex.Get Salary Paybill Number  ${paybill}  ${paybillDetailsColumnHead}
    \    DisbursementIndex.Go To Report Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    DisbursementIndex.Switch Tab
    \    DisbursementIndex.Go To Disbursement Page  ${paybill}  ${PaybillTableColumnNumber}
    \    switch window  NEW
    \    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    close window
    \    DisbursementIndex.Switch Tab
    \    Open Filters
    \    Apply Given Financial Year  ${financialYearDD}
    \    Apply Filters
    \    sleep  2s

Check Specified Salary Paybill
    [Arguments]  ${PAYBILLNO}  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}=3
    ${PaybillTableColumnNumber}  Get Amount Column Number  ${paybillTableID}  Actions
    DisbursementIndex.Show Maximum Entries
    sleep  2s
    DisbursementIndex.Go To Report Page Of Specified Paybill  ${PAYBILLNO}
    @{ReportData}  Get Data Of Report Page
    DisbursementIndex.Switch Tab
    sleep  5s
    SalaryDisbursementIndex.Go To Disbursement Page Specified By Paybill  ${PAYBILLNO}
    switch window  NEW
    @{disbursementData}  Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    sleep  2s
    Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Go To Disbursement Page Specified By Paybill
    [Arguments]  ${PAYBILLNO}
     click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//i[@class='fa fa-pencil']

Get Salary Paybill Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}   ${paybillDetailsColumnHead}
    ${columnNumber}  Get Amount Column Number  ${paybillTableID}  ${paybillDetailsColumnHead}
    ${payBillDetails}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${paybillTableID}  ${paybillTableRow+1}  ${columnNumber}
    ${paybillDetailSet1}  Split String From Right  ${payBillDetails}   Paybill No. :
    ${paybillNumber}  get substring  ${paybillDetailSet1}[1]  0  14
    return from keyword  ${paybillNumber}