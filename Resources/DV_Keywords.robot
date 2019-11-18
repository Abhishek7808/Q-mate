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
# TODO: Remove if not used anywhere
Resource  ${PAGE OBJECTS}/NavigationHelper.robot

*** Variables ***
${unitName}  None

*** Keywords ***
Match Salary Disbursed Amount With The Report For All Units
    [Documentation]  Opens salary disbursement page and matches the salaries in the paybills of diffrent units for a given salary cycle
    SalaryDisbursementIndex.Set Variables
    ${testCount}  SalaryDisbursementIndex.Go To Salary Disbursement Index Page
    SalaryDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${testCount}


Match Salary Disbursed Amount With The Report For A Unit
    [Documentation]  Opens salary disbursement page and matches the salaries in the paybills of given unit for a given salary cycle
    [Arguments]   ${unitID}
    SalaryDisbursementIndex.Set Variables
    ${testCount}  SalaryDisbursementIndex.Go To Salary Disbursement Index Page
    SalaryDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}


Match Travel Disbursed Amount With The Report For All Units
    TravelExpencesDisbursement.Set Variables
    ${testCount}  TravelExpencesDisbursement.Go To Travel Disbursement Index Page
    TravelExpencesDisbursement.Match All Paybills Net Amounts With Reports For All Units  ${testCount}

Match Travel Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    TravelExpencesDisbursement.Set Variables
    ${testCount}  TravelExpencesDisbursement.Go To Travel Disbursement Index Page
    TravelExpencesDisbursement.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}

Match Bonus Disbursed Amount With The Report For All Units
    BonusDisbursementIndex.Set Variables
    ${testCount}  BonusDisbursementIndex.Go To Bonus Disbursement Index Page
    BonusDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${testCount}

Match Bonus Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    BonusDisbursementIndex.Set Variables
    ${testCount}  BonusDisbursementIndex.Go To Bonus Disbursement Index Page
    BonusDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}

Match Honorarium Disbursed Amount With The Report For All Units
    HonorariumDisbursementIndex.Set Variables
    ${testCount}  HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page
    HonorariumDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${testCount}

Match Honorarium Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    HonorariumDisbursementIndex.Set Variables
    ${testCount}  HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page
    HonorariumDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}

Match Exgratia Disbursed Amount With The Report For All Units
    ExgratiaDisbursementIndex.Set Variables
    ${testCount}  ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page
    ExgratiaDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${testCount}

Match Exgratia Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ExgratiaDisbursementIndex.Set Variables
    ${testCount}  ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page
    ExgratiaDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}

Match Arrear Disbursed Amount With The Report For All Units
    ArrearDisbursementIndex.Set Variables
    ${testCount}  ArrearDisbursementIndex.Go To Arrear Disbursement Index Page
    ArrearDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${testCount}

Match Arrear Disbursed Amount With The Report For A Unit
    [Arguments]  ${unitID}
    ArrearDisbursementIndex.Set Variables
    ${testCount}  ArrearDisbursementIndex.Go To Arrear Disbursement Index Page
    ArrearDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}

