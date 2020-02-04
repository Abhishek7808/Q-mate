*** Variables ***

${cycle}  SalaryCycleId
${paybillTableID}  //*[@id="classListing"]/div[1]/table
${paybillTableRow}     //*[@id="classListing"]/div[1]/table/tbody/tr
${reportPageTableID}  //table[@id='HBA']
${showMaxDD}  DDLpageSize
@{finalList}


*** Keywords ***
Go To Disbursement Index Page
    [Documentation]  Opens disbursement page
    [Arguments]  ${disbursementUnitUrl}
    go to erp page  ${BASE_URL.${ENVIRONMENT}}/${disbursementUnitUrl}

Open Filters
    [Documentation]  Opens Filter menu on the page.
    NavigationHelper.Select Filter Menu

Apply Filters
    [Documentation]  Applies filters.
    NavigationHelper.Apply Filter

Select Given Financial Year
    [Documentation]  Opens financial year dropdown and selects financial year.
    [Arguments]  ${financialYearDD}=Finyear                         # By default financial year dropdown locator is set as Finyear because
                                                                    # in most of the disbursement pages its id is given Finyear.
    select from list by value  ${financialYearDD}  ${FINANCIALYEAR}

Select Given Cycle Filter
    [Documentation]  Opens cycle dropdown and selects given cycle.
    sleep  2s
    # """ If cycle id is not given then last cycle will be selected."""
    run keyword if  ${CYCLEID} != None  select from list by value  ${cycle}  ${CYCLEID}  ELSE  select last dropdown element  ${cycle}

Apply Last Cycle Filter
    [Documentation]  Opens filter menu in salary disbursement page and applies the last salary cycle filter
    NavigationHelper.Select Filter Menu
    select last dropdown element  ${cycle}
    NavigationHelper.Apply Filter

Check Paybills
    [Documentation]  Checks the available paybill at the disbursement page
    [Arguments]  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${paybillDetailsColumnHead}=Disbursement Detail  ${financialYearDD}=Finyear  ${employeeIdColumn}=3
    Wait Until Keyword Succeeds    15    200ms    Common_Keywords.Show Maximum Entries on Page
    ${allPaybills}  DisbursementIndex.Get Paybill Count
    FOR  ${paybill}  IN RANGE  1  ${allPaybills+1}
    \    Common_Keywords.Show Maximum Entries on Page
    \    sleep  2s
    \    ${paybillNumber}  DisbursementIndex.Get Paybill Number  ${paybill}  ${paybillDetailsColumnHead}
    \    DisbursementIndex.Go To Report Page  ${paybillNumber}
    \    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    \    Common_Keywords.Switch Tab         # """ Report page opens in a new tab """
    \    DisbursementIndex.Go To Disbursement Details Page  ${paybillNumber}
    \    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    \    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    \    DisbursementIndex.Go To Disbursement Index Page  ${disbursementUnitUrl}
    \    DisbursementIndex.Open Filters     # """ Filters vanish when we come back to the disbursement page so they have to be applied again."""
    \    DisbursementIndex.Select Given Financial Year  ${financialYearDD}
    \    DisbursementIndex.Apply Filters
    \    sleep  5s

Check Specified Paybill
    [Documentation]  Checks paybill of given number.
    [Arguments]  ${PAYBILLNO}  ${disbursementUnitUrl}  ${columnToBeFetched}  ${disbursementTableID}  ${employeeIdColumn}=3
    Common_Keywords.Show Maximum Entries on Page
    sleep  2s
    DisbursementIndex.Go To Report Page  ${PAYBILLNO}
    @{ReportData}  DisbursementIndex.Get Data Of Report Page
    Common_Keywords.Switch Tab
    sleep  2s
    DisbursementIndex.Go To Disbursement Details Page  ${PAYBILLNO}
    @{disbursementData}  DisbursementIndex.Get Data Of Disbursement Details Page  ${columnToBeFetched}  ${disbursementTableID}
    sleep  2s
    DisbursementIndex.Compare And Add To Report  ${ReportData}  ${disbursementData}  ${PAYBILLNO}  ${disbursementTableID}  ${employeeIdColumn}

Get Paybill Count
    [Documentation]  Returns the number of rows in the given paybill table. i.e. returns total number of paybills available.
    wait until element is visible  ${paybillTableID}  10s
    ${rowsCount}  get element count  ${paybillTableRow}
    return from keyword  ${rowsCount}

Get Paybill Number
    [Documentation]  Returns the paybill number of specified row and column.
    [Arguments]  ${paybillTableRow}   ${paybillDetailsColumnHead}
    ${columnNumber}  Get Table Column Number  ${paybillTableID}  ${paybillDetailsColumnHead}
    ${payBillDetails}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get table cell  ${paybillTableID}  ${paybillTableRow+1}  ${columnNumber+1}
    ${paybillDetailSet1}  Split String From Right  ${payBillDetails}  Paybill No.
    ${paybillNumber}  get substring  ${paybillDetailSet1}[1]  1  15
    return from keyword  ${paybillNumber}

#Go To Report Page
#    [Arguments]   ${paybillTableRow}  ${columnNumber}
#    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/a[2]/i
#    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${paybillTableRow}]/td[${columnNumber}]/div/div/ul/li[1]/a[1]
#    Switch Window  NEW

Go To Report Page
    [Documentation]  Opens report page of given paybill.
    [Arguments]  ${paybillNumber}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${paybillNumber}')]/../following-sibling::td//i[contains(@class,'fa fa-edit')]
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //div[contains(@class,'btn-group-xs open')]//li[1]//a[1]
    Switch Window  NEW

#Go To Report Page Of Specified Paybill
#    [Arguments]  ${PAYBILLNO}
#    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//a[@class='btn btn-sm btn-primary']
#    sleep  1s
#    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//a[contains(text(),'Employee List')]
#    Switch Window  NEW

Get Data Of Report Page
    [Documentation]  Returns the list of salaries of employees listed in report page
    ${errorStatus}  Generic.Check Error Occurred
    ${disbursementType}  Get Disbursement Type  ${disbursementUrl}
    run keyword if  '${errorStatus}' == '1'  fail  Report page of ${disbursementType} showed an error
    @{list}  create list
    wait until page contains element  ${reportPageTableID}
    ${numberOfRows}  get element count  ${reportPageTableID}/tbody/tr
    ${columnNumber}  get element count  ${reportPageTableID}/thead/tr/th
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    log to console  ${row} out of ${numberOfRows} processed...
    \    ${amount}  get table cell  ${reportPageTableID}  ${row+1}  ${columnNumber}
    \    log to console  ${amount}
    \    ${formattedAmount}  Common_Keywords.Change The Number Into A Formatted Amount  ${amount}       # """ Fractional part is to be added in this amount so that it can compared fairly with disbursed amount """
    \    append to list   ${list}   ${formattedAmount}
    close window
    return from keyword  @{list}

Go To Disbursement Details Page
    [Documentation]  Opens disbursement details page of given number.
    [Arguments]  ${PAYBILLNO}
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click element  //span[contains(text(),'${PAYBILLNO}')]/../following-sibling::td//i[@class='fa fa-pencil']

Get Data Of Disbursement Details Page
    [Documentation]  Returns the list of salaries of employees listed in disbursement page
    [Arguments]  ${columnToBeFetched}  ${disbursementTableID}
    ${errorStatus}  Generic.Check Error Occurred
    ${disbursementType}  Get Disbursement Type  ${disbursementUrl}
    run keyword if  '${errorStatus}' == '1'  fail  Disbursement page of ${disbursementType} showed an error
    wait until page contains element  ${disbursementTableID}
    ${numberOfRows}  get element count  ${disbursementTableID}/tbody/tr
    ${columnNumber}  Get Table Column Number  ${disbursementTableID}  ${columnToBeFetched}
    @{list}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    log to console  ${row} out of ${numberOfRows} processed...
    \    ${amount}  get table cell  ${disbursementTableID}  ${row+1}  ${columnNumber+1}
    \    log to console  ${amount}
    \    ${formattedAmount}  Common_Keywords.Change The Number Into A Formatted Amount  ${amount}
    \    append to list  ${list}  ${formattedAmount}
    return from keyword  @{list}

Compare And Add To Report
    [Documentation]  Compares both report page list and disbursement page list and add the result of camparision into a report
    [Arguments]  ${ReportData}  ${disbursementData}  ${paybillNumber}  ${disbursementTableID}  ${employeeIdColumn}
    log to console  Comparing the amounts of Report page and Disbursement Page for paybill Number ${paybillNumber}...\n ${ReportData} ${disbursementData}
    ${numberOfItems}  run keyword if  ${ReportData} != []  get length  ${ReportData}  ELSE  get length  ${disbursementData}
    FOR  ${index}  IN RANGE  ${numberOfItems}
    \   run keyword and continue on failure  run keyword if  '@{ReportData}[${index}]' != '@{disbursementData}[${index}]'  Add To The Disbusement Test Report  ${paybillNumber}  ${index}  ${disbursementTableID}  ${employeeIdColumn}
    #\   run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  There is an error in one of the pages of paybill ${paybillNumber}

Add To The Disbusement Test Report
    [Documentation]  Add unmatched salaries to the Test Report
    [Arguments]  ${paybillNumber}  ${index}  ${disbursementTableID}  ${employeeIdColumn}
    ${employeeID}  Get Employee ID   ${disbursementTableID}  ${index}  ${employeeIdColumn}
    ${disbursementType}  Get Disbursement Type  ${disbursementUrl}
    run keyword and continue on failure  fail  ${disbursementType}: Disbursement Amount Of Employee ID ${employeeID} in Paybill NUmber: ${paybillNumber} didn't match
    append to file  ${DV_REPORT}  ${disbursementType}, ${paybillNumber}, ${employeeID}\n

#Get Table Column Number
#    [Arguments]  ${tableID}  ${requiredText}
#    ${NumberOfColumns}   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get element count  ${tableID}/thead/tr/th
#    FOR  ${column}  IN RANGE  1  ${NumberOfColumns}
#    \   ${status}  run keyword and return status  table cell should contain  ${tableID}  1  ${column}  ${requiredText}
#    \   run keyword if  ${status} == ${true}  return from keyword  ${column}

#Get Table Column Number
#    [Documentation]  Gives the column number of the 'Net Amount' column
#    [Arguments]  ${tableID}  ${requiredText}
#    ${NumberOfColumns}   wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  get element count  ${tableID}/thead/tr/th
#    FOR  ${column}  IN RANGE  1  ${NumberOfColumns+1}
#    \   ${data}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  Read Table Data  ${tableID}  1  ${column-1}
#    \   ${columnText}  get text  ${data}
#    #\   run keyword if  '${columnText}' == '${EMPTY}'  Get Table Column Number  ${tableID}  ${requiredText}
#    \   ${status}  run keyword and return status  should be equal as strings  ${columnText}  ${requiredText}
#    \   run keyword if  ${status} == ${true}  return from keyword  ${column}

Get Employee ID
    [Documentation]  Returns the employee ID from the given table data
    [Arguments]  ${tableID}  ${rowNumber}  ${columnNumber}
    ${employeeData}   get table cell  ${tableID}  ${rowNumber+2}  ${columnNumber}
    ${employeeDataSet}  split string  ${employeeData}  -
    ${employeeID}  get from list  ${employeeDataSet}  0
    return from keyword  ${employeeID}

Get Disbursement Type
  [Documentation]  Fetches disbursement type from the disbursement url.
  [Arguments]  ${disbursementUrl}
  ${disbursementUrlSet}  split string from right  ${disbursementUrl}  /  1
  ${stringSet}  split string  ${disbursementUrlSet}[1]  Dis
  ${disbursementType}  Catenate  ${stringSet}[0] Disbursement
  return from keyword   ${disbursementType}

#Switch Tab
#    [Documentation]  Switches the robot to the previous tab
#    @{windowTitles}    get window handles
#    ${windowToOpen}=    get from list    ${windowTitles}  -1
#    Select Window    ${windowToOpen}

Close Last Tab
    [Documentation]  Closes the last tab
    ${title_var}        Get Window Titles
    Select Window       title=@{title_var}[0]
    close window

Close Current Tab
    [Documentation]  Closes the current tab
    ${title_var}        Get Window Titles
    Select Window       title=@{title_var}[1]
    close window