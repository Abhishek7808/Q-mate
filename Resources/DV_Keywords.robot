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
    [Documentation]  Opens salary disbursement page and matches the salaries in the paybills of diffrent units for a given salary cycle
    #SalaryDisbursementIndex.Set Variables
    ${retryCount}  SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}


Match Salary Disbursed Amount With The Report For A Unit
    [Documentation]  Opens salary disbursement page and matches the salaries in the paybills of given unit for a given salary cycle
    [Arguments]   ${unitID}
    #SalaryDisbursementIndex.Set Variables
    ${retryCount}  SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}


Match Travel Disbursed Amount With The Report For All Units
    # TravelExpencesDisbursement.Set Variables
    ${retryCount}  TravelExpencesDisbursement.Go To Travel Disbursement Index Page And Set Variables
    TravelExpencesDisbursement.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Travel Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    # TravelExpencesDisbursement.Set Variables
    ${retryCount}  TravelExpencesDisbursement.Go To Travel Disbursement Index Page And Set Variables
    TravelExpencesDisbursement.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}

Match Bonus Disbursed Amount With The Report For All Units
    # BonusDisbursementIndex.Set Variables
    ${retryCount}  BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Bonus Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    # BonusDisbursementIndex.Set Variables
    ${retryCount}  BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}

Match Honorarium Disbursed Amount With The Report For All Units
    # HonorariumDisbursementIndex.Set Variables
    ${retryCount}  HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Honorarium Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    #HonorariumDisbursementIndex.Set Variables
    ${retryCount}  HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}

Match Exgratia Disbursed Amount With The Report For All Units
    # ExgratiaDisbursementIndex.Set Variables
    ${retryCount}  ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Exgratia Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    # ExgratiaDisbursementIndex.Set Variables
    ${retryCount}  ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}

Match Arrear Disbursed Amount With The Report For All Units
    # ArrearDisbursementIndex.Set Variables
    ${retryCount}  ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Arrear Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    # ArrearDisbursementIndex.Set Variables
    ${retryCount}  ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}

Match Leave Encashment Disbursed Amount With The Report For All Units
    ${retryCount}  LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${retryCount}

Match Leave Encashment Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ${retryCount}  LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${retryCount}