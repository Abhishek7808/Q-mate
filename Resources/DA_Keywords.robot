*** Settings ***
Resource    ../Configuration.resource
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
Resource  ${PAGE OBJECTS}/NavigationHelper.robot
*** Variables ***
${unit}  None

*** Keywords ***
Match Disbursed Amount With The Report For All Units
    DisbursementIndex.Go To Disbursement Index Page
    DisbursementIndex.Match All Paybills Net Amounts With Reports For All Units

Match Disbursed Amount With The Report For A Unit
    DisbursementIndex.Go To Disbursement Index Page
    DisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitName}