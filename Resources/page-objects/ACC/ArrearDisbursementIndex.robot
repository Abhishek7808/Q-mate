*** Keywords ***

Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/ArrearDisbursement/ArrearDisbursementIndex
    set test variable  ${disburseTableColumnText}  Amount to be Disbursed
    set test variable  ${disbursementTable}  xpath=//*[@id="EmpSalGrid"]

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${unitID}  ${retryCount}
    run keyword if  ${unitID} != None  TopNavigation.Select Unit In Preference Modal By ID  ${unitID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Apply Given Financial Year
#    DisbursementIndex.Apply Given Cycle Filter
    DisbursementIndex.Apply Filters
    sleep  2s
    ArrearDisbursementIndex.Check Arrear Disbursement Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTable}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    log to console  ${allUnits} number of total units
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   log to console  ${unit} unit
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Apply Given Financial Year
#    \   DisbursementIndex.Apply Given Cycle Filter
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   ArrearDisbursementIndex.Check Arrear Disbursement Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTable}
    \   TopNavigation.Open Preference Unit Page

Check Arrear Disbursement Paybill
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTable}  ${finDropdownID}=Finyear  ${employeeIdColumn}=3
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}
    \    @{list1}  DisbursementIndex.Get Data Of Report Page  ${paybill}
    \    @{list2}  ArrearDisbursementIndex.Get Data Of Arrear Disbursement Details Page  ${paybill}  ${columnToBeFetched}  ${disbursementTable}
    \    DisbursementIndex.Compare And Add To Report  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}
    \    DisbursementIndex.Open Filters
    \    DisbursementIndex.Apply Given Financial Year  ${finDropdownID}
    \    DisbursementIndex.Apply Filters
    \    sleep  5s


Get Data Of Arrear Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${paybill}  ${columnToBeFetched}  ${disbursementTable}
    Switch Tab
    ${columnNumber}  Get Amount Column Number  ${paybillTable}  Actions
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybill}]/td[${columnNumber}]/div/div/a[1]/i
    ${numberOfRows}  get element count  ${disbursementTable}/tbody/tr
    ${columnNumber}  DisbursementIndex.Get Amount Column Number  ${disbursementTable}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${elementValue}  get element attribute  //*[@id="EmpSalGrid"]/tbody/tr[1]/td[${columnNumber}]/input  value
    \    log to console  ${elementValue} value red from table
    \    ${formattedAmount}  DisbursementIndex.Change The Number Into A Formatted Amount  ${elementValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}
