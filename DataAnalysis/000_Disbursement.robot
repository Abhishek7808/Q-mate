*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot
Resource  ${RESOURCES}/DA_Keywords.robot
Resource  ${DATA}/Login_Data.robot

*** Test Cases ***
Disbursed amount should match with the report amount for all units
    [Tags]  dataanalysis  disbursmentallunits
    DA_Keywords.Match Disbursed Amount With The Report For All Units


Disbured amount should match with the report amount for given unit
    [Tags]  dataanalysis  disbursmentunit
    DA_Keywords.Match Disbursed Amount With The Report For A Unit


