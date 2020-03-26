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
Resource  ${PAGE OBJECTS}/HRMS/SalaryDisbursment.robot
Resource  ${PAGE OBJECTS}/HRMS/ManageUser.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentEmployee.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentAdmin.robot
Resource  ${PAGE OBJECTS}/HRMS/LeaveEncashmentPropsal.robot
*** Variables ***
${employeeStatus}  Status

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

Search Division
    [Arguments]  ${dataDictionary}  ${value}
    Division.Input Division Name Into Search Box  ${dataDictionary}  ${value}
    Division.Click Search Button  ${dataDictionary}

Edit Division Details
    [Arguments]  ${dataDictionary}
    Division.Click On Edit Button  ${dataDictionary}
    Division.Fill Division Form  ${dataDictionary["Edit Division"]}
    Division.Save Details  ${dataDictionary}

Verify Division Entry
    [Arguments]  ${dataDictionary}
    Division.Check For Division Entry In Division Table  ${dataDictionary}

Delete Division
    [Arguments]  ${dataDictionary}
    Division.Delete Division Entry  ${dataDictionary}

Verify Division Deletion
    [Arguments]  ${dataDictionary}
    Division.Check For Division Deletion In Division Table  ${dataDictionary}

Open Designation Page
    Designation.Go To Designation Page

Add New Designation
    [Arguments]  ${dataDictionary}
    Designation.Click On Add New Designation Button  ${dataDictionary["Add Designation"]}
    Designation.Fill Designation Form  ${dataDictionary}
    Designation.Save Details  ${dataDictionary}

Search Designation Name
    [Arguments]  ${dataDictionary}  ${value}
    Designation.Input Designation Name Into Search Box  ${dataDictionary}  ${value}
    Designation.Click On Search Button  ${dataDictionary}

Select Designation From The Table
    [Arguments]  ${dataDictionary}  ${desingnationName}
    Designation.Select Designation Checkbox  ${dataDictionary}  ${desingnationName}

Edit Designation
    [Arguments]  ${dataDictionary}
    Designation.Click On Edit Button  ${dataDictionary}
    Designation.Edit Designation Details  ${dataDictionary}
    Designation.Save Details  ${dataDictionary}

Delete Designation
    [Arguments]  ${dataDictionary}
    Designation.Delete Designation Entry  ${dataDictionary}

Verify Designation Entry
    [Arguments]  ${dataDictionary}  ${value}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${dataDictionary}
    sleep  3s
    Designation.Check For Designation Entry In Designation Table  ${value}

Verify Designation Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Designation.Search For Designation  ${dataDictionary}
    sleep  3s
    Designation.Check For Designation Deletion In Designation Table  ${dataDictionary}

Open Hospital Empanelment Page
    HospitalEmpanelment.Go To Hospital Empanelment Page

Add New Hospital Empanelment
    [Arguments]  ${dataDictionary}
    HospitalEmpanelment.Click On Add New Button  ${dataDictionary}
    HospitalEmpanelment.Fill Hospital Empanelment Details  ${dataDictionary}
    HospitalEmpanelment.Save Details  ${dataDictionary}

Search Hospital Empanelment
    [Arguments]  ${value}
    HospitalEmpanelment.Search For Hospital Empanelment  ${value}

Edit Hospital Empanelment
    [Arguments]  ${dataDictionary}
    HospitalEmpanelment.Click On Edit Button  ${dataDictionary}
    HospitalEmpanelment.Edit Hospital Empanelment Details  ${dataDictionary}
    HospitalEmpanelment.Save Details  ${dataDictionary}

Delete Hospital Empanelment
    [Arguments]  ${value}
    HospitalEmpanelment.Select Hospital Empanement  ${value}
    HospitalEmpanelment.Delete Entry

Verify Hospital Empanelment Entry
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    HospitalEmpanelment.Search For Hospital Empanelment  ${value}
    sleep  3s
    HospitalEmpanelment.Check For Hospital Empanelment Entry In Hospital Empanelment Table  ${value}

Verify Hospital Empanelment Deletion
    [Arguments]  ${value}
    HospitalEmpanelment.Search For Hospital Empanelment  ${value}
    sleep  3s
    HospitalEmpanelment.Check For Hospital Empanelment Deletion In Hospital Empanelment Table  ${value}

Open Qualification Page
    Qualification.Go To Qualification Page

Add New Qualification
    [Arguments]  ${dataDictionary}
    Qualification.Click On Add New Button  ${dataDictionary}
    Qualification.Fill Qualification Details  ${dataDictionary}
    Qualification.Save Details  ${dataDictionary}

Edit Qualification
    [Arguments]  ${dataDictionary}  ${qualificationName}
    Qualification.Click On Edit Button  ${qualificationName}
    Qualification.Edit Qualification Details  ${dataDictionary}
    Qualification.Save Details  ${dataDictionary}

Search Qualification
    [Arguments]  ${value}
    Qualification.Search For Qualification  ${value}

Verify Qualification Entry
    [Arguments]  ${value}
    Qualification.Search For Qualification  ${value}
    sleep   3s
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Check For Qualification Entry In Qualification Table  ${value}

Verify Qualification Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Qualification.Search For Qualification  ${dataDictionary}
    sleep  3s
    Qualification.Check For Qualification Deletion In Qualification Table  ${dataDictionary}

Open Empanelled Officer Page
    EmpanelledOfficer.Go To Empanelled Officer Page

Add New Empanelled Officer
    [Arguments]  ${dataDictionary}
    EmpanelledOfficer.Click On Add New Button  ${dataDictionary}
    EmpanelledOfficer.Fill Empanelled Officer Details  ${dataDictionary}
    EmpanelledOfficer.Save Details  ${dataDictionary}

Edit Empanelled Officer
    [Arguments]  ${dataDictionary}  ${officerName}
    EmpanelledOfficer.Click On Edit Button  ${officerName}
    EmpanelledOfficer.Fill Empanelled Officer Details  ${dataDictionary["Edit Empanelled Officer"]}
    EmpanelledOfficer.Save Details  ${dataDictionary}

Search Empanelled Officer
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${value}

Verify Empanelled Officer Entry
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${value}
    EmpanelledOfficer.Check For Empanelled Officer Entry In Empanelled Officer Table  ${value}

Verify Empanelled Officer Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    EmpanelledOfficer.Search For Empanelled Officer  ${dataDictionary}
    sleep  3s
    EmpanelledOfficer.Check For Empanelled Officer Deletion In Empanelled Officer Table  ${dataDictionary}

Open Cadre Detail Page
    CadreDetail.Go To Cadre Detail Page

Add New Cadre
    [Arguments]  ${dataDictionary}
    CadreDetail.Click On Add New Cadre Button  ${dataDictionary}
    CadreDetail.Fill Cadre Details  ${dataDictionary}
    CadreDetail.Save Details  ${dataDictionary}

Edit Cadre Details
    [Arguments]  ${dataDictionary}
    CadreDetail.Click On Edit Button  ${dataDictionary}
    CadreDetail.Fill Cadre Details  ${dataDictionary["Edit Cadre Detail"]}
    CadreDetail.Save Details  ${dataDictionary}

Delete Cadre Entry
    [Arguments]  ${dataDictionary}  ${value}
    CadreDetail.Select Cadre  ${value}
    CadreDetail.Delete Cadre  ${dataDictionary}

Search For Cadre Entry
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${value}

Verify Cadre Detail Entry
    [Arguments]  ${value}
    HRMS_Keywords.Search For Cadre Entry  ${value}
    sleep  3s
    CadreDetail.Check For Cadre Detail Entry In Cadre Detail Table  ${value}

Verify Cadre Detail Deletion
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    CadreDetail.Search For Cadre Detail  ${value}
    sleep  3s
    CadreDetail.Check For Cadre Detail Deletion In Cadre Detail Table  ${value}

Open Payment Type Page
    PaymentType.Go To Payment Type Page

Add Payment Type
    [Arguments]  ${dataDictionary}
    PaymentType.Click On Add Payment Type Button  ${dataDictionary}
    PaymentType.Fill Payment Type Details  ${dataDictionary}
    PaymentType.Save Details  ${dataDictionary}

Search Payment Type
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${value}

Edit Payment Type
    [Arguments]  ${dataDictionary}
    PaymentType.Click On Edit Button  ${dataDictionary}
    PaymentType.Fill Payment Type Details  ${dataDictionary["Edit Payment Type"]}
    PaymentType.Save Details  ${dataDictionary}

Delete Payment Type Entry
    [Arguments]  ${dataDictionary}  ${value}
    PaymentType.Select Payment Type  ${value}
    PaymentType.Delete Payment Type  ${dataDictionary}

Verify Payment Type Entry
    [Arguments]  ${value}
    HRMS_Keywords.Search Payment Type  ${value}
    sleep  3s
    PaymentType.Check For Payment Type Entry In Payment Type Table  ${value}

Verify Payment Type Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    PaymentType.Search For Payment Type  ${dataDictionary}
    sleep  3s
    PaymentType.Check For Payment Type Deletion In Payment Type Table  ${dataDictionary}

Open Department Page
    Department.Go To Department Page

Add New Department
    [Arguments]  ${dataDictionary}
    Department.Click On Add New Department Button  ${dataDictionary}
    Department.Fill Department Details  ${dataDictionary}
    Department.Save Details  ${dataDictionary}

Edit Department Entry
    [Arguments]  ${dataDictionary}
    Department.Click On Edit Button  ${dataDictionary}
    Department.Fill Department Details  ${dataDictionary["Edit Department"]}
    Department.Save Details  ${dataDictionary}

Search Department Entry
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${value}

Verify Department Entry
    [Arguments]  ${value}
    HRMS_Keywords.Search Department Entry  ${value}
    sleep  3s
    Department.Check For Department Entry In Department Table  ${value}

Verify Department Deletion
    [Arguments]  ${dataDictionary}
    Common_Keywords.Show Maximum Entries on Page
    Department.Search For Department  ${dataDictionary}
    sleep  3s
    Department.Check For Department Deletion In Department Table  ${dataDictionary}

Open Section Page
    Section.Go To Section Page

Add New Section
    [Arguments]  ${dataDictionary}
    Section.Click On Add New Button  ${dataDictionary}
    Section.Fill Section Details  ${dataDictionary}
    Section.Save Details  ${dataDictionary}

Edit Section Details
    [Arguments]  ${dataDictionary}
    Section.Click On Edit Button  ${dataDictionary}
    Section.Fill Section Details  ${dataDictionary["Edit Section"]}
    Section.Save Details  ${dataDictionary}

Search Section Entry
    [Arguments]  ${value}
    Common_Keywords.Show Maximum Entries on Page
    Section.Search For Section  ${value}

Verify Section Entry
    [Arguments]  ${value}
    HRMS_Keywords.Search Section Entry  ${value}
    sleep  3s
    Section.Check For Section Entry In Section Table  ${value}

Verify Section Deletion
    [Arguments]  ${value}
    HRMS_Keywords.Search Section Entry  ${value}
    sleep  3s
    Section.Check For Section Deletion In Section Table  ${value}

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
    [Documentation]  Applies filters for listing of employees.
    [Arguments]  ${dataDictionary}  ${payGroup}=select all
    ManualAttendance.Click On Mark Attendance Button
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Employee Location  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    HRMS_Keywords.Select Designation  ${dataDictionary}
    HRMS_Keywords.Select Division  ${dataDictionary}
    HRMS_Keywords.Select Is Gazetted  ${dataDictionary}
    ManualAttendance.Apply Criteria
    sleep  2s

Apply Filters For Marked Attendance
    [Arguments]  ${status}  ${payGroup}=select all
    ManualAttendance.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary["Filters"]}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary["Filters"]}
    HRMS_Keywords.Select Pay Group  ${dataDictionary["Filters"]}  ${payGroup}
    HRMS_Keywords.Select Employee Location  ${dataDictionary["Filters"]}
    ManualAttendance.Select Status  ${status}
    ManualAttendance.Apply Filters
    sleep  2s

Submit Marked Attendance
    [Documentation]
    ManualAttendance.Select Employees
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Verify Marked Attendance
    [Arguments]  ${dataDictionary}  ${payGroup}
    Common_Keywords.Show Maximum Entries On Page
    sleep  3s
    ManualAttendance.Click On Actions Button  Submitted  ${payGroup}
    ManualAttendance.Verify Attendance

