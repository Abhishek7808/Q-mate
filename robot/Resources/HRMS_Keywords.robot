*** Settings ***
Resource  ${PAGE OBJECTS}/HRMS/PostClass.robot
#Resource  ${PAGE OBJECTS}/LeftNavigation.robot
Resource  ${PAGE OBJECTS}/TopNavigation.robot
Resource  ./ERP_Keywords.robot
Resource  ${PAGE OBJECTS}/HRMS/EntertainmentDeclaration.robot
Resource  ${PAGE OBJECTS}/HRMS/EnquiryDecision.robot
Resource  ${PAGE OBJECTS}/HRMS/DeputationDepartment.robot
Resource  ${PAGE OBJECTS}/HRMS/Division.robot
Resource  ${PAGE OBJECTS}/HRMS/Designation.robot
Resource  ${PAGE OBJECTS}/HRMS/HospitalEmpanelment.robot
Resource  ${PAGE OBJECTS}/HRMS/Qualification.robot
Resource  ${PAGE OBJECTS}/HRMS/EmpanelledOfficer.robot
Resource  ${PAGE OBJECTS}/HRMS/CadreDetail.robot
Resource  ${PAGE OBJECTS}/HRMS/PaymentType.robot
Resource  ${PAGE OBJECTS}/HRMS/Department.robot
Resource  ${PAGE OBJECTS}/HRMS/Section.robot
Resource  ${PAGE OBJECTS}/HRMS/TADAgrade.robot
Resource  ${PAGE OBJECTS}/HRMS/GradeDependancy.robot
Resource  ${PAGE OBJECTS}/HRMS/TADARule.robot
Resource  ${PAGE OBJECTS}/HRMS/PaySlipConfiguration.robot
Resource  ${PAGE OBJECTS}/HRMS/SelfVarification.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryCycle.robot
Resource  ${PAGE OBJECTS}/HRMS/ManualAttendance.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryDetail.robot
Resource  ${PAGE OBJECTS}/HRMS/SalaryPaybill.robot

*** Variables ***
${employeeStatus}  status
*** Keywords ***
Open Post Class Page
    PostClass.Go To ERP Page Post Class Page

#Add New Class
#    PostClass.Click Add New Post Class
#
#Fill Post Class Details
#    [Arguments]  ${Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
#    PostClass.Fill Post Class Name  ${Post_Class_Name}
#    PostClass.Select Class Group  ${Class_Group}
#    PostClass.Fill Seniority Level  ${Seniority_Level}
#
#Check Post Class Entry
#    [Arguments]  ${Post_Class_Name}
#    PostClass.Check Post Class Is Added  ${Post_Class_Name}
#
#Update The Added Post Class Element
#    [Arguments]  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
#    PostClass.Get Number of Rows of Post Class Table
#    PostClass.Update The Post Class Entry  ${New_Post_Class_Name}  ${Seniority_Level}  ${Class_Group}
#    Check Post Class Entry  ${New_Post_Class_Name}
#
#Delete The Added Post Class Element
#    [Arguments]  ${New_Post_Class_Name}
#    PostClass.Get Number of Rows of Post Class Table
#    PostClass.Delete The Post Class Entry
#    PostClass.Verify The Deleted Element  ${New_Post_Class_Name}
    #Check Post Class Entry  ${New_Post_Class_Name}

Add New Post Class
    [Arguments]  ${dataDictionary}
    PostClass.Click Add New Post Class Button  ${dataDictionary}
    PostClass.Fill Post Class Details  ${dataDictionary}
    PostClass.Submit Details  ${dataDictionary}

Filter Post Classes By Class Group
    [Arguments]  ${dataDictionary}  ${value}
    PostClass.Click On Filter Button  ${dataDictionary}
    PostClass.Select Type In Dropdown  ${dataDictionary}  ${value}
    PostClass.Apply Filter  ${dataDictionary}

Search Post Class By Name
    [Arguments]  ${dataDictionary}  ${value}
    PostClass.Search Post Class  ${dataDictionary}  ${value}

Update Post Class Details
    [Arguments]  ${dataDictionary}
    PostClass.Click On Update Button  ${dataDictionary}
    PostClass.Fill Post Class Details  ${dataDictionary["Update Post Class"]}
    PostClass.Submit Details  ${dataDictionary}

Delete Post Class
    [Arguments]  ${dataDictionary}
    PostClass.Click On Delete Button  ${dataDictionary}
    PostClass.Confirm Delete Entry Popup Appeared
    PostClass.Delete Selected Entry  ${dataDictionary}

Open Entertainment Declaration Page
    EntertainmentDeclaration.Go To Entertainment Declaration Page

Declare Tea Rate Definition
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Declare Button  ${dataDictionary}
    EntertainmentDeclaration.Fill Entertainment Declaration Details  ${dataDictionary}
    EntertainmentDeclaration.Submit Details  ${dataDictionary}

Search Tea Rate Definition
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Search Tea Rate Definition In Entertainment Declaration Table  ${dataDictionary}

Apply Tea Rate Filter
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Filter  ${dataDictionary}
    EntertainmentDeclaration.Select Type In Dropdown  ${dataDictionary}
    EntertainmentDeclaration.Apply Filter  ${dataDictionary}

Edit Tea Rate Definition
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Edit Button  ${dataDictionary}
    EntertainmentDeclaration.Fill Entertainment Declaration Details  ${dataDictionary["Edit Tea Rate Definition"]}
    EntertainmentDeclaration.Submit Details  ${dataDictionary}

Delete Tea Rate Definition
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Click On Delete Button  ${dataDictionary}
    EntertainmentDeclaration.Confirm Delete Entry Popup Appeared
    EntertainmentDeclaration.Delete Selected Entry  ${dataDictionary}

Verify Tea Rate Entry
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Check For The New Entry In Entertainment Declaration Table  ${dataDictionary}

Verify Tea Rate Deletion
    [Arguments]  ${dataDictionary}
    EntertainmentDeclaration.Check For The Deletion In Entertainment Declaration Table  ${dataDictionary}

Verify Post Class Creation
    [Arguments]  ${dataDictionary}
    PostClass.Check For The Post Class Entry In The Post Class Table  ${dataDictionary}

Verify Post Class deletion
    [Arguments]  ${dataDictionary}
    PostClass.Check For The Post Class Entry In The Post Class Table  ${dataDictionary}

Open Enquiry Decision Page
    EnquiryDecision.Go To Enquiry Decision Page

Add New Enquiry Decision Type
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Click On Add New Button  ${dataDictionary}
    EnquiryDecision.Fill Enquiry Decision Details  ${dataDictionary}
    EnquiryDecision.Submit Details  ${dataDictionary}

Verify Enquiry Decision Type Creation
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${dataDictionary}

Edit Enquiry Decision Type
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Click On Edit Button  ${dataDictionary}
    EnquiryDecision.Fill Enquiry Decision Details  ${dataDictionary["Edit Enquiry Decision Type"]}
    EnquiryDecision.Submit Details  ${dataDictionary}

Verify Enquiry Decision Type Updatation
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${dataDictionary}

Select Enquiry Decision Type
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Search Enquiry Decision  ${dataDictionary}
    EnquiryDecision.Select Enquiry Decision Checkbox  ${dataDictionary}

Delete Enquiry Decision Type
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Click On Delete Button  ${dataDictionary}
    EnquiryDecision.Confirm Delete Entry Popup Appeared
    EnquiryDecision.Delete Selected Entry  ${dataDictionary}

Verify Enquiry Decision Type Deletion
    [Arguments]  ${dataDictionary}
    EnquiryDecision.Check For The Enquiry Decision Entry in Enquiry Decision Table  ${dataDictionary}

Open Deputation Department Page
    DeputationDepartment.Go To Deputation Department Page

Add New Deputation Department
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Click On Add New Button  ${dataDictionary}
    DeputationDepartment.Fill Deputation Department Details  ${dataDictionary}
    DeputationDepartment.Submit Details  ${dataDictionary}

Filter Deputation Departments
    [Arguments]  ${dataDictionary}  ${value}=${dataDictionary}
    DeputationDepartment.Open Deputation Department Filters  ${dataDictionary}
    DeputationDepartment.Select Governing Authorities Filter  ${dataDictionary}  ${value["Governing Authorities"]["Value"]}
    DeputationDepartment.Select State Filter  ${dataDictionary}  ${value["State"]["Value"]}
    DeputationDepartment.Select City Filter  ${dataDictionary}  ${value["City"]["Value"]}
    DeputationDepartment.Apply Filters  ${dataDictionary}

Edit Deputation Department Details
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Click On Edit Button  ${dataDictionary}
    switch window  NEW
    DeputationDepartment.Fill Deputation Department Details  ${dataDictionary["Edit Deputation Department"]}
    DeputationDepartment.Submit Details  ${dataDictionary}

