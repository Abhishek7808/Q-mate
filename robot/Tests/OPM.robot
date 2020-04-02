*** Settings ***
Resource          ../Configuration.resource
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Resource          ${RESOURCES}${/}Common_Keywords.robot
*** Variables ***

*** Keywords ***
Go To Day
    ${totalDays}  Get element count  //table[@id='example']//tr
    FOR  ${row}  IN RANGE  1  ${totalDays}
    \  sleep  1s
    \  click Element  //tr[1]//td[2]//a[1]
    \  switch window  NEW
    \  ${workingHours}  Get Text  lblAttendance_Hours
    \  ${workingHours}  set variable if  ${workingHours} == 0  4  ${workingHours}
    \  sleep  1s
    \  click Element  lnkAdd
    \  sleep  2s
    \  select from list by label  ddlProj  RAJERP
    \  sleep  6s
    \  click Element  ddlTask
    \  Press Keys  ddlTask  QA & Automation(Unplanned Task)
    \  Press Keys  ddlTask  ENTER
    \  Input Text  txtHrs  ${workingHours}
    \  Click Element  LnkSave
    \  sleep  1s
    \  Click Element  //ul[@class='nav navbar-top-links navbar-right']//a[contains(text(),'Close')]
    \  sleep  2s
    \  Common_Keywords.switch tab

*** Test Cases ***
Goto the Untilized hours page
    [Tags]  opm
    open browser  http://projects.e-connectsolutions.com/login.aspx  chrome
    maximize browser window
    Input Text  txtUserName  102709
    Input Password  txtPassword  Golu@141
    Click Element  btnLogin
    Go To  http://projects.e-connectsolutions.com/OPM/UnutilizedHours.aspx
    sleep  2s
    ${totalRow}  Get element count  //table[@id='example']//tr
    FOR  ${row}  IN RANGE  1  ${totalRow}
    \  click Element  //table[@id='example']//tr[1]//td[2]//a[1]
    \  sleep  2s
    \  switch window  NEW
    \  Go To Day
    \  Common_Keywords.switch tab
    \  Common_Keywords.switch tab
    \  sleep  2s