*** Settings ***
Resource    ../Configuration.resource
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/ArrearDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/TravelExpencesDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/SalaryDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/ExgratiaDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/HonorariumDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/BonusDisbursementIndex.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/LeaveEncashmentDisbursementIndex.robot
Resource  ${PAGE OBJECTS}/NavigationHelper.robot

*** Keywords ***

Match Salary Disbursed Amount With The Report For All Units
    SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Salary Disbursed Amount With The Report For A Unit
    SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Travel Expences Disbursed Amount With The Report For All Units
    TravelExpencesDisbursementIndex.Go To Travel Expences Disbursement Index Page And Set Variables
    TravelExpencesDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Travel Expences Disbursed Amount With The Report For A Unit
    TravelExpencesDisbursementIndex.Go To Travel Expences Disbursement Index Page And Set Variables
    TravelExpencesDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Bonus Disbursed Amount With The Report For All Units
    BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Bonus Disbursed Amount With The Report For A Unit
    BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Honorarium Disbursed Amount With The Report For All Units
    HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Honorarium Disbursed Amount With The Report For A Unit
    HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Exgratia Disbursed Amount With The Report For All Units
    ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Exgratia Disbursed Amount With The Report For A Unit
    ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Arrear Disbursed Amount With The Report For All Units
    ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Arrear Disbursed Amount With The Report For A Unit
    ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Leave Encashment Disbursed Amount With The Report For All Units
    LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Leave Encashment Disbursed Amount With The Report For A Unit
    LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit