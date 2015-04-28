
<!--- cfgmail cfc v0.1

	February 25 2009
	
	This is a very basic version of a CFC to interact with Gmail via SSL.  
	It is by no means complete, however the code listed here has run successfully in a production environment for almost a year prior to being put into a cfc. 
	
	Suggestions and reccomendations are welcome!
	
	v0.1 - support to SEND email --->




<cfcomponent displayname="Coldfusion Gmail Interface" hint="Coldfusion Gmail Interface" output="false">

		<!--- let's handle the global settings here --->

			<cfset this.varGmailPOPServer = "pop.gmail.com" />
			
			<cfset this.varGmailPOPServerPort = 995 />
			
			<cfset this.varGmailSMTPServer = "smtp.gmail.com" />
			
			<cfset this.varGmailSMTPServerPort = 465 />
			
			<cfset this.varGmailSMTPUseSSL = "Yes" />







	<cffunction name="sendGmail" displayname="Method to send Email via Gmail Account" hint="I send a message via Gmail" output="false" returntype="Any">
		
			<cfargument 	name = "varGmailLogin" 
							displayname = "Gmail account to send from"
							hint = "This is the gmail account that you would like to send emails 'from'.  It is a required field as it is also used to login to Gmail"
							type = "string"
							required = "true" >
							
			<cfargument		name = "varGmailPassword"
							displayName = "Gmail Account Password"
							hint = "The password for the gmail account you would like to send from"
							type = "string"
							required = "true" >		
							
			<cfargument		name = "varEmailSendTo"
							displayName = "Email address to send to"
							hint = "Enter the email address you'd like to send to, comma seperated."
							type = "string"
							required = "true" >
																					
			<cfargument		name = "varEmailSubject"
							displayName = "Subject of email"
							hint = "Enter subject of the email."
							type = "string"
							required = "true" >	
							
			<cfargument		name = "varEmailType"
							displayName = "Type of email to send."
							hint = "{text, html}"
							type = "string"
							default = "text">			

			<cfargument		name = "varEmailMessage"
							displayName = "Contents of email message"
							hint = "Email message to send"
							type = "string"
							required = "true" >
							
							
			
                    <cfmail 	to = "#varEmailSendTo#"
                         		from = "#varGmailLogin#"
                        		subject = "#varEmailSubject#"  
                        		type = "#varEmailType#"
      
                                server = "#this.varGmailSMTPServer#"
                                username = "#varGmailLogin#"
                                password = "#varGmailPassword#"
                                port = "#this.varGmailSMTPServerPort#"
                                useSSL = "#this.varGmailSMTPUseSSL#">
#varEmailMessage#
					</cfmail>
		
		<cfset returnMessage = "Email sent successfully">
	
		<cfreturn returnMessage />
	</cffunction>
	
	
	
	<!--- ******* CHECK GMAIL VIA SECURE POP ******* 
	<cffunction name="checkGmailPOP" displayname="Check Gmail Account for New Messages via Secure POP" output="false" returntype="Any">

		<!--- To Check Gmail we must use Java's underlying SSL to force cfpop to use SSL --->
	
			<cfset javaSystem = createObject("java", "java.lang.System") />
	
			<cfset javaSystemProps = javaSystem.getProperties() />
	
			<cfset javaSystemProps.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory") />



			<cfargument 	name = "varGmailLogin" 
							displayname = "Gmail account to send from"
							hint = "This is the gmail account that you would like to send emails 'from'.  It is a required field as it is also used to login to Gmail"
							type = "string"
							required = "true">
							
			<cfargument		name = "varGmailPassword"
							displayName = "Gmail Account Password"
							hint = "The password for the gmail account you would like to send from"
							type = "string"
							required = "true">	


			<!--- still needs to be copied in from old --->



		<cfreturn />
	</cffunction>--->


</cfcomponent>