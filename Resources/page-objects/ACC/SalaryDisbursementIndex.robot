*** Keywords ***

Go To Salary Disbursement Index Page And Set Variables
    [Documentation]  Opens Disbursement url as according to the test and calls 'set variables' keyword.
    SalaryDisbursementIndex.Set Variables
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}

Set Variables
    [Documentation]  Sets variables according to the test.
    # """ Each disbursement have its own variables to set up before the testing"""
    set test variable  ${disbursementUrl}  HRM/salaryDisbursment/SalayDisbursmentIndex
    set test variable  ${disburseTableColumnHead}  Net Amount            # """ It is set for fetching disbursement amount"""
    set test variable  ${disbursementTableID}  //*[@id="EmpSalGrid"]
    set test variable  ${paybillDetailsColumnHead}  PayBill Detail       # """ It is set for fetching paybill Number from Paybill """
    set test variable  ${employeeIdColumn}          3            # """ It is set for fetching employee id from disbursement data table """

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    DisbursementIndex.Open Filters
    DisbursementIndex.Select Given Financial Year
    DisbursementIndex.Select Given Cycle Filter
    DisbursementIndex.Apply Filters
    sleep  5s
    run keyword if  ${PAYBILLNO} == None  SalaryDisbursementIndex.Check Salary Paybills
    run keyword if  ${PAYBILLNO} != None  SalaryDisbursementIndex.Check Specified Salary Paybill

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
    \   SalaryDisbursementIndex.Check Salary Paybills
    \   TopNavigation.Open Preference Unit Page

Check Salary Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    Common_Keywords.Show Maximum Entries on Page
    \    sleep  2s
    \    ${paybillNumber}  SalaryDisbursementIndex.Get Salary Paybill Number  ${paybill}  ${paybillDetailsColumnHead}
    \    DisbursementIndex.Go To Report Page  ${paybillNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    Common_Keywords.Switch Tab
    \    DisbursementIndex.Go To Disbursement Details Page  ${paybillNumber}
    \    switch window  NEW
    \    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${disburseTableColumnHead}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    close window
    \    Common_Keywords.Switch Tab
#    \    Open Filters
#    \    Select Given Financial Year
#    \    Apply Filters
#    \    sleep  2s

Check Specified Salary Paybill
    [Documentation]  Checks paybill of given number.
    ${PaybillTableColumnNumber}  Get Table Column Number  ${paybillTableID}  Actions
    Common_Keywords.Show Maximum Entries on Page
    sleep  2s
    DisbursementIndex.Go To Report Page  ${PAYBILLNO}
    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    Common_Keywords.Switch Tab
    sleep  2s
    DisbursementIndex.Go To Disbursement Details Page  ${PAYBILLNO}
    switch window  NEW
    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${disburseTableColumnHead}  ${disbursementTableID}
    sleep  2s
    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Get Salary Paybill Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}   ${paybillDetailsColumnHead}
    ${columnNumber}  Get Table Column Number  ${paybillTableID}  ${paybillDetailsColumnHead}
    ${payBillDetails}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${paybillTableID}  ${paybillTableRow+1}  ${columnNumber+1}
    ${paybillDetailSet1}  Split String From Right  ${payBillDetails}   Paybill No. :
    ${paybillNumber}  get substring  ${paybillDetailSet1}[1]  0  14
    return from keyword  ${paybillNumber}