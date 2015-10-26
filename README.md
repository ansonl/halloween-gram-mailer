Halloween gram confirmation mailer
===================

Send "personalized" HTML emails to multiple recipients. 
Uses `sed` to substitute recipient specific text into the message.

Created for USNA Third Company Fall 2015 Halloween grams. 

Usage
===================
 - `emails` file contains recipient email addresses and names
	 - Address and recipient name are separated by a vertical line `|`
	 - Multiple recipients are separated by a new line `\n` 
	 - Example:
  ```
  anson@example.com|Anson
  kim@example.com|Kim
  ```
  
 - Run `script.sh` to send messages
 ```
 ./script.sh
 ```

Notes
===================
`script.sh` uses `sendmail` to send mail.