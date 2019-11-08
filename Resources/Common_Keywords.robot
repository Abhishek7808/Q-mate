*** Settings ***
Resource    ../Configuration.resource
Library     SeleniumLibrary  plugins=${PLUGINS}/ERP.py
Library	    OperatingSystem
Library	    String
Library     Collections

*** Keywords ***
Begin Web Test
    #support for the library path
    # ${libPath}  Replace String  ${CURDIR}  ${RESOURCE_DIR}  ${LIBRARY_DIR}
    #log to console  ${LIBRARY}
    evaluate  sys.path.append(os.path.join(r'${LIBRARY}'))  modules=os, sys

    #support for the plugin path
    #${pluginPath}  Replace String  ${CURDIR}  ${RESOURCE_DIR}  ${PLUGINS_DIR}
    #evaluate  sys.path.append(os.path.join(r'${PLUGINS}'))  modules=os, sys

    remove file  ${ERRORFILE}

    open browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    close all browsers

Read JSON File
    [Arguments]  ${JSON_File}
    ${JSON}=  Get file  ${JSON_File}
    return from keyword  ${JSON}
    log

Evaluate And Store JSON File
    [Arguments]  ${JSON}
    @{urls_list}=    Evaluate     json.loads('''${json}''')    json
    return from keyword  @{urls_list}

Read And Evaluate JSON File
    [Arguments]  ${JSON_File}
    ${JSON}   Read JSON File  ${JSON_File}
    ${File_JSON}  Evaluate And Store JSON File  ${JSON}
    return from keyword  ${File_JSON}

Open SalaryDisbursement Page
    [Arguments]  ${finalList}
    open erp page  /HRM/salaryDisbursment/SalayDisbursmentIndex
    sleep  2s
    ${count}  Open Popup
    log to console  ${count}
    FOR  ${i}  IN RANGE  1  ${count}
    \    log to console  ${i}
    \    Select Unit  ${i}
    \    sleep  4s
    \    Apply Filter
    \    sleep  2s
    \    Check Paybill  ${finalList}
    \    Open Popup
    \    sleep  2s

Open Popup
    TopNavigation.Open User Action Menu
    sleep  2s
    mouse over   //*[@id="content"]/div[1]/div[4]/div/a/span/span[2]
    click element  ${Change Preference}
    sleep  2s
    click element  ${PERFERENCE MENU ID}
    Wait Until Page Contains Element  xpath=//ul[contains(@class,'select2-results')]
    ${count}  Get Element Count  //div[@id='select2-drop']//li
    return from keyword  ${count}

Select Unit
    [Arguments]  ${i}
    click element  xpath=//div[@id='select2-drop']//li[${i}]
    sleep  2s
    click button  //*[@id="SAVE_OPTION"]

Apply Filter
     click button  //*[@id="btnFilter"]
     sleep  2s
     select last dropdown element  ${PERFERENCE DROPDOWN}
     click button  //button[contains(text(),'Apply Filter')]

Check Paybill
    [Arguments]  ${finalList}
    ${rows}  get element count  //*[@id="classListing"]/div[1]/table/tbody/tr
    log to console  ${rows}
    FOR  ${paybillTableRow}  IN RANGE  1  ${rows+1}
    \    ${payBillNumber}  Common_Keywords.Get Paybill Number  //tr[${paybillTableRow}]//td[2]//span[2]
    \    @{list1}  Common_Keywords.Get Data Of Table 1  ${paybillTableRow}
    \    @{list2}  Common_Keywords.Get Data Of Table 2  ${paybillTableRow}
    \    Common_Keywords.Compare And Add To List  ${list1}  ${list2}  ${payBillNumber}  ${finalList}
#   \    append to list  ${finalList}  ${errorSalary}
    \    Go To ERP Page  ${salaryUrl}
    log to console  ${finalList}

Get Paybill Number
    [Arguments]  ${payBillSpan}
    ${payBillText}  get text  ${payBillSpan}
    log to console  ${payBillText}
    ${payBillTextDict}  split string  ${payBillText}  ;
    log to console  ${payBillTextDict}[0]
    return from keyword  ${payBillTextDict}[0]


Get Data Of Table 2
    [Arguments]  ${payBill}
    Go To ERP Page  ${salaryUrl}
    sleep  2s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${payBill}]/td[7]/div/div/a[2]/i
    sleep  3s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${payBill}]/td[7]/div/div/ul/li[1]/a[1]
    @{Windowtitles}    Get Window Handles
    ${windowtoopen}=    Get From List    ${Windowtitles}  -1
    Select Window    ${windowtoopen}
    @{list1}  create list
    ${numberOfRows}  get element count  //*[@id="HBA"]/tbody/tr
    ${coloumNumber}  get element count  //*[@id="HBA"]/thead/tr/th
#    log to console  ${numberOfRows}
#    log to console  ${coloumNumber}
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  xpath=//table[@id='HBA']  ${row+1}  ${coloumNumber}
    \    log to console  ${salary}
#    \    ${employeeName}  Get Table Cell  xpath=//table[@id='HBA']  ${row}  2
    \    append to list   ${list1}   ${salary}.00
    return from keyword  @{list1}

Get Data Of Table 1
    [Arguments]  ${payBill}
    sleep  2s
    click element  //*[@id="classListing"]/div[1]/table/tbody/tr[${payBill}]/td[7]/div/div/a[1]/i
    ${numberOfRows}  get element count  xpath=//*[@id="EmpSalGrid"]/tbody/tr
    ${coloumNumber}  Get Number of Coloums  xpath=//*[@id="EmpSalGrid"]
    log to console   ${coloumNumber}
    @{list2}  create list
    FOR  ${row}  IN RANGE  1  ${numberOfRows}
    \    sleep  2s
    \    ${salary}  Get Table Cell  xpath=//*[@id="EmpSalGrid"]  ${row+1}  ${coloumNumber}
#    \    ${Name}  Get Table Cell  xpath=//*[@id="EmpSalGrid"]  ${row}  3
    \    append to list  ${list2}  ${salary}
    return from keyword  @{list2}

Compare And Add To List
    [Arguments]  ${list1}  ${list2}  ${payBillNumber}  ${finalList}
    log to console  ${list1}
    log to console  ${list2}
    ${numberOfItems}  get length  ${list1}
    FOR  ${index}  IN RANGE  ${numberOfItems}
#    \     log to console  @{list1}[${item}]
#    \     log to console  @{list2}[${item}]
     \     run keyword if  '@{list1}[${index}]' != '@{list2}[${index}]'  Add To The Report  ${payBillNumber}  ${index}  ${finalList}


Get Number of Coloums
    [Arguments]  ${tableUrl}
    ${text2}  set variable  Net Amount
    ${NumberOfColumns}  get element count  ${tableUrl}/thead/tr/th
    FOR  ${columnNumber}  IN RANGE  2  ${NumberOfColumns+1}
    \   log to console  ${item}
    \   ${text}   Get Table Cell  ${tableUrl}  1  ${columnNumber}
    \   log to console  ${text}
    \   log to console  ${text2}
    \   ${status}  run keyword and return status  BuiltIn.Should Be Equal As Strings  ${text}  ${text2}
    \   run keyword if  ${status} == ${true}  return from keyword  ${columnNumber}
    #return from keyword  ${colums}


Add To The Report
    [Arguments]  ${payBillNumber}  ${index}  ${finalReport}
    ${employeeID}  get table cell  xpath=//table[@id='HBA']  ${index+2}  2
    run keyword and continue on failure  fail  Salary of Employee ID. ${employeeID} in ${payBillNumber} didn't match
    append to list   ${finalReport}  ${payBillNumber}: Employee ID. ${employeeID}

#Set This Variable
#    [Arguments]  ${number}  ${item}
#    ${number}  set variable  ${item}
#    log to console  ${number}
#
#    return from keyword  ${number}