Approve Marked Attendance
    [Arguments]  ${payGroup}
#    ManualAttendance.Open Filters
#    sleep  2s
#    ManualAttendance.Select Status  Verified
#    ManualAttendance.Apply Filters
    Common_Keywords.Show Maximum Entries On Page
    ManualAttendance.Click On Actions Button  Verified  ${payGroup}
    ManualAttendance.Choose Approve

Open Salary Detail Page
    SalaryDetail.Go To Salary Detail Page

Process Salary
    [Arguments]  ${dataDictionary}  ${payGroup}=Select One
    SalaryDetail.Click On Action Button
    sleep  4s
    SalaryDetail.Click On Process
    sleep  3s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    SalaryDetail.Select Employee Location  ${dataDictionary}
    HRMS_Keywords.Select Designation  ${dataDictionary}
    HRMS_Keywords.Select Division  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    SalaryDetail.Click On Process button
    SalaryDetail.Select All Employees
    SalaryDetail.Process Salary
    #Common_Keywords.Switch Tab

#Open Salary Slip
#    HRMS_Keywords.Search Employee
#    SalaryDetail.Click On Actions Button
#    SalaryDetail.Open Salary Slip
#    switch window  NEW
#    SalaryDetail.Verify Salary Slip


View Salary Slip
    [Arguments]  ${dataDictionary}
    Open Salary Detail Page
    SalaryDetail.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary}
    SalaryDetail.Select Employee Location  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    HRMS_Keywords.Select Status  Withheld
    SalaryDetail.Apply Filters
    HRMS_Keywords.Search Employee
    SalaryDetail.Click On Actions Button
    SalaryDetail.Open Salary Slip
    switch window  NEW
    SalaryDetail.Verify Salary Slip
    #Switch Window  OLD
    #Common_keywords.Switch Tab

Search Employee
    SalaryDetail.Enter Employee Code In Search Box
    SalaryDetail.Click On Search Button

Lock Salary
    [Arguments]  ${dataDictionary}  ${payGroup}=Select One
    #Common_Keywords.Switch Tab
    #Open Salary Detail Page
    SalaryDetail.Open Filters
    sleep  2s
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    sleep  2s
    HRMS_Keywords.Select Month  ${dataDictionary}
    SalaryDetail.Select Employee Location  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${payGroup}
    HRMS_Keywords.Select Status  Withheld
    SalaryDetail.Apply Filters
    Common_Keywords.Show Maximum Entries On Page
    SalaryDetail.Select Employees  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']//thead//tr//th//input
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
    [Documentation]  Selects Financial Year in Mark Attendance Filter. Fills current financial year if not specified by user.
    [Arguments]  ${dataDictionary}
    #${currentFinancialYear}  Common_Keywords.Get Current Financial Year
    ${financialYear}  set variable if  ${SALARYFINANCIALYEAR} == None  ${currentFinancialYear}  ${SALARYFINANCIALYEAR}          ###""" If User does not gives Financial Year then current financial year will be selected"""
    set global variable  ${financialYear}
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${financialYear}
    sleep  2s

Select Month
    [Documentation]  Selects Salary Cycle Month in Mark Attendance Filter
    [Arguments]  ${dataDictionary}
    ${salaryCycleName}  set variable if  '${SALARYCYCLE}' == 'None'  ${currentSalaryCycleName}  ${SALARYCYCLE}
    set global variable  ${salaryCycleName}
    FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}
#    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${dataDictionary["Month"]["Locator"]}  ${SALARYCYCLEID}        ###""" If User does not gives Salary cycle then Current SAlary Cycle will be selected."""
#    run keyword if  ${SALARYCYCLEID} == None  FillFields.Input Value Into Field   ${dataDictionary["Month"]}  ${salaryCycleName}

Select Employee Location
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field   ${dataDictionary["Employee Location"]}  ${EMPLOYEELOCATION}

Select Pay Group
    [Arguments]  ${dataDictionary}  ${payGroupName}
    FillFields.Input Value Into Field  ${dataDictionary["Pay Group"]}  ${payGroupName}

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
    HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Pending
    SalaryPaybill.Get Latest Paybill Number
    SalaryPaybill.Search Paybill
    sleep  3s
    SalaryPaybill.Verify Paybill
    sleep  5s
    reload page
    HRMS_Keywords.Set Filters For Paybill  ${dataDictionary}  Verified and Forwarded for Approval
    sleep  5s
    SalaryPaybill.Approve Paybill
    #SalaryDetail.Select Status  WithheldEdit Division Details

Set Filters For Paybill
    [Arguments]  ${dataDictionary}  ${status}
    SalaryPaybill.Open Filters
    HRMS_Keywords.Select Month  ${dataDictionary["Filter"]}
    HRMS_Keywords.Select Pay Group  ${dataDictionary["Filter"]}  ${PAYGROUP}
    HRMS_Keywords.Select Payment unit  ${dataDictionary["Filter"]}
    SalaryPaybill.Select Status  ${status}
    SalaryPaybill.Apply Filters

Select Multi Paygroups
    [Arguments]  ${Locator}
    click element  ${Locator}
    FOR  ${item}  IN  @{DISBURSEMENT_PAYGROUPS}
    \   click element  //label[contains(text(),'${item}')]

Select Multi Paybills
    [Arguments]  ${Locator}
    click element  ${Locator}
    Sleep  2s
    input text  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[1]/div/input  ${latestPaybillCreated}
    select checkbox  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[2]/a/label/input
    ${status}  run keyword and return status  checkbox should be selected  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[2]/a/label/input
    run keyword if  ${status} == ${False}  Select Multi Paybills  ${Locator}
    capture page screenshot
    #Execute JavaScript  document.getElementById("PaybillIds").checked = true
    #click element  //*[@id="SalaryPayments"]/div[2]/div[2]/div/ul/li[2]/a/label/input
    sleep  5s
#    FOR  ${item}  In  @{DISBURSEMENT_PAYBILLS}
#    \   select checkbox  //label[contains(text(),'${item}')]
#    Sleep  2s

Open Salary Disbursment Page
    SalaryDisbursment.Go To Salary Disbursment Page

Add Disbursement
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Click On Pending Paybills button
    SalaryDisbursment.Fill Pending Paybills Form  ${dataDictionary}
    SalaryDisbursment.Fill Salary Disbursment Form  ${dataDictionary}
    SalaryDisbursment.Submit Details

Add Disbursment button
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Click On Add Disbursment button
    sleep  3s
    SalaryDisbursment.Fill Salary Disbursment Form  ${dataDictionary}
    SalaryDisbursment.Submit Details

Select Date
     [Arguments]  ${Disbursment}  ${currentDate}  ${currentMonth}  ${currentYear}
     Click Element    ${Disbursment}
     Select From List By label  //select[@class='ui-datepicker-year']   ${currentYear}
     Select From List By label  //select[@class='ui-datepicker-month']   ${currentMonth}
     page should contain element  //a[contains(text(),'${currentDate}')]
     page should contain element  //td[contains(@class,'ui-datepicker-today')]/child::a[contains(text(),'${currentDate}')]
     Click element     //td[contains(@class,'ui-datepicker-today')]/child::a[contains(text(),'${currentDate}')]
     sleep  2s

Approve Salary Disbursement
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Go To Salary Disbursment Page
    SalaryDisbursment.Open Filters
    SalaryDisbursment.Select Filters  Pending
    SalaryDisbursment.Apply Filters
    sleep  4s
    SalaryDisbursment.Verify Disbursement
    SalaryDisbursment.Open Filters
    SalaryDisbursment.Select Filters  Verified
    SalaryDisbursment.Apply Filters
    sleep  4s
    SalaryDisbursment.Approve Disbursement

Create Voucher
    [Arguments]  ${dataDictionary}
    SalaryDisbursment.Open Filters
    SalaryDisbursment.Select Filters  Approved
    #SalaryDisbursment.Select Status  Approved
    SalaryDisbursment.Apply Filters
    sleep  3s
    SalaryDisbursment.Click On Actions Button
    sleep  3s
    SalaryDisbursment.Select Voucher
    SalaryDisbursment.Save Voucher


