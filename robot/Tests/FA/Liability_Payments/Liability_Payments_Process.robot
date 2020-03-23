*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}ACC_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot
Library           ${LIBRARY}${/}Addendums.py
Library           DateTime

*** Variables ***

#robot -d robot/Results --variable BROWSER:chrome --variable ENVIRONMENT:stg --variable LOGIN:stg --variable PAYGROUP:"Zonal Chief Engineer (JZ),Jaipur Technical Staff" --variable EMPLOYEECODE: -i liabilitypayments robot/Tests


${EMPLOYEECODE}  (1097) - Qmate ${SPACE}56
${PAYGROUP}  Zonal Chief Engineer (JZ),Jaipur Technical Staff
${SALARYFINANCIALYEAR}  20192020           #20172018
${SALARYCYCLE}  None          #58
${NUMBER_OF_EMPLOYEES}  ${1}
#${PAYGROUP}  select
${PAYMENTUNIT}  Bharatpur Zone
${PAYSLIPUNIT}  head office
${DESIGNATION}  None
${DIVISION}  None
${ISGAZETTED}  None
@{DISBURSEMENT_PAYGROUPS}    Select all
@{DISBURSEMENT_PAYBILLS}    1021/2019-2020
${latestPaybillCreated}  1021/2019-2020
${EMPLOYEELOCATION}  Select all

*** Test Cases ***
Admin should able to add third party deduction
    [Documentation]  Fills third party deduction form.
    [Tags]  acc  liabilitypayments  thirdpartydeduction
    Common_Keywords.Set Test Data  ${configData["Third_Party_Deduction"]}
    ACC_Keywords.Open Third Party Deduction Page
    ACC_Keywords.Add New Third Party Deduction  ${dataDictionary}  ${EMPLOYEECODE}

Admin should able to disburse the salary of the selected employee.
    [Documentation]  Selects an employee and process his/her salary.
    [Tags]  acc  liabilitypayments  Salarydisbursement
    Common_Keywords.Set Test Data  ${configData["Mark_Attendance"]}
    HRMS_Keywords.Open Manual Attendance Page
    HRMS_Keywords.Set Mark Attendance Criteria  ${dataDictionary}  ${PAYGROUP}
    HRMS_Keywords.Mark Attendance Of Given Employee  ${EMPLOYEECODE}
    HRMS_Keywords.Apply Filters For Marked Attendance  Submitted  ${PAYGROUP}
    HRMS_Keywords.Verify Marked Attendance  ${dataDictionary["Filters"]}  ${PAYGROUP}
    HRMS_Keywords.Apply Filters For Marked Attendance  Verified  ${PAYGROUP}
    HRMS_Keywords.Approve Marked Attendance  ${PAYGROUP}
    run  robot -d robot/results --variable BROWSER:${BROWSER} --variable ENVIRONMENT:${ENVIRONMENT} --variable LOGIN:${LOGIN} --variable PAYGROUP:"${PAYGROUP}" -i salaryprocesscheck -i Addpaybillcheck -i AddDisbursementcheck robot/Tests

Admin should able to add Liability payments
    [Documentation]  Adds Liability payments details for an employee.
    [Tags]  acc  liabilitypayments  addLiability
    Common_Keywords.Set Test Data  ${configData["Add_Liability_Payment"]}
    ACC_Keywords.Open Liability Payments Page
    ACC_Keywords.Add Liability Payment  ${dataDictionary}  ${EMPLOYEECODE}

Admin should able to edit draft entries
    [Documentation]  Edits draft entries of liability payments.
    [Tags]  acc  liabilitypayments  draftentries  editdata
    Common_Keywords.Set Test Data  ${configData["Add_Liability_Payment"]}
    ACC_Keywords.Open Liability Payments Page
    ACC_Keywords.Set Liability Payments Filters  ${dataDictionary}  Draft
    ACC_Keywords.Edit Draft Entry

Admin should able to delete draft entries
    [Documentation]  Deletes draft entries of liability payments.
    [Tags]  acc  liabilitypayments  draftentries  deletedata
    Common_Keywords.Set Test Data  ${configData["Add_Liability_Payment"]}
    ACC_Keywords.Open Liability Payments Page
    ACC_Keywords.Set Liability Payments Filters  ${dataDictionary}  Draft
    ACC_Keywords.Delete Draft Entry

Admin should able to generate payment
    [Documentation]  Adds liability payment entry again and generates payment.
    [Tags]  acc  liabilitypayments  generatepayment
    Common_Keywords.Set Test Data  ${configData["Add_Liability_Payment"]}
    #ACC_Keywords.Open Liability Payments Page
    #ACC_Keywords.Add Liability Payment  ${dataDictionary}  ${EMPLOYEECODE}
    ACC_Keywords.Open Liability Payments Page
    ACC_Keywords.Set Liability Payments Filters  ${dataDictionary}  Draft
    ACC_Keywords.Generate Payment  ${EMPLOYEECODE}

#Admin should able to add Liability payments
#    [Documentation]  Adds Liability payments details for an employee.
#    [Tags]  acc  liabilitypayments  addLiability
#    Common_Keywords.Set Test Data  ${configData["Add_Liability_Payment"]}
#    ACC_Keywords.Open Liability Payments Page
#    ACC_Keywords.Add Liability Payment  ${dataDictionary}  ${EMPLOYEECODE}
