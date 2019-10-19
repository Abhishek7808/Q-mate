*** Variables ***
${ENVIRONMENT}  demo
${BROWSER}  chrome
&{BASE_URL}  demo=http://demoprojects.e-connectsolutions.com/ERP-DEMO  test=demoprojects.e-connectsolutions.com/ERP-TEST  production=demoprojects.e-connectsolutions.com/ERP-DEMO
#Module Base URL
&{MODULE_BASE}  um=URM  hrm=HRM  fa=ACC  mm=MMP  im=IMS  wpm=WPM sm=SMM

${URLS_JSON}  ./Data/URLs.json

#Module Names
&{MODULES}  um=UM  hrm=HRM  fa=FA  mm=MM  im=IM  wpm=WPM sm=SMM

