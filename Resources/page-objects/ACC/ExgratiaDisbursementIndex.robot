*** Keywords ***

Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/exgratiadisbursement/ExGratiaDisbursementIndex
    set test variable  ${disburseTableColumnText}  ExGratia Amount
    set test variable  ${disbursementTableID}  xpath=//*[@id="EmpSalGrid"]
    set test variable  ${financialYearDD}  FinancialYear

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${UNITID}  ${retryCount}
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Apply Given Financial Year  ${financialYearDD}
    DisbursementIndex.Apply Filters
    sleep  2s
    DisbursementIndex.Check Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${financialYearDD}  ${disbursementTableID}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Apply Given Financial Year  ${financialYearDD}
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   DisbursementIndex.Check Paybill  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}   ${financialYearDD}
    \   TopNavigation.Open Preference Unit Page

