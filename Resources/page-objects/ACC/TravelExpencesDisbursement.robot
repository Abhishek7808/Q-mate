*** Keywords ***

Go To Travel Disbursement Index Page And Set Variables
    TravelExpencesDisbursement.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/TravelExpencesDisbursement
    set test variable  ${disburseTableColumnText}  Bill Amount
    set test variable  ${disbursementTable}  //*[@id="classlisting"]/div/table
    set test variable  ${employeeIdColumn}  2

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${unitID}  ${retryCount}
    run keyword if  ${unitID} != None  TopNavigation.Select Unit In Preference Modal By ID  ${unitID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    # DisbursementIndex.Apply Given Cycle Filter
    sleep  2s
    Check Travel Expence Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTable}  ${employeeIdColumn}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}  ${employeeIdColumn}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    log to console  ${allUnits} number of total units
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   log to console  ${unit} unit
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
#    \   DisbursementIndex.Apply Given Cycle Filter
    \   sleep  2s
    \   Check Travel Expence Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTable}  ${employeeIdColumn}
    \   TopNavigation.Open Preference Unit Page

Check Travel Expence Paybill
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTable}  ${employeeIdColumn}=3
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}
    \    @{list1}  DisbursementIndex.Get Data Of Report Page  ${paybill}
    \    @{list2}  DisbursementIndex.Get Data Of Disbursement Details Page  ${paybill}  ${columnToBeFetched}  ${disbursementTable}
    \    DisbursementIndex.Compare And Add To Report  ${list1}  ${list2}  ${paybillNumber}  ${disbursementTable}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}
#    \    Open Filters
#    \    Apply Given Financial Year  ${finDropdownID}
#    \    Apply Filters
    \    sleep  2s