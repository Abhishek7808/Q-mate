*** Keywords ***

Go To Travel Expences Disbursement Index Page And Set Variables
    TravelExpencesDisbursementIndex.Set Variables
    ${retryCount}  DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    return from keyword  ${retryCount}

Set Variables
    set test variable  ${disbursementUrl}  HRM/TravelExpencesDisbursement
    set test variable  ${disburseTableColumnText}  Bill Amount
    set test variable  ${disbursementTableID}  //*[@id="classlisting"]/div/table
    set test variable  ${employeeIdColumn}  2

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    [Arguments]  ${UNITID}  ${retryCount}
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID  ${UNITID}  ${retryCount}
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    sleep  2s
    run keyword if  ${PAYBILLNO} == None  Check Travel Expence Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${employeeIdColumn}
    run keyword if  ${PAYBILLNO} != None  TravelExpencesDisbursementIndex.Check Specified TravelExpences Paybill  ${PAYBILLNO}  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${employeeIdColumn}

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   sleep  2s
    \   Check Travel Expence Paybills  ${disbursementUrl}  ${disburseTableColumnText}  ${disbursementTableID}  ${employeeIdColumn}
    \   TopNavigation.Open Preference Unit Page

Check Travel Expence Paybills
    [Documentation]  Checks the available paybill at the travel expences disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}  ${paybillDetailsColumnHead}=Disbursement Detail
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    ${PaybillTableColumnNumber}  DisbursementIndex.Get Amount Column Number  ${paybillTableID}  Actions
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    DisbursementIndex.Show Maximum Entries
    \    sleep  2s
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}  ${paybillDetailsColumnHead}
    \    DisbursementIndex.Go To Report Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    DisbursementIndex.Switch Tab
    \    DisbursementIndex.Go To Disbursement Page  ${paybill}  ${PaybillTableColumnNumber}
    \    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}
    \    sleep  2s

Check Specified TravelExpences Paybill
    [Arguments]  ${PAYBILLNO}  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}=3
    ${PaybillTableColumnNumber}  Get Amount Column Number  ${paybillTableID}  Actions
    DisbursementIndex.Show Maximum Entries
    sleep  2s
    DisbursementIndex.Go To Report Page Of Specified Paybill  ${PAYBILLNO}
    @{ReportData}  Get Data Of Report Page
    Switch Tab
    TravelExpencesDisbursementIndex.Go To Disbursement Page Specified By Paybill  ${PAYBILLNO}
    @{disbursementData}  Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    sleep  2s
    Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Go To Disbursement Page Specified By Paybill
    [Arguments]  ${PAYBILLNO}
     click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//i[@class='fa fa-eye']

