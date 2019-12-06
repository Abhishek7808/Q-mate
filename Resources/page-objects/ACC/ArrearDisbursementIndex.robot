*** Keywords ***

Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/ArrearDisbursement/ArrearDisbursementIndex
    set test variable  ${disburseTableColumnText}  Amount to be Disbursed
    set test variable  ${disbursementTableID}  xpath=//*[@id="EmpSalGrid"]

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${UNITID}  ${retryCount}
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Apply Given Financial Year
#    DisbursementIndex.Apply Given Cycle Filter
    DisbursementIndex.Apply Filters
    sleep  2s
    run keyword if  ${PAYBILLNO} == None  ArrearDisbursementIndex.Check Arrear Disbursement Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}
    run keyword if  ${PAYBILLNO} != None  ArrearDisbursementIndex.Check Specified Arrear Disbursement Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}

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
#    \   DisbursementIndex.Apply Given Cycle Filter
    \   DisbursementIndex.Apply Filters
    \   sleep  2s
    \   ArrearDisbursementIndex.Check Arrear Disbursement Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}
    \   TopNavigation.Open Preference Unit Page

Check Arrear Disbursement Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${financialYearDD}=Finyear  ${employeeIdColumn}=3
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    ${PaybillTableColumnNumber}  DisbursementIndex.Get Amount Column Number  ${paybillTableID}  Actions
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}
    \    DisbursementIndex.Go To Report Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    DisbursementIndex.Switch Tab
    \    DisbursementIndex.Go To Disbursement Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{disbursementData}  ArrearDisbursementIndex.Get Data Of Arrear Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}
    \    DisbursementIndex.Open Filters
    \    DisbursementIndex.Apply Given Financial Year  ${financialYearDD}
    \    DisbursementIndex.Apply Filters
    \    sleep  5s

Check Specified Arrear Disbursement Paybill
    [Arguments]  ${PAYBILLNO}  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}=3
    ${PaybillTableColumnNumber}  Get Amount Column Number  ${paybillTableID}  Actions
    DisbursementIndex.Show Maximum Entries
    sleep  2s
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td/div/div/a/i[@class='fa fa-edit']
    sleep  1s
    click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td/div/div/ul/li/a[@title='Click here for Employee List']
    @{ReportData}  Get Data Of Report Page
    Switch Tab
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td/div/div/a/i[@class='fa fa-pencil']
    sleep  2s
    @{disbursementData}  ArrearDisbursementIndex.Get Data Of Arrear Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    sleep  2s
    Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Get Data Of Arrear Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTableID}
    ${numberOfRows}  get element count  ${disbursementTableID}/tbody/tr
    ${columnNumber}  DisbursementIndex.Get Amount Column Number  ${disbursementTableID}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${elementValue}  get element attribute  //*[@id="EmpSalGrid"]/tbody/tr[1]/td[${columnNumber}]/input  value
    \    ${formattedAmount}  DisbursementIndex.Change The Number Into A Formatted Amount  ${elementValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}
