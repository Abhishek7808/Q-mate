*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/DV_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Library   SeleniumLibrary


*** Variable ***
${ENVIRONMENT}    demo
${UNITID}        None  #9 Head office  :3
${CYCLEID}        None  #99
${FINANCIALYEAR}  20182019
${count}    0
${PAYBILLNO}   None
# robot -d Results --variable unitId:3 -i disbursementunit DataValidation


*** Test Cases ***
# TODO: Test is not ready to be tested on live remove all comments before running
Disbursed salary amount should match with the report amount for all units
    [Tags]  salarydisbursementallunits  Disbursement
    DV_Keywords.Match Salary Disbursed Amount With The Report For All Units

Disbursed travel amount should match with the report amount for all units
    [Tags]  travelexpencesdisbursementallunits   Disbursement
    DV_Keywords.Match Travel Expences Disbursed Amount With The Report For All Units

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
    [Tags]  salarydisbursementunit  salary  disbursementunit
    DV_Keywords.Match Salary Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed honorarium amount should match with the report amount for given unit
    [Tags]  honorariumdisbursementunit  honorarium  disbursementunit
    DV_Keywords.Match Honorarium Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed travel amount should match with the report amount for given unit
    [Tags]  travelexpencesdisbursementunit  travelexpences  disbursementunit
    DV_Keywords.Match Travel Expences Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed Bonus amount should match with the report amount for given unit
    [Tags]  bonusdisbursementunit  bonus  disbursementunit
    DV_Keywords.Match Bonus Disbursed Amount With The Report For A Unit   ${unitID}

Disbursed exgratia amount should match with the report amount for given unit
    [Tags]  exgratiadisbursementunit  exgratia  disbursementunit
    DV_Keywords.Match Exgratia Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed arrear amount should match with the report amount for given unit
    [Tags]  arreardisbursementunit  arrear  disbursementunit
    DV_Keywords.Match Arrear Disbursed Amount With The Report For A Unit  ${unitID}

Disbursed Leave Encashment amount should match with the report amount for given unit
    [Tags]  leaveEncashmentdisbursementunit  leaveEncashment  disbursementunit
    DV_Keywords.Match Leave Encashment Disbursed Amount With The Report For A Unit  ${unitID}