Search Deputaion Department
    [Arguments]  ${dataDictionary}  ${value}
    DeputationDepartment.Search Deputaion Department In Deputation Department table  ${dataDictionary}  ${value}

Delete Deputation Department
    [Arguments]  ${dataDictionary}  ${entity}
    DeputationDepartment.Click On Delete Button  ${dataDictionary}  ${entity}
    DeputationDepartment.Confirm Delete Entry Popup Appeared
    DeputationDepartment.Delete Selected Entry  ${dataDictionary}

Verify Deputation Department Creation
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${dataDictionary}

Verify Deputation Department Updation
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${dataDictionary}

Verify Deputation Department Deletion
    [Arguments]  ${dataDictionary}
    DeputationDepartment.Check For The Deputation Department Entry in Enquiry Decision Table  ${dataDictionary}

Open Pay Slip Configuration Page
    PaySlipConfiguration.Go To pay Slip Configuration Page

Configure Pay Slip Details
    [Arguments]  ${dataDictionary}
    PaySlipConfiguration.Configure Page/View Name  ${dataDictionary}
    PaySlipConfiguration.Configure Show Other Details  ${dataDictionary}
    PaySlipConfiguration.Configure Show Net Payable In Words  ${dataDictionary}
    PaySlipConfiguration.Configure Show DDO Details  ${dataDictionary}
    PaySlipConfiguration.Configure Show Birthday Message  ${dataDictionary}
    PaySlipConfiguration.Configure Show PF Balance  ${dataDictionary}
    PaySlipConfiguration.Configure Show Net Payable Rounded Off  ${dataDictionary}
    PaySlipConfiguration.Configure Show Gross Salary with Employer Contribution  ${dataDictionary}
    PaySlipConfiguration.Configure Show Loan Details  ${dataDictionary}
    PaySlipConfiguration.Configure Show Leave Balances  ${dataDictionary}
    PaySlipConfiguration.Configure Show LWP Days  ${dataDictionary}
    PaySlipConfiguration.Configure Language  ${dataDictionary}
    PaySlipConfiguration.Configure Show Salary Annexure  ${dataDictionary}

Save Pay Slip Configurations
    [Arguments]  ${dataDictionary}
    PaySlipConfiguration.Save Configurations  ${dataDictionary}

Open Self Verification Configuration Page
    SelfVerification.Go To Self Verification Configuration Page

Configure Self Varification Details
    [Arguments]  ${dataDictionary}
    SelfVerification.Configure Self Varication Popup  ${dataDictionary}
    SelfVerification.Configure Self Varication Mandatory  ${dataDictionary}
    SelfVerification.Configure Send SMS Notification  ${dataDictionary}
    SelfVerification.Configure Send Email Notification  ${dataDictionary}
    SelfVerification.Configure Self Verification of Enrollment Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Personal Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Official Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Salary Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Other Detail  ${dataDictionary}
    SelfVerification.Configure Self Verification of Nominee Detail  ${dataDictionary}

Save Self Varification Detatils
    [Arguments]  ${dataDictionary}
    SelfVerification.Click On Save Button  ${dataDictionary}

Open Division Page
    Division.Go To Division Page

Add New Division
    [Arguments]  ${dataDictionary}
    Division.Click On Add New Button  ${dataDictionary}
    Division.Fill Division Form  ${dataDictionary}
    Division.Save Details  ${dataDictionary}

Edit Division Details
    [Arguments]  ${dataDictionary}
    Division.Click On Edit Button  ${dataDictionary}
    Division.Fill Division Form  ${dataDictionary}
    Division.Save Details  ${dataDictionary}

Verify Division Entry
    [Arguments]  ${dataDictionary}
    Division.Check For Division Entry In Division Table  ${dataDictionary}

Verify Division Deletion
    [Arguments]  ${dataDictionary}
    Division.Check For Division Deletion In Division Table  ${dataDictionary}

Verify Designation Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${dataDictionary}
    sleep  3s
    Designation.Check For Designation Entry In Designation Table  ${dataDictionary}

Verify Designation Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${dataDictionary}
    sleep  3s
    Designation.Check For Designation Deletion In Designation Table  ${dataDictionary}

Verify Hospital Empanelment Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    HospitalEmpanelment.Search For Hospital Empanelment  ${dataDictionary}
    sleep  3s
    HospitalEmpanelment.Check For Hospital Empanelment Entry In Hospital Empanelment Table  ${dataDictionary}

