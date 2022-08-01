*** Settings ***
Library  OperatingSystem
Library  ${LIBRARY}/Notifications.py


*** Variables ***
@{moduleUrls}
@{fatalErorrs}
${result}=  None

*** Keywords ***

Get All Module Urls
    [Documentation]  Returns the Urls of given module
    [Arguments]  ${muduleName}
    @{moduleUrls}  Filter Module Urls  ${muduleName}  ${URLS_JSON}
    return from keyword  @{moduleUrls}

# TODO: Add all error urls in a list and use Send All Errors keyword from Notifications.py to send them.
Perform All Critical Generic Tests On Urls
    [Documentation]  Performs all tests on the urls of given module
    [Arguments]  ${moduleName}  @{moduleUrls}
    #create file  ${ERRORFILE}
    #Replacing Old For Loop Syntax with New Syntax
    FOR  ${url}  IN  @{moduleUrls}
        Run Keyword And Continue On Failure  Open ERP Page  ${url}
        ${result}  Check Page Error
        run keyword unless  ${result} == None   Add Failed Url To The Fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url}  ${result}
    END
    #:FOR  ${url}  IN  @{moduleUrls}
    #\   Run Keyword And Continue On Failure  Open ERP Page  ${url}
    #\   ${result}  Check Page Error
    #\   run keyword unless  ${result} == None   Add Failed Url To The Fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url}  ${result}
    #Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}

Add Failed Url To The Fatal Error List
    [Documentation]  Adds the error url to the fatal error list
    [Arguments]   ${url}  ${result}
    ${errorCode}  get from dictionary  ${ERROR_DETAILS}  ${result}
    run keyword and continue on failure  fail  ${errorCode} : ${url}
    append to file  ${ERRORFILE}  ${url},${result}\n

#Add Failed Url To The fatal Error List
#    [Arguments]   ${url}
#    append to list  ${fatalErorrs}  ${url}

Report Fatal Errors To Developers
     [Documentation]  Reports the fatal errors to the developers
     [Arguments]  ${moduleName}  @{fatalErorrs}
     #run keyword and continue on failure  Write Error Report  ${fatalErorrs}
     log  ${fatalErorrs}
     Send Error Email Notification  ${moduleName}  ${CONTACTS_JSON}

Get Urls List Of Fatal Errors
    [Documentation]  Get urls of fatal error list
    [Arguments]  ${fatalErorrs}
    return from keyword  ${fatalErorrs}

Open ERP Page
    [Documentation]  Opens the ERP page of given url
    [Arguments]  ${pageUrl}
    [Timeout]  120
    ${userType}  run keyword if  '${ENVIRONMENT}' == 'dev' or '${ENVIRONMENT}' == 'test'  set variable  admin  ELSE IF  '${ENVIRONMENT}' == 'production'  set variable  admin_live
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}  ${userType}
    #wait until page contains element  //a[@class='fa fa-home fa-3x']  20s

Open ERP Page Without Permission
    [Documentation]  Opens the ERP page with citizen credentials
    [Arguments]  ${pageUrl}
    [Timeout]  120
    ${userType}  run keyword if  '${ENVIRONMENT}' == 'dev' or '${ENVIRONMENT}' == 'test'  set variable  citizen  ELSE IF  '${ENVIRONMENT}' == 'production'  set variable  citizen_live
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}  ${userType}
    #wait until page contains element  //a[@class='fa fa-home fa-3x']  20s

Check Page Error
    [Documentation]  Checks for the different errors and return error code
    ${errorCheck1}  Check Error Occurred
    ${errorCheck2}  Check Title Tag
    ${errorCheck3}  Check Resource Not Found
    return from keyword if  '${errorCheck1}' == '1'  1
    return from keyword if  '${errorCheck2}' == '2'  2
    return from keyword if  '${errorCheck3}' == '3'  3

Check Error Occurred
    [Documentation]  Checks for the page error
    ${errorStatus}  run keyword and return status  page should not contain  Sorry! An error
    return from keyword if  '${errorStatus}' == '${False}'  1

Check Title Tag
    [Documentation]  Checks for the title tag of the page
    ${title}=  get title
    ${titleStatus1}  run keyword and return status  should not be empty  ${title}
    ${titleStatus2}  run keyword and return status  should not be equal  ${title}  Index
    return from keyword if  '${titleStatus1}' == '${False}' or '${titleStatus2}' == '${False}'  2

Check Resource Not Found
    [Documentation]  Check resource not found error
    ${resourceStatus}  run keyword and return status  page should not contain  Resource not found
    return from keyword if  '${resourceStatus}' == '${False}'  3

Perform Permission Tests On Urls
    [Documentation]  Performs permission tests on the urls of given module
    [Arguments]  ${moduleName}  @{moduleUrls}
    #create file  ${ERRORFILE}
    FOR  ${url}  IN  @{moduleUrls}
    \   Run Keyword And Continue On Failure  Open ERP Page Without Permission  ${url}
    \   ${errorCheck}  Check Error Occurred  #if page has any other error do not report it
    \   ${result}  run keyword if  ${errorCheck} == None   Check Permissions
    \   run keyword if  ${result} == 4   Add Failed Url To The Fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url}  ${result}
    END
    #:FOR  ${url}  IN  @{moduleUrls}
    #\   Run Keyword And Continue On Failure  Open ERP Page Without Permission  ${url}
    #\   ${errorCheck}  Check Error Occurred  #if page has any other error do not report it
    #\   ${result}  run keyword if  ${errorCheck} == None   Check Permissions
    #\   run keyword if  ${result} == 4   Add Failed Url To The Fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url}  ${result}
    #Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}

Check Permissions
    [Documentation]  Checks that user have permission to view the page or not
    ${permissionStatus1}  run keyword and return status  page should contain  not authorized            ###"""Checks that page contains text "not authorized"
    ${permissionStatus2}  run keyword if  '${permissionStatus1}' == '${False}'  run keyword and return status  page should contain  not Authorized            ###"""Checks that page contains text "not Authorized"
    ${status}  set variable if  '${permissionStatus1}' == '${False}' and '${permissionStatus2}' == '${False}'  4
    return from keyword  ${status}