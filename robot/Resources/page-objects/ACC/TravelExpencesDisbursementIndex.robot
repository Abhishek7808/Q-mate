*** Keywords ***

Go To Travel Expences Disbursement Index Page And Set Variables
    [Documentation]  Sets test environment and opens disbursement page according to the test.
    TravelExpencesDisbursementIndex.Set Variables
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}  # """ Disbursement url is already set """

Set Variables
    [Documentation]  Sets variables according to the test.
    # """ Each disbursement have its own variables to set up before the testing"""
    set test variable  ${disbursementUrl}  HRM/TravelExpencesDisbursement           # """ Sets Disbursement URL """
    set test variable  ${disburseTableColumnHead}  Bill Amount          # """ It is set for fetching disbursement amount"""
    set test variable  ${disbursementTableID}  //*[@id="classlisting"]/div/table
    set test variable  ${employeeIdColumn}  2           # """ It is set for fetching employee id from disbursement data table """
    set test variable  ${paybillDetailsColumnHead}  Disbursement Detail         # """ It is set for fetching paybill Number from Paybill """

Match All Paybills Net Amount With The Report For Given Unit
    [Documentation]  Matches the Salaries in disburement page and report page for a given unit
    run keyword if  ${UNITID}!= None  TopNavigation.Select Unit In Preference Modal By ID
    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    sleep  2s
    run keyword if  ${PAYBILLNO} == None  Check Travel Expence Paybills         # """ Travel Expances disbursement table and the button for opening disbursement page is different"""
    run keyword if  ${PAYBILLNO} != None  TravelExpencesDisbursementIndex.Check Specified TravelExpences Paybill

Match All Paybills Net Amounts With Reports For All Units
    [Documentation]  Matches the Salaries in disburement page and report page for all units
    TopNavigation.Open Preference Unit Page
    ${allUnits}  TopNavigation.Get Unit Count In Preference Modal
    FOR  ${unit}  IN RANGE  1  ${allUnits}
    \   TopNavigation.Select Unit In Preference Modal  ${unit}
    \   DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \   sleep  2s
    \   Check Travel Expence Paybills
    \   TopNavigation.Open Preference Unit Page

Check Travel Expence Paybills
    [Documentation]  Checks the available paybill at the travel expences disbursement page
    Wait Until Keyword Succeeds    15    200ms    Common_Keywords.Show Maximum Entries on Page
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    Common_Keywords.Show Maximum Entries on Page           # """ To get all the paybills at once"""
    \    sleep  2s
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}  ${paybillDetailsColumnHead}
    \    DisbursementIndex.Go To Report Page  ${paybillNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    Common_Keywords.Switch Tab             # """ Report page opens in a new tab """
    \    TravelExpencesDisbursementIndex.Go To Disbursement Details Page  ${paybillNumber}
    \    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${disburseTableColumnHead}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUrl}
    \    sleep  2s

Check Specified TravelExpences Paybill
    [Documentation]  Checks paybill of given number.
    Common_Keywords.Show Maximum Entries on Page
    sleep  2s
    ${paybillNumber}  TravelExpencesDisbursementIndex.Change Paybill Number Format          # """ Paybill Number are written differently in Travel expence Disbursement """
    DisbursementIndex.Go To Report Page  ${paybillNumber}
    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    Common_Keywords.Switch Tab
    TravelExpencesDisbursementIndex.Go To Disbursement Details Page  ${paybillNumber}
    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${disburseTableColumnHead}  ${disbursementTableID}
    sleep  2s
    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Go To Disbursement Details Page             # """Travel Expences and Leave Encashment Paybills have different button"""
    [Documentation]  Opens disbursement details page of specified paybill.
    [Arguments]  ${PAYBILLNO}
    click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//i[@class='fa fa-eye']

Change Paybill Number Format            # """ Only Travel expence disbursement paybill numbers are written with a dash """
    [Documentation]  Removes dash sign from the paybill number.
    ${PaybillNumber}  remove string  ${PAYBILLNO}  -
    return from keyword  ${PaybillNumber}
