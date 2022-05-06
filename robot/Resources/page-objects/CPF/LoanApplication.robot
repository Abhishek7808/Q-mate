*** Variables ***
${pageUrl}  CPF/LoanApplication

*** Keywords ***
Go To Loan Application Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/CPF/LoanApplication

Open Detail File
    ${loanDataFile}  get file    ${LOAN_APPLICATIONS_FILE}
    @{lines}    split to lines  ${loanDataFile}
    log  ${lines}
    FOR  ${line}  IN    @{lines}
    \   @{contents}  split string  ${line}  |
    \   log to console  ${contents}[1]
    \   ${employeeID}  set variable  ${contents}[0]
    \   ${loanID}  set variable  ${contents}[1]
    \   ${str}  Catenate  SEPARATOR=   ${BASE_URL.${ENVIRONMENT}}/CPF/RegisteredBenificiary/deleteduplicateloanbyexcel?loanid=  ${contents}[0]  &employeeid=  ${contents}[1]  &trustorgid=200
    \   log to console  ${str}
    \   Go To ERP Page  ${str}
