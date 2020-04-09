*** Variables ***
${SERVER}         demoprojects.e-connectsolutions.com/ERP-TEST
${Chrome PATH}    lib${/}selenium${/}webdriver${/}chrome${/}x86${/}chromedriver.exe
${DELAY}          0
${VALID USER}     econnect
${VALID PASSWORD}    admin
${LOGIN URL}      http://${SERVER}
${LOGIN FAILED URL}    http://${SERVER}
${DASHBOARD URL}    http://${SERVER}/Dashboard
${LOGIN TITLE}    E-Prashasan
${DASHBOARD TITLE}    RAJERP: Dashboard
${LOGIN INVALID MSG}    Invalid UserId or Password!
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms
