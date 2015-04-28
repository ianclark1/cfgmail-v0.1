

<!--- Example calls to cfgmail.cfc --->




	<!--- STEP 1: Gmail account to send from --->
	<cfset varGmailLogin = "username@gmail.com">
	
	<cfset varGmailPassword = "yourpassword">
	
	
	<!--- Who you would like to send the email to --->
	<cfset varEmailSendTo = "someone@somewhere.com">

	<cfset varEmailSubject = "Test email from cfgmail!">
	
	<cfset varEmailMessage = "This is a test email from cfgmail.">



	<cfinvoke component = "cfgmail" method = "sendGmail"
			  varGmailLogin = "#varGmailLogin#"
			  varGmailPassword = "#varGmailPassword#"
			  varEmailSendTo = "#varEmailSendTo#"
			  varEmailSubject = "#varEmailSubject#"
			  varEmailMessage = "#varEmailMessage#">
			  