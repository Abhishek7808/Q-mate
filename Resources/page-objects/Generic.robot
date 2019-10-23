*** Variables ***
@{moduleUrls}
@{fatalErorrs}
${result}
*** Keywords ***

Get All Module Urls
    [Arguments]  ${muduleName}
    @{moduleUrls}  Filter Module Urls  ${muduleName}  ${URLS_JSON}
    return from keyword  @{moduleUrls}

# TODO: Add all error urls in a list and use Send All Errors keyword from ERP.py to send them.
Perform All Critical Generic Tests On Urls
    [Arguments]  ${moduleName}  @{moduleUrls}
    :FOR  ${url}  IN  @{moduleUrls}
    \   Open ERP Page  ${url}
    \   ${result}  Check page error
    \   run keyword if  ${result} == 1  Add Failed Url To The fatal Error List  ${url}:01
    \   ...    ELSE IF  ${result} == 2  Add Failed Url To The fatal Error List  ${url}:02
    Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}

Add Failed Url To The fatal Error List
    [Arguments]   ${url}
    append to list  ${fatalErorrs}  ${url}

Report Fatal Errors To Developers
     [Arguments]  ${moduleName}  @{fatalErorrs}
     log  ${fatalErorrs}
     run keyword and continue on failure  Send All Errors  ${moduleName}  @{fatalErorrs}

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
