*** Variables ***
${disbursementUrl}  HRM/exgratiadisbursement/ExGratiaDisbursementIndex
${columnText}  ExGratia Amount
${disbursementTable}  xpath=//*[@id="EmpSalGrid"]
#${employeeIdColumn}  3
*** Keywords ***
Set Variables
    set test variable  ${disbursementUrl}  HRM/exgratiadisbursement/ExGratiaDisbursementIndex
    set test variable  ${columnText}  ExGratia Amount
    set test variable  ${disbursementTable}  xpath=//*[@id="EmpSalGrid"]
    set test variable  ${finDropdownID}  FinancialYear

Go To Exgratia Disbursement Index Page
    ${testCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${testCount}

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${unitID}  ${testCount}
    run keyword if  ${unitID} != None  TopNavigation.Select Unit In Preference Modal By ID  ${unitID}  ${testCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Apply Given Financial Year  ${finDropdownID}
    DisbursementIndex.Apply Filters
    sleep  2s
    DisbursementIndex.Check Paybill  ${disbursementUrl}  ${columnText}  ${disbursementTable}  ${finDropdownID}  ${disbursementTable}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${testCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    log to console  ${allUnits} number of total units
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   log to console  ${unit} unit
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${testCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Apply Given Financial Year
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   DisbursementIndex.Check Paybill  ${disbursementUrl}  ${columnText}  ${disbursementTable}
    \   TopNavigation.Open Preference Unit Page

