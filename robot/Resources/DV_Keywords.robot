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
    [Documentation]  Opens salary disbursement index page, For each paybill opens report page and disbursement page, matches salary amount for each employee. Repeats this process for each unit.
    SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Salary Disbursed Amount With The Report For A Unit
    [Documentation]  Opens salary disbursement index page, For each paybill opens report page and disbursement page, matches salary amount for each employee. Unit is given from command line.
    SalaryDisbursementIndex.Go To Salary Disbursement Index Page And Set Variables
    SalaryDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Travel Expences Disbursed Amount With The Report For All Units
    [Documentation]  Opens travel expences disbursement index page, For each paybill opens report page and disbursement page, matches travel expences amount for each employee. Repeats this process for each unit.
    TravelExpencesDisbursementIndex.Go To Travel Expences Disbursement Index Page And Set Variables
    TravelExpencesDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Travel Expences Disbursed Amount With The Report For A Unit
    [Documentation]  Opens travel expences disbursement index page, For each paybill opens report page and disbursement page, matches travel expences amount for each employee. Unit is given from command line.
    TravelExpencesDisbursementIndex.Go To Travel Expences Disbursement Index Page And Set Variables
    TravelExpencesDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Bonus Disbursed Amount With The Report For All Units
    [Documentation]  Opens bonus disbursement index page, For each paybill opens report page and disbursement page, matches bonus amount for each employee. Repeats this process for each unit.
    BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Bonus Disbursed Amount With The Report For A Unit
    [Documentation]  Opens bonus disbursement index page, For each paybill opens report page and disbursement page, matches bonus amount for each employee. Unit is given from command line.
    BonusDisbursementIndex.Go To Bonus Disbursement Index Page And Set Variables
    BonusDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Honorarium Disbursed Amount With The Report For All Units
    [Documentation]  Opens honorarium disbursement index page, For each paybill opens report page and disbursement page, matches honorarium amount for each employee. Repeats this process for each unit.
    HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Honorarium Disbursed Amount With The Report For A Unit
    [Documentation]  Opens honorarium disbursement index page, For each paybill opens report page and disbursement page, matches honorarium amount for each employee. Unit is given from command line.
    HonorariumDisbursementIndex.Go To Honorarium Disbursement Index Page And Set Variables
    HonorariumDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Exgratia Disbursed Amount With The Report For All Units
    [Documentation]  Opens exgratia disbursement index page, For each paybill opens report page and disbursement page, matches exgratia amount for each employee. Repeats this process for each unit.
    ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Exgratia Disbursed Amount With The Report For A Unit
    [Documentation]  Opens exgratia disbursement index page, For each paybill opens report page and disbursement page, matches exgratia amount for each employee. Unit is given from command line.
    ExgratiaDisbursementIndex.Go To Exgratia Disbursement Index Page And Set Variables
    ExgratiaDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Arrear Disbursed Amount With The Report For All Units
    [Documentation]  Opens arrear disbursement index page, For each paybill opens report page and disbursement page, matches arrear amount for each employee. Repeats this process for each unit.
    ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Arrear Disbursed Amount With The Report For A Unit
    [Documentation]  Opens arrear disbursement index page, For each paybill opens report page and disbursement page, matches arrear amount for each employee. Unit is given from command line.
    ArrearDisbursementIndex.Go To Arrear Disbursement Index Page And Set Variables
    ArrearDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit

Match Leave Encashment Disbursed Amount With The Report For All Units
    [Documentation]  Opens leave encashment disbursement index page, For each paybill opens report page and disbursement page, matches leave encashment amount for each employee. Repeats this process for each unit.
    LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Leave Encashment Disbursed Amount With The Report For A Unit
    [Documentation]  Opens leave encashment disbursement index page, For each paybill opens report page and disbursement page, matches leave encashment amount for each employee. Unit is given from command line.
    LeaveEncashmentDisbursementIndex.Go To Leave Encashment Disbursement Index Page And Set Variables
    LeaveEncashmentDisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit