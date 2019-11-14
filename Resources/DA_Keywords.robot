*** Settings ***
Resource    ../Configuration.resource
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ${PAGE OBJECTS}${/}${FA.name}/DisbursementIndex.robot
Resource  ${PAGE OBJECTS}/NavigationHelper.robot
*** Variables ***
${unitName}  None

*** Keywords ***
Match Disbursed Amount With The Report For All Units
    [Documentation]  Opens salary disbursement page and matches the salaries in the paybills of diffrent units for a given salary cycle
    ${testCount}  DisbursementIndex.Go To Disbursement Index Page
    DisbursementIndex.Match All Paybills Net Amounts With Reports For All Units  ${testCount}

Match Disbursed Amount With The Report For A Unit
    [Documentation]  Opens salary disbursement page and matches the salaries in the paybills of given unit for a given salary cycle
    [Arguments]  ${unitID}
    ${testCount}  DisbursementIndex.Go To Disbursement Index Page
    DisbursementIndex.Match All Paybills Net Amount With The Report For Given Unit  ${unitID}  ${testCount}