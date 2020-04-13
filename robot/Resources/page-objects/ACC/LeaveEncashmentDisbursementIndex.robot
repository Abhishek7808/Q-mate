*** Keywords ***

Go To Leave Encashment Disbursement Index Page And Set Variables
    [Documentation]  Opens leave encashment disbursement index page and sets variables for leave encashment disbursement scripts.
    LeaveEncashmentDisbursementIndex.Set Variables
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}

Set Variables
    [Documentation]  Sets variables according to the test.
    ###""" Each disbursement have its own variables to set up before the testing"""
    set test variable  ${disbursementUrl}  HRM/LeaveEncashmentDisbursement/LeaveEncashDisbursmentIndex
    set test variable  ${disburseTableColummHead}  Leave Encashment Amount          ###""" It is set for fetching disbursement amount"""
    set test variable  ${disbursementTableID}  //*[@id="classlisting"]/div/table
    set test variable  ${employeeIdColumn}  2           ###""" It is set for fetching employee id from disbursement data table """

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    sleep  5s
    ${PAYBILLNO}  convert to string  ${PAYBILLNO}
    run keyword if  ${PAYBILLNO} == None  LeaveEncashmentDisbursementIndex.Check Leave Encashment Paybills
    run keyword if  ${PAYBILLNO} != None  LeaveEncashmentDisbursementIndex.Check Specified Leave Encashment Paybill

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    [Arguments]  ${retryCount}
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}  ${retryCount}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   sleep  2s
    \   LeaveEncashmentDisbursementIndex.Check Leave Encashment Paybills
    \   TopNavigation.Open Preference Unit Page

Check Leave Encashment Paybills
    [Documentation]  Checks the available paybill at the salary disbursement page
    #Common_Keywords.Show Maximum Entries on Page
    sleep  2s
    ${allPaybills}  Get Paybill Count
    # TODO: change the Check Paybills range before testing on live ,it should start from 1, remove comments from show max entries
    FOR  ${paybill}  IN RANGE  2  ${allPaybills+1}
    #\    Common_Keywords.Show Maximum Entries on Page
    \    sleep  2s
    \    ${paybillNumber}  LeaveEncashmentDisbursementIndex.Get Voucher Number  ${paybill}
    \    DisbursementIndex.Go To Report Page  ${paybillNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    Common_Keywords.Switch Tab
    \    LeaveEncashmentDisbursementIndex.Go To Disbursement Details Page  ${paybillNumber}
    \    @{disbursementData}  LeaveEncashmentDisbursementIndex.Get Data Of Leave Encashment Disbursement Details Page
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}

Check Specified Leave Encashment Paybill
    [Documentation]  Checks paybill of givne number.
    Common_Keywords.Show Maximum Entries on Page
    sleep  2s
    DisbursementIndex.Go To Report Page  ${PAYBILLNO}
    sleep  1s
    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    Common_Keywords.Switch Tab
    LeaveEncashmentDisbursementIndex.Go To Disbursement Details Page  ${PAYBILLNO}
    page should contain  Leave Encashment Disbursement Process
    @{disbursementData}  LeaveEncashmentDisbursementIndex.Get Data Of Leave Encashment Disbursement Details Page
    sleep  2s
    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Go To Disbursement Details Page                      ###""" Travel Expences and Leave Encashment Paybills have different button
    [Documentation]  Opens disbursement details page of given paybill.
    [Arguments]  ${PAYBILLNO}
    click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//i[@class='fa fa-eye']

Get Data Of Leave Encashment Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    wait until page contains element  ${disbursementTableID}
    ${numberOfRows}  get element count  ${disbursementTableID}/tbody/tr
    ${columnNumber}  Get Table Column Number  ${disbursementTableID}  ${disburseTableColummHead}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows+1}
    \    ${textValue}  get table cell  ${disbursementTableID}  ${row+1}  ${columnNumber+1}
    \    ${formattedAmount}  Common_Keywords.Change The Number Into A Formatted Amount  ${textValue}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}

Get Voucher Number
    [Documentation]  Returns the paybill number from the paybill table
    [Arguments]  ${paybillTableRow}
    ${columnNumber}  Get Table Column Number  ${paybillTableID}  Voucher Detail
    ${payBillDetails}  get table cell  ${paybillTableID}  ${paybillTableRow+1}  ${columnNumber+1}
    ${paybillDetailSet1}  Split String From Right   ${payBillDetails}  ;
    ${paybillDetailSet2}  Split String From Right   ${paybillDetailSet1}[0]  :${SPACE}
    return from keyword  ${paybillDetailSet2}[1]