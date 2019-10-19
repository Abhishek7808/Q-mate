*** Variables ***
${ENVIRONMENT}  demo
${BROWSER}  chrome
&{BASE_URL}  demo=http://demoprojects.e-connectsolutions.com/ERP-DEMO  test=demoprojects.e-connectsolutions.com/ERP-TEST  production=demoprojects.e-connectsolutions.com/ERP-DEMO

# All modules urls list in json
${URLS_JSON}  ./Data/URLs.json

#Module Details
&{HRMS}
...  name=HRM
...  link=/HRM
...  link_title=//a[@title='HRMS']
...  dashboard_title=HRM:Dashboard

&{FA}
...  name=ACC
...  link=/ACC
...  link_title=xpath=//a[@title='Financial Accounting']
...  dashboard_title=Financial Accounts:Dashboard

&{UM}
...  name=URM
...  link=/URM
...  link_title=xpath=//a[@title='User Management']
...  dashboard_title=User, Role and Workflow Management:Dashboard

&{SMM}
...  name=SMM
...  link=/SMM
...  link_title=xpath=//a[@title='User Management']
...  dashboard_title=Sales & Marketing