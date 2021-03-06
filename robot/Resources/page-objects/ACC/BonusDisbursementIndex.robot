*** Keywords ***

Go To Bonus Disbursement Index Page And Set Variables
    [Documentation]  Sets test environment and opens disbursement page according to the test.
    BonusDisbursementIndex.Set Variables
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}

Set Variables
    [Documentation]  Sets variables according to the test.
    ###""" Each disbursement have its own variables to set up before the testing"""
    set test variable  ${disbursementUrl}  HRM/HonorariumDisbursement/BonusDisbursementIndex
    set test variable  ${disburseTableColumnHead}  Net Amount       ###""" It is set for fetching disbursement amount"""
    set test variable  ${disbursementTableID}  //*[@id="EmpSalGrid"]


Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Select Given Financial Year
    DisbursementIndex.Select Given Cycle Filter
    DisbursementIndex.Apply Filters
    sleep  2s
    run keyword if  ${PAYBILLNO} == None  DisbursementIndex.Check Paybills  ${disbursementUrl}  ${disburseTableColumnHead}  ${disbursementTableID}
    run keyword if  ${PAYBILLNO} != None  DisbursementIndex.Check Specified Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnHead}  ${disbursementTableID}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Select Given Financial Year
    \   DisbursementIndex.Select Given Cycle Filter
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   DisbursementIndex.Check Paybills  ${disbursementUrl}  ${disburseTableColumnHead}  ${disbursementTableID}
    \   TopNavigation.Open Preference Unit Page

