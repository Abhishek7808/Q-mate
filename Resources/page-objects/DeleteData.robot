*** Settings ***
Documentation    Suite description

*** Keywords ***

Delete Data Of Company
    [Arguments]    ${panNo}
    Create Session     ERP DEMO    http://demoprojects.e-connectsolutions.com/erp-demo/
    ${dict}    Get Request    ERP DEMO    api/Login/Validate?loginId=vinodrsmml&password=21232F297A57A5A743894A0E4A801FC3&ipAddress=191.11.100.148
    Log    ${dict.status_code} ${dict.json()}
    ${dict2}    Set Variable    ${dict.json()}
    ${dict1}    Create_Dictionary    AuthKey=${dict2["AuthKey"]}    AuthId=${dict2["AuthId"]}
    Log    ${dict1}
    ${Resp}    Get Request    ERP DEMO    api/Common/ErasePanNumberData?panNo=${panNo}    headers=${dict1}
    run keyword and ignore error  Should Be Equal As Strings    ${Resp.status_code}    200

Delete Data Of SSOID
    [Arguments]    ${ssoId}
    Create Session    ERP DEMO    http://demoprojects.e-connectsolutions.com/erp-demo/
    ${dict}    Get Request    ERP DEMO    api/Login/Validate?loginId=vinodrsmml&password=21232F297A57A5A743894A0E4A801FC3&ipAddress=191.11.100.148
    Log    ${dict.status_code} ${dict.json()}
    ${dict2}    Set Variable    ${dict.json()}
    ${dict1}    Create_Dictionary    AuthKey=${dict2["AuthKey"]}    AuthId=${dict2["AuthId"]}
    Log    ${dict1}
    ${Resp}    Get Request    ERP DEMO    api/Common/EraseSalesSSOData?ssoId=${ssoId}    headers=${dict1}
    run keyword and continue on failure  Should Be Equal As Strings    ${Resp.status_code}    200

