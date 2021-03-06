*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    page-objects/MIS/Ledgerlist.robot
Resource  ../Resources/page-objects/MIS/Monthreport.robot
Resource  ../Resources/page-objects/MIS/AnnexureCode.robot
Resource    page-objects/MIS/Ledgerlist.robot
Resource    page-objects/MIS/PayrollMIS.robot
Resource    page-objects/MIS/IncomeTax.robot
Resource    page-objects/MIS/GSTR1.robot
Resource    page-objects/MIS/Ledgerlist.robot
Resource    page-objects/MIS/PayrollMIS.robot
Resource    page-objects/MIS/IncomeTax.robot
Resource    page-objects/MIS/GSTR1.robot

*** Variables ***
${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-test
@{alldates}
${date_text}
${date}
${groupdata}     robot/Data/ERP_MIS/MIS.json

*** Keywords ***
Go to ERP
    [Documentation]  Open ERP Login page
    Ledgerlist.Logintoapp
    Ledgerlist.Load json


Verify Ledger Listing Report
    [Documentation]  Verify if Report contains any error
    Ledgerlist.check error

Go to Loginpage
    [Documentation]  Open ERP Login page
    Monthreport.Logintoapp
    Monthreport.Load json

Open ReportOfSalary
    [Documentation]  Open Monthly Salary Report page
    Monthreport.ViewSalary

Verify Salary Report
    [Documentation]  Verify if Salary Report contains any error
    Monthreport.VerifyReportOfSalary

Open ReportOfArrear
    [Documentation]  Open Monthly Arrear Report page
    Monthreport.ViewArrear

Verify ReportOfArrear
    [Documentation]  Verify if Arrear Report contains any error
    Monthreport.VerifyReportOfArrear

Open LeaveEncashment
    [Documentation]  Open LeaveEncashment Report page
    Monthreport.ViewLeaveEncashment

Verify LeaveEncashment
    [Documentation]  Verify if LeaveEncashment Report contains any error
    Monthreport.VerifyLeaveEncashment

Open Bonus
    [Documentation]  Open Bonus Report page
    Monthreport.ViewBonus

Verify Bonus
    [Documentation]  Verify if Bonus Report contains any error
    Monthreport.VerifyBonus


LoginForAnnexure
    [Documentation]  Open ERP Login page for Annexure report
    AnnexureCode.Logintoapp3
    AnnexureCode.Loadjson1

Open Annexure Report
    [Documentation]  Open Annexure Report
    AnnexureCode.OpenAnnexurepage

Verify Annexure Report
    [Documentation]  Verify if Annexure Report contains any error
    AnnexureCode.VerifyAnnexure

############################## PURVAI ##############################
Go to ERP 1
    [Documentation]  Open ERP Login page
    Ledgerlist.Logintoapp
    Ledgerlist.Load json

Open Ledger Listing Report
    [Documentation]  Open Ledger Listing report and select filter
    Ledgerlist.Ledgerlisting
    LedgerList.GetDate
    Ledgerlist.Viewbutton


Verify Report
    [Documentation]  Verify if Report contains any error
    Ledgerlist.check error

Login to ERP Page
    PayrollMIS.Logintoapp
    PayrollMIS.Load json

Salary Report
    PayrollMIS.Open Report
    PayrollMIS.Fill Salary Report
    PayrollMIS.View Button
    PayrollMIS.Verify Report

Arrear Report
    PayrollMIS.Open Report
    PayrollMIS.Fill Arrear Report
    PayrollMIS.View Button
    PayrollMIS.Verify Report

Leave Encashment Report
    PayrollMIS.Open Report
    PayrollMIS.Fill Leave Encashment Report
    PayrollMIS.View Button
    PayrollMIS.Verify Report

Go to ERP page
    IncomeTax.Logintoapp1
    IncomeTax.Load json1

Income Tax Report
    IncomeTax.Fill Report Filter

Verify Income Tax Report
    IncomeTax.Verify Report

GSTR1_Login_Window
    GSTR1.GSTR1_Login

Open GSTR1 Sales Report
    GSTR1.Open Report
    GSTR1.Fill GSTR1 Report

