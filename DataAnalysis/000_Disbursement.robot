*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/DA_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Library    SeleniumLibrary


*** Variable ***
${ENVIRONMENT}    demo
${unitID}         None  #9 Head office  :3
${cycleID}        None
${financialYear}  20182019
${count}    0
#${salaryDisbursementIndex}  HRM/salaryDisbursment/SalayDisbursmentIndex
#${salaryColoumnText}  Net Amount
#${salaryDisTable}  xpath=//*[@id="EmpSalGrid"]
#${arrearDisbursementIndex}  HRM/ArrearDisbursement/ArrearDisbursementIndex
#${arrearColumnText}  Amount to be Disbursed
#${arrearDisTable}  xpath=//*[@id="EmpSalGrid"]
#${bonusDisbursement}  HRM/HonorariumDisbursement/BonusDisbursementIndex
#${bonusColumnText}  Net Amount
#${bonusDisTable}  xpath=//*[@id="EmpSalGrid"]
#${honorariumDisbursement}  HRM/HonorariumDisbursement
#${honorariumColumnText}  Net Amount
#${honorariumDisTable}  xpath=//*[@id="EmpSalGrid"]
#${exGratiaDisbursement}  HRM/exgratiadisbursement/ExGratiaDisbursementIndex
#${exGratiaColumnText}  ExGratia Amount
#${exGratiaDisTable}  xpath=//*[@id="EmpSalGrid"]
#robot -d Results -i disbursmentallunits DataAnalysis
*** Test Cases ***
Disbursed amount should match with the report amount for all units
    [Tags]  dataanalysis  disbursementallunits
    DA_Keywords.Match Salary Disbursed Amount With The Report For All Units
    DA_Keywords.Match Travel Disbursed Amount With The Report For All Units
    DA_Keywords.Match Bonus Disbursed Amount With The Report For All Units
    DA_Keywords.Match Honorarium Disbursed Amount With The Report For All Units
    DA_Keywords.Match Exgratia Disbursed Amount With The Report For All Units
    DA_Keywords.Match Arrear Disbursed Amount With The Report For All Units


Disbured amount should match with the report amount for given unit
    [Tags]  dataanalysis  disbursementunit
    DA_Keywords.Match Salary Disbursed Amount With The Report For A Unit  ${unitID}
    DA_Keywords.Match Honorarium Disbursed Amount With The Report For A Unit  ${unitID}
    DA_Keywords.Match Travel Disbursed Amount With The Report For A Unit  ${unitID}
    DA_Keywords.Match Bonus Disbursed Amount With The Report For A Unit   ${unitID}
    DA_Keywords.Match Exgratia Disbursed Amount With The Report For A Unit  ${unitID}
    DA_Keywords.Match Arrear Disbursed Amount With The Report For A Unit  ${unitID}



