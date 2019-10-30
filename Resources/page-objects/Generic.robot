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
    ${File}  Create Error Report
    :FOR  ${url}  IN  @{moduleUrls}
    \   Open ERP Page  ${url}
    \   ${result}  Check page error
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    \   run keyword unless  ${result} == None   Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},${result}
    Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}
=======
    \   run keyword if  ${result} == 1  Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},01  ELSE IF  ${result} == 2  Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},02

>>>>>>> Stashed changes
=======
    \   run keyword if  ${result} == 1  Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},01  ELSE IF  ${result} == 2  Add Failed Url To The fatal Error List  ${BASE_URL.${ENVIRONMENT}}/${url},02

>>>>>>> Stashed changes


Add Failed Url To The fatal Error List
    [Arguments]   ${url}
    append to list  ${fatalErorrs}  ${url}

Report Fatal Errors To Developers
     [Arguments]  ${moduleName}  @{fatalErorrs}
     run keyword and continue on failure  Write Error Report  ${fatalErorrs}
     @{moduleErrorList}  Filter Module Error Url  ${moduleName}
     ${errorReport}  Compose Error Message  ${moduleName}  ${moduleErrorList}
     Send Email  ianubhavverma@gmail.com  ${moduleName} Error Report  ${errorReport}


Get Urls List Of Fatal Errors
    [Arguments]  ${fatalErorrs}
    return from keyword  ${fatalErorrs}

Open ERP Page
    [Arguments]  ${pageUrl}
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Check page error
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
