*** Settings ***
Resource    ../Configuration.resource
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/ArrearDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/TravelExpencesDisbursement.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/SalaryDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/ExgratiaDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/HonorariumDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/BonusDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/LeaveEncashmentDisbursementIndex.robot

Resource  ${PAGE OBJECTS}/NavigationHelper.robot

*** Variables ***
${unitName}  None
${disbursementUrl}  None

*** Keywords ***
Match Salary Disbursed Amount With The Report For All Units
    ${retryCount}  SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Salary Disbursed Amount With The Report For A Unit
    [Arguments]   ${unitID}
    ${retryCount}  SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}

Match Travel Disbursed Amount With The Report For All Units
    ${retryCount}  TravelExpencesDisbursement.Go To Travel Disbursement Index Page And Set Variables
    TravelExpencesDisbursement.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Travel Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  TravelExpencesDisbursement.Go To Travel Disbursement Index Page And Set Variables
    TravelExpencesDisbursement.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}

Match Bonus Disbursed Amount With The Report For All Units
    ${retryCount}  BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Bonus Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}

Match Honorarium Disbursed Amount With The Report For All Units
    ${retryCount}  HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Honorarium Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}

Match Exgratia Disbursed Amount With The Report For All Units
    ${retryCount}  ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Exgratia Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}

Match Arrear Disbursed Amount With The Report For All Units
    ${retryCount}  ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Arrear Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}

Match Leave Encashment Disbursed Amount With The Report For All Units
    ${retryCount}  LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Leave Encashment Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${UNITID}  ${retryCount}