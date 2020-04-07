*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/DV_Keywords.robot
Resource  ${DATA}/Login_Data.robot
Library   SeleniumLibrary


*** Variable ***
${ENVIRONMENT}    demo
${UNITID}        None  # Head office  :3
${CYCLEID}        None  #99
${FINANCIALYEAR}  20182019
${retryCount}    0
${PAYBILLNO}   None
# robot -d Results --variable unitId:3 -i disbursementunit DataValidation


*** Test Cases ***
# TODO: Test is not ready to be tested on live remove all comments before running
Disbursed salary amount should match with the report amount for all units
    [Documentation]  Matches disbursed salary amount with report amount for all units, reports error if amount is not matched.
    [Tags]  salarydisbursementallunits  Disbursement
    DV_Keywords.Match Salary Disbursed Amount With The Report For All Units

Disbursed travel amount should match with the report amount for all units
    [Documentation]  Matches disbursed travel expences amount with report amount for all units, reports error if amount is not matched.
    [Tags]  travelexpencesdisbursementallunits   Disbursement
    DV_Keywords.Match Travel Expences Disbursed Amount With The Report For All Units

Disbursed bonus amount should match with the report amount for all units
    [Documentation]  Matches disbursed bonus amount with report amount for all units, reports error if amount is not matched.
    [Tags]  bonusdisbursementallunits  Disbursement
    DV_Keywords.Match Bonus Disbursed Amount With The Report For All Units

Disbursed honorarium amount should match with the report amount for all units
    [Documentation]  Matches disbursed honorarium amount with report amount for all units, reports error if amount is not matched.
    [Tags]  honorariumdisbursementallunits  Disbursement
    DV_Keywords.Match Honorarium Disbursed Amount With The Report For All Units

Disbursed exgratia amount should match with the report amount for all units
    [Documentation]  Matches disbursed exgratia amount with report amount for all units, reports error if amount is not matched.
    [Tags]  exgratiadisbursementallunits  Disbursement
    DV_Keywords.Match Exgratia Disbursed Amount With The Report For All Units

Disbursed arrear amount should match with the report amount for all units
    [Documentation]  Matches disbursed arrear amount with report amount for all units, reports error if amount is not matched.
    [Tags]  arreardisbursementallunits  Disbursement
    DV_Keywords.Match Arrear Disbursed Amount With The Report For All Units

Disbursed Leave Encashment amount should match with the report amount for all units
    [Documentation]  Matches disbursed leave encashment amount with report amount for all units, reports error if amount is not matched.
    [Tags]  leaveEncashmentdisbursementallunits  Disbursement
    DV_Keywords.Match Leave Encashment Disbursed Amount With The Report For All Units


Disbursed salary amount should match with the report amount for given unit
    [Documentation]  Matches disbursed salary amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  salarydisbursementunit  salary  disbursementunit
    DV_Keywords.Match Salary Disbursed Amount With The Report For A Unit

Disbursed honorarium amount should match with the report amount for given unit
    [Documentation]  Matches disbursed honorarium amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  honorariumdisbursementunit  honorarium  disbursementunit
    DV_Keywords.Match Honorarium Disbursed Amount With The Report For A Unit

Disbursed travel amount should match with the report amount for given unit
    [Documentation]  Matches disbursed travel expences amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  travelexpencesdisbursementunit  travelexpences  disbursementunit
    DV_Keywords.Match Travel Expences Disbursed Amount With The Report For A Unit

Disbursed Bonus amount should match with the report amount for given unit
    [Documentation]  Matches disbursed bonus amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  bonusdisbursementunit  bonus  disbursementunit
    DV_Keywords.Match Bonus Disbursed Amount With The Report For A Unit

Disbursed exgratia amount should match with the report amount for given unit
    [Documentation]  Matches disbursed exgratia amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  exgratiadisbursementunit  exgratia  disbursementunit
    DV_Keywords.Match Exgratia Disbursed Amount With The Report For A Unit

Disbursed arrear amount should match with the report amount for given unit
    [Documentation]  Matches disbursed arrear amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  arreardisbursementunit  arrear  disbursementunit
    DV_Keywords.Match Arrear Disbursed Amount With The Report For A Unit

Disbursed Leave Encashment amount should match with the report amount for given unit
    [Documentation]  Matches disbursed leave encashmnent amount with report amount for given unit, reports error if amount is not matched.
    [Tags]  leaveEncashmentdisbursementunit  leaveEncashment  disbursementunit
    DV_Keywords.Match Leave Encashment Disbursed Amount With The Report For A Unit