#Set Mark Attendance Criteria For One Employee
#    [Arguments]  ${dataDictionary}
#    ManualAttendance.Click On Mark Attendance Button
#    HRMS_Keywords.Select Financial Year  ${dataDictionary}
#    HRMS_Keywords.Select Month  ${dataDictionary}
#    HRMS_Keywords.Select Employee Location  ${dataDictionary}
#    run keyword if  ${TEST_PAYGROUP} == None  HRMS_Keywords.Select Pay Group  ${dataDictionary}  select all  ELSE  HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${TEST_PAYGROUP}
#    HRMS_Keywords.Select Pay Group  ${dataDictionary}
#    HRMS_Keywords.Select Designation  ${dataDictionary}
#    HRMS_Keywords.Select Division  ${dataDictionary}
#    HRMS_Keywords.Select Is Gazetted  ${dataDictionary}
#    ManualAttendance.Apply Criteria
#    sleep  2s

Mark Attendance Of One Employee
    [Arguments]  ${dataDictionary}
    ManualAttendance.Select First Employee
    ManualAttendance.Load Employee Code
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Mark Attendance Of Given Employee
    [Arguments]  ${EmployeeCode}
    ManualAttendance.Search Employee  ${EmployeeCode}
    ManualAttendance.Select Given Employee  ${EmployeeCode}
    ManualAttendance.Load Employee Code
    ManualAttendance.Click On Submit Button
    ManualAttendance.Verify Submit Popup
    ManualAttendance.Click On Ok Button

Open Manage User Page
    LeaveEncashment.Go To Manage User Page

Impersonate into employee ID
    [Arguments]  ${EmployeeCode}
    ManageUser.Search Employee  ${EmployeeCode}
#    Leave_encash.Open Filters
#    Leave_encash.Apply Filters
    #Leave_encash.Select Employee
    ManageUser.Impersonate Employee

Encash Privilege Leave
    LeaveEncashmentEmployee.Go To Employee Privilege Leave Encashment Page
    LeaveEncashmentEmployee.Click On Add Leave Encashment Button
    LeaveEncashmentEmployee.Submit Leave Encashment Application

Open Leave Encashment Page
    LeaveEncashmentAdmin.Go To Leave Encashment Page

Add Leave Encashment
    [Arguments]  ${dataDictionary}  ${EMPLOYEENAME}
    LeaveEncashmentAdmin.Click On Add Leave Encashment
    LeaveEncashmentAdmin.Fill Leave Encashment Details  ${dataDictionary}  ${EMPLOYEENAME}
    LeaveEncashmentAdmin.Submit Details

Verify Leave Encashment Entry
    [Arguments]  ${EMPLOYEENAME}
    LeaveEncashmentAdmin.Verify Leave Encashment Entry In Table  ${EMPLOYEENAME}

Open Leave Encashment Proposal Page
    LeaveEncashmentPropsal.Go To Leave Encashment Proposal Page

Add Leave Encashment Proposal
    [Arguments]  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}
    LeaveEncashmentPropsal.Click On Add Button
    LeaveEncashmentPropsal.Fill Proposal Details  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}
    LeaveEncashmentPropsal.Submit Details

Open Leave Encashment Proposal Approval Page
    ApproveLeaveEncashmentProposal.Go To Leave Encashment Proposal Approval Page

Select Leave Encashment Filters
    [Arguments]  ${EMPLOYEELOATION}
    ApproveLeaveEncashmentProposal.Open Filters
    ApproveLeaveEncashmentProposal.Select Employee Location  ${EMPLOYEELOATION}
    ApproveLeaveEncashmentProposal.Apply Filters

View Leave Encashment Proposal
    [Arguments]  ${EMPLOYEENAME}
    ApproveLeaveEncashmentProposal.Search Employee  ${EMPLOYEENAME}
    ApproveLeaveEncashmentProposal.Click On View Button  ${EMPLOYEENAME}

Issue Order For Leave Encashment Proposal
    ApproveLeaveEncashmentProposal.Click On Action Button
    ApproveLeaveEncashmentProposal.Approve Proposal
    ApproveLeaveEncashmentProposal.Click On Action Button
    ApproveLeaveEncashmentProposal.Issue Order
