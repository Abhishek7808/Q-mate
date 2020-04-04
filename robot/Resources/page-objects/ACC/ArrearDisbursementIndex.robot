*** Keywords ***

Go To Arrear Disbursement Index Page And Set Variables
    [Documentation]  Opens arrear disbursement index page and sets variables for arrear disbursement scripts.
    ArrearDisbursementIndex.Set Variables
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}

Set Variables
    [Documentation]  Sets variables according to the test.
    # """ Each disbursement have its own variables to set up before the testing"""
    set test variable  ${disbursementUrl}  HRM/ArrearDisbursement/ArrearDisbursementIndex
    set test variable  ${disburseTableColumnHead}  Amount to be Disbursed
    set test variable  ${disbursementTableID}  //*[@id="EmpSalGrid"]
    set test variable  ${paybillDetailsColumnHead}  Disbursement Detail
    set test variable  ${employeeIdColumn}          3

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Select Given Financial Year
    DisbursementIndex.Apply Filters
    sleep  2s
    run keyword if  ${PAYBILLNO} == None  ArrearDisbursementIndex.Check Arrear Disbursement Paybills
    run keyword if  ${PAYBILLNO} != None  ArrearDisbursementIndex.Check Specified Arrear Disbursement Paybill

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   DisbursementIndex.Open Filters
    \   DisbursementIndex.Select Given Financial Year
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   ArrearDisbursementIndex.Check Arrear Disbursement Paybills
    \   TopNavigation.Open Preference Unit Page

Check Arrear Disbursement Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    Wait Until Keyword Succeeds    15    200ms    Common_Keywords.Show Maximum Entries on Page
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    #${PaybillTableColumnNumber}  DisbursementIndex.Get Amount Column Number  ${paybillTableID}  Actions
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    Common_Keywords.Show Maximum Entries on Page
    \    sleep  2s
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}  ${paybillDetailsColumnHead}
    \    DisbursementIndex.Go To Report Page  ${paybillNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    Common_Keywords.Switch Tab
    \    DisbursementIndex.Go To Disbursement Details Page  ${paybillNumber}
    \    @{disbursementData}  ArrearDisbursementIndex.Get Data Of Arrear Disbursement Details Page  ${disburseTableColumnHead}  ${disbursementTableID}   ### In Arrear disbusement table Data is filled in a different format.
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \    DisbursementIndex.Open Filters
    \    DisbursementIndex.Select Given Financial Year
    \    DisbursementIndex.Apply Filters
    \    sleep  5s

Check Specified Arrear Disbursement Paybill
    [Documentation]  Checks paybill of given number.
    Common_Keywords.Show Maximum Entries on Page
    sleep  2s
    DisbursementIndex.Go To Report Page   ${PAYBILLNO}
    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    Common_Keywords.Switch Tab
    DisbursementIndex.Go To Disbursement Details Page   ${PAYBILLNO}
    sleep  2s
    @{disbursementData}  ArrearDisbursementIndex.Get Data Of Arrear Disbursement Details Page  ${disburseTableColumnHead}  ${disbursementTableID}
    sleep  2s
    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Get Data Of Arrear Disbursement Details Page
    [Documentation]  Returns the list of arrears of employees, listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTableID}
    wait until page contains element  ${disbursementTableID}
    ${numberOfRows}  get element count  ${disbursementTableID}/tbody/tr
    ${columnNumber}  Get Table Column Number  ${disbursementTableID}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    ${elementValue}  get element attribute  //*[@id="EmpSalGrid"]/tbody/tr[${row}]/td[${columnNumber+1}]/input  value
    \    ${formattedAmount}  Common_Keywords.Change The Number Into A Formatted Amount  ${elementValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}
