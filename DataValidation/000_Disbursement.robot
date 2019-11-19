*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/DV_Keywords.robot
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
#robot -d Results -i disbursmentallunits DataValidation
*** Test Cases ***



Disbursed salary amount should match with the report amount for all units
    [Tags]  salarydisbursementallunits  Disbursement
    DV_Keywords.Match Salary Disbursed Amount With The Report For All Units

Disbursed travel amount should match with the report amount for all units
    [Tags]  traveldisbursmentallunits   Disbursement
    DV_Keywords.Match Travel Disbursed Amount With The Report For All Units

Disbursed bonus amount should match with the report amount for all units
    [Tags]  bonusdisbursementallunits  Disbursement
    DV_Keywords.Match Bonus Disbursed Amount With The Report For All Units

Disbursed honorarium amount should match with the report amount for all units
    [Tags]  honorariumdisbursementallunits  Disbursement
    DV_Keywords.Match Honorarium Disbursed Amount With The Report For All Units

Disbursed exgratia amount should match with the report amount for all units
    [Tags]  exgratiadisbursementallunits  Disbursement
    DV_Keywords.Match Exgratia Disbursed Amount With The Report For All Units

Disbursed arrear amount should match with the report amount for all units
    [Tags]  arreardisbursementallunits  Disbursement
    DV_Keywords.Match Arrear Disbursed Amount With The Report For All Units

Disbursed Leave Encashment amount should match with the report amount for all units
    [Tags]  LeaveEncashmentdisbursementallunits  Disbursement
    DV_Keywords.Match Leave Encashment Disbursed Amount With The Report For All Units


Disbursed salary amount should match with the report amount for given unit
    [Tags]  salarydisbursementunit  disbursementunit
    DV_Keywords.Match Salary Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed honorarium amount should match with the report amount for given unit
    [Tags]  honorariumdisbursementunit  disbursementunit
    DV_Keywords.Match Honorarium Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed travel amount should match with the report amount for given unit
    [Tags]  traveldisbursementunit  disbursementunit
    DV_Keywords.Match Travel Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed Bonus amount should match with the report amount for given unit
    [Tags]  bonusdisbursementunit  disbursementunit
    DV_Keywords.Match Bonus Disbursed Amount With The Report For A Unit   ${unitID}

Disbursed exgratia amount should match with the report amount for given unit
    [Tags]  exgratiadisbursementunit  disbursementunit
    DV_Keywords.Match Exgratia Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed arrear amount should match with the report amount for given unit
    [Tags]  arreardisbursementunit  disbursementunit
    DV_Keywords.Match Arrear Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed Leave Encashment amount should match with the report amount for given unit
    [Tags]  LeaveEncashmentdisbursementunit  disbursementunit
    DV_Keywords.Match Leave Encashment Disbursed Amount With The Report For A Unit  ${unitID}