Verify Hospital Empanelment Deletion
    [Arguments]  ${dataDictionary}
    Designation.Search For Hospital Empanelment  ${dataDictionary}
    sleep  3s
    Designation.Check For Hospital Empanelment Deletion In Hospital Empanelment Table  ${dataDictionary}

Verify Qualification Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Search For Qualification  ${dataDictionary}
    sleep  3s
    Qualification.Check For Qualification Entry In Qualification Table  ${dataDictionary}

Verify Qualification Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Search For Qualification  ${dataDictionary}
    sleep  3s
    Qualification.Check For Qualification Deletion In Qualification Table  ${dataDictionary}

Verify Empanelled Officer Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${dataDictionary}
    sleep  3s
    EmpanelledOfficer.Check For Empanelled Officer Entry In Empanelled Officer Table  ${dataDictionary}

Verify Empanelled Officer Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${dataDictionary}
    sleep  3s
    EmpanelledOfficer.Check For Empanelled Officer Deletion In Empanelled Officer Table  ${dataDictionary}

Verify Cadre Detail Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${dataDictionary}
    sleep  3s
    CadreDetail.Check For Cadre Detail Entry In Cadre Detail Table  ${dataDictionary}

Verify Cadre Detail Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${dataDictionary}
    sleep  3s
    CadreDetail.Check For Cadre Detail Deletion In Cadre Detail Table  ${dataDictionary}

Verify Payment Type Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${dataDictionary}
    sleep  3s
    PaymentType.Check For Payment Type Entry In Payment Type Table  ${dataDictionary}

Verify Payment Type Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${dataDictionary}
    sleep  3s
    PaymentType.Check For Payment Type Deletion In Payment Type Table  ${dataDictionary}

Verify Department Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${dataDictionary}
    sleep  3s
    Department.Check For Department Entry In Department Table  ${dataDictionary}

Verify Department Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${dataDictionary}
    sleep  3s
    Department.Check For Department Deletion In Department Table  ${dataDictionary}

Verify Section Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Section.Search For Section  ${dataDictionary}
    sleep  3s
    Section.Check For Section Entry In Section Table  ${dataDictionary}

Verify Section Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Section.Search For Section  ${dataDictionary}
    sleep  3s
    Section.Check For Section Deletion In Section Table  ${dataDictionary}

Verify TA/DA grade Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    TADAgrade.Search For TA/DA grade  ${dataDictionary}
    sleep  3s
    TADAgrade.Check For TA/DA grade Entry In TA/DA grade Table  ${dataDictionary}

Verify TA/DA grade Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    TADAgrade.Search For TA/DA grade  ${dataDictionary}
    sleep  3s
    TADAgrade.Check For TA/DA grade Deletion In TA/DA grade Table  ${dataDictionary}

Verify Grade Dependancy Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    sleep  3s
    GradeDependancy.Check For Grade Dependancy Entry In Grade Dependancy Table  ${dataDictionary}

Verify GradeDependancy Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    sleep  3s
    GradeDependancy.Check For Grade Dependancy Deletion In Grade Dependancy Table  ${dataDictionary}

Verify TA/DA Rule Entry
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    #TADARule.Search For TA/DA Rule  ${dataDictionary}
    sleep  3s
    TADARule.Check For TA/DA Rule Entry In TA/DA Rule Table  ${dataDictionary}

Verify TA/DA Rule Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    #TADARule.Search For TA/DA Rule  ${dataDictionary}
    sleep  3s
    TADARule.Check For TA/DA Rule Deletion In TA/DA Rule Table  ${dataDictionary}

Open Salary Cycle Page
    SalaryCycle.Go To Salary Cycle Page

Add Salary Cycle
    [Arguments]  ${dataDictionary}
    SalaryCycle.Click On Add Button
    SalaryCycle.Fill Salary Cycle Form  ${dataDictionary}
    SalaryCycle.Submit Details

Open Manual Attendance Page
    ManualAttendance.Go To Manual Attendance Page

Set Mark Attendance Criteria
    [Arguments]  ${dataDictionary}
    ManualAttendance.Click On Mark Attendance Button
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}
    HRMS_Keywords.Select Designation  ${dataDictionary}
    HRMS_Keywords.Select Division  ${dataDictionary}
    HRMS_Keywords.Select Is Gazetted  ${dataDictionary}
    ManualAttendance.Apply Criteria

