*** Keywords ***

Go To Exgratia Disbursement Index Page And Set Variables
    [Documentation]  Sets test environment and opens disbursement page according to the test.
    ExgratiaDisbursementIndex.Set Variables
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}

Set Variables
    [Documentation]  Sets variables according to the test.
    # """ Each disbursement have its own variables to set up before the testing"""
    set test variable  ${disbursementUrl}  HRM/exgratiadisbursement/ExGratiaDisbursementIndex            # """ Sets Disbursement URL """
    set test variable  ${disburseTableColumnText}  ExGratia Amount           # """ It is set for fetching disbursement amount"""
    set test variable  ${disbursementTableID}  //*[@id="EmpSalGrid"]
    set test variable  ${financialYearDD}  FinancialYear                     # """ To set Financial year
    set test variable  ${paybillDetailsColumnHead}  Disbursement Detail      # """ It is set for fetching paybill Number """

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Select Given Financial Year  ${financialYearDD}
    DisbursementIndex.Apply Filters
    sleep  2s
    run keyword if  ${PAYBILLNO} == None  DisbursementIndex.Check Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${paybillDetailsColumnHead}  ${financialYearDD}
    run keyword if  ${PAYBILLNO} != None  DisbursementIndex.Check Specified Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Select Given Financial Year  ${financialYearDD}
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   DisbursementIndex.Check Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${paybillDetailsColumnHead}  ${financialYearDD}
    \   TopNavigation.Open Preference Unit Page

