*** Variables ***

&{INVALID_USER}  username=qwerty  password=qwerty  ExpectedResponseMessage=Invalid UserId or Password!
&{INVALID_PASSWORD}  username=econnect  password=qwerty  ExpectedResponseMessage=Invalid UserId or Password!  #OWASP guidelines: An application should respond with a generic error message regardless of whether the user ID or password was incorrect. It should also give no indication to the status of an existing account.
&{BLANK_USER}  username=  password=  ExpectedResponseMessage=Please enter login id and password.

&{NONADMIN_USER}  username=40052  password=admin  ExpectedResponseMessage=Dashboard
&{ADMIN_USER}  username=econnect  password=admin  ExpectedResponseMessage=Dashboard
