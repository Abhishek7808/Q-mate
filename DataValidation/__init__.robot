*** Settings ***
Resource  ../Resources/Common_Keywords.robot

Suite Setup          Common_Keywords.Begin DV Testing
Suite Teardown       Common_Keywords.End DV Testing

Test Setup  Common_Keywords.Set DV Test Count