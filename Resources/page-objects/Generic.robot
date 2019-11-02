*** Settings ***
Library  OperatingSystem
Library  ${LIBRARY}/Notifications.py


*** Variables ***
@{moduleUrls}
@{fatalErorrs}
${result}=  None


*** Keywords ***

Get All Module Urls
    [Arguments]  ${muduleName}
    @{moduleUrls}  Filter Module Urls  ${muduleName}  ${TEST_URLS}
    return from keyword  @{moduleUrls}

# TODO: Add all error urls in a list and use Send All Errors keyword from Notifications.py to send them.
Perform All Critical Generic Tests On Urls
    [Arguments]  ${moduleName}  @{moduleUrls}
#   create file  ${ERRORFILE}
    :FOR  ${url}  IN  @{moduleUrls}
    \   Open ERP Page  ${url}
    \   ${result}  Check Page Error
    \   run keyword unless  ${result} == None   Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},${result}
    Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}

Add Failed Url To The fatal Error List
    [Arguments]   ${url}
    Append To File  ${ERRORFILE}  ${url}\n

#Add Failed Url To The fatal Error List
#    [Arguments]   ${url}
#    append to list  ${fatalErorrs}  ${url}

Report Fatal Errors To Developers
     [Arguments]  ${moduleName}  @{fatalErorrs}
     #run keyword and continue on failure  Write Error Report  ${fatalErorrs}
     Send Error Email Notification  ${moduleName}  ${RECIEVERS_JSON}

Get Urls List Of Fatal Errors
    [Arguments]  ${fatalErorrs}
    return from keyword  ${fatalErorrs}

Open ERP Page
    [Arguments]  ${pageUrl}
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Open ERP Page Without Permission
    [Arguments]  ${pageUrl}
    ${userType}  set variable  citizen
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}  ${userType}

Check Page Error
    ${errorCheck1}  Check Error Occurred
    ${errorCheck2}  Check Title Tag
    return from keyword if  '${errorCheck1}' == '1'  1
    return from keyword if  '${errorCheck2}' == '2'  2

Check Error Occurred
    ${errorStatus}  run keyword and return status  page should not contain  Sorry! An error
    return from keyword if  '${errorStatus}' == '${False}'  1

Check Title Tag
    ${title}=  get title
    ${titleStatus1}  run keyword and return status  should not be empty  ${title}
    ${titleStatus2}  run keyword and return status  should not be equal  ${title}  Index
    return from keyword if  '${titleStatus1}' == '${False}' or '${titleStatus2}' == '${False}'  2

Perform Permission Tests On Urls
    [Arguments]  ${moduleName}  @{moduleUrls}
#   create file  ${ERRORFILE}
    :FOR  ${url}  IN  @{moduleUrls}
    \   Open ERP Page Without Permission  ${url}
    \   ${result}  Check Permissions
    \   run keyword unless  ${result} == None   Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},${result}
    Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}

Check Permissions
    ${permissionStatus}  run keyword and return status  page should contain  Sorry! You are not authorized to view this page.
    return from keyword if  '${permissionStatus}' == '${False}'  3