*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/DV_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Library    SeleniumLibrary

Suite Teardown  DisbursementIndex.Send Disbursement Test Report To Developers

*** Variable ***
${ENVIRONMENT}    demo
${unitID}         None  #9 Head office  :3
${cycleID}        None  #99
${financialYear}  20182019
#${dateFrom}  01012017
#${dateTo}
${count}    0
# robot -d Results --variable unitId:3 -i disbursementunit DataValidation


*** Test Cases ***

Disbursed salary amount should match with the report amount for all units
    [Tags]  salarydisbursementallunits  Disbursement
    DV_Keywords.Match Salary Disbursed Amount With The Report For All Units

Disbursed travel amount should match with the report amount for all units
    [Tags]  traveldisbursementallunits   Disbursement
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
    [Tags]  leaveEncashmentdisbursementallunits  Disbursement
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
    [Tags]  leaveEncashmentdisbursementunit  disbursementunit
    DV_Keywords.Match Leave Encashment Disbursed Amount With The Report For A Unit  ${unitID}