Submit Marked Attendance
    ManualAttendance.Select Employees
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Verify Marked Attendance
    [Arguments]  ${dataDictionary}
    ManualAttendance.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}
    ManualAttendance.Apply Filters
    sleep  2s
    Common_Keywords.Show Maximum Entries On Page
    ManualAttendance.Click On Actions Button
    ManualAttendance.Verify Attendance

Approve Marked Attendance
    ManualAttendance.Click On Actions Button
    ManualAttendance.Choose Approve

Open Salary Detail Page
    SalaryDetail.Go To Salary Detail Page

Process Salary
    [Arguments]  ${dataDictionary}
    SalaryDetail.Click On Action Button
    sleep  4s
    SalaryDetail.Click On Process
    sleep  3s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Designation  ${dataDictionary}
    HRMS_Keywords.Select Division  ${dataDictionary}
    SalaryDetail.Click On Process button
    SalaryDetail.Process Salary
    Common_Keywords.Switch Tab

Lock Salary
    [Arguments]  ${dataDictionary}
    Common_Keywords.Switch Tab
    SalaryDetail.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}
    HRMS_Keywords.Select Status  Withheld
    SalaryDetail.Apply Filters
    Common_Keywords.Show Maximum Entries On Page
    SalaryDetail.Select Employee
    SalaryDetail.Click On Action Button
    SalaryDetail.Click On Lock
    SalaryDetail.Lock Salary

Open Salary Paybill Page
    SalaryPaybill.Go To Salary Paybill Page

Add Salary Paybill
    [Arguments]  ${dataDictionary}
    SalaryPaybill.Click On Add Paybill button
    SalaryPaybill.Fill Salary Paybill Form  ${dataDictionary}
    SalaryPaybill.Submit Details

Select Financial Year
    [Documentation]  Selects Financial Year in Mark Attendance Filter.
    [Arguments]  ${dataDictionary}
    ${currentFinancialYear}  Common_Keywords.Get Current Financial Year
    ${financialYear}  set variable if  ${FINANCIALYEAR1} == None  ${currentFinancialYear}  ${FINANCIALYEAR1}          ###""" If User does not gives Financial Year then current financial year will be selected"""
    set global variable  ${financialYear}
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
    sleep  2s

Select Month
    [Documentation]  Selects Salary Cycle Month in Mark Attendance Filter
    [Arguments]  ${dataDictionary}
    ${salaryCycleName}  SalaryCycle.Get Current Salary Cycle
    set global variable  ${salaryCycleName}
    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${dataDictionary["Month"]["Locator"]}  ${SALARYCYCLEID}        ###""" If User does not gives Salary cycle then Current SAlary Cycle will be selected."""
    run keyword if  ${SALARYCYCLEID} == None  FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}

Select Pay Group
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Pay Group"]}  ${PAYGROUP}

Select Payment unit
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Unit"]}  ${PAYMENTUNIT}

Select Designation
    [Arguments]  ${dataDictionary}
    Run keyword if  '${DESIGNATION}' != 'None'  FillFields.Input Value Into Field  ${dataDictionary["Designation"]}  ${DESIGNATION}

Select Division
    [Arguments]  ${dataDictionary}
    Run keyword if  '${DIVISION}' != 'None'  FillFields.Input Value Into Field  ${dataDictionary["Division"]}  ${DIVISION}

Select Status
    [Arguments]  ${status}
    select from list by label  ${employeeStatus}  ${status}

Select Is Gazetted
    [Arguments]  ${dataDictionary}
    Run keyword if  '${ISGAZETTED}' != 'None'  FillFields.Input Value Into Field  ${dataDictionary["Is Gazetted"]}  ${ISGAZETTED}

Approve Salary Paybill
    [Arguments]  ${dataDictionary}
    SalaryPaybill.Go To Approve Salary Paybill Page
    SalaryPaybill.Open Filters
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}
    HRMS_Keywords.Select Status  Pending
    SalaryPaybill.Apply Filters
    SalaryPaybill.Get Latest Paybill Number
    SalaryPaybill.Search Paybill
    SalaryPaybill.Verify Paybill
    SalaryPaybill.Approve Paybill
    #SalaryDetail.Select Status  Withheld

Select Multi Paygroups
    [Arguments]  ${Locator}  @{payGroupList}
    click element  ${Locator}
    FOR  ${item}  In  @{payGroupList}
    \   click element  //label[contains(text(),'${item}')]


