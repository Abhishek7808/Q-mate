*** Keywords ***

Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/salaryDisbursment/SalayDisbursmentIndex
    set test variable  ${disburseTableColumnText}  Net Amount
    set test variable  ${disbursementTableID}  xpath=//*[@id="EmpSalGrid"]

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
    run keyword if  ${PAYBILLNO} == None  DisbursementIndex.Check Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}
    run keyword if  ${PAYBILLNO} != None  DisbursementIndex.Check Specified Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}

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
    \   DisbursementIndex.Check Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}
    \   TopNavigation.Open Preference Unit Page

