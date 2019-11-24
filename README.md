# IIS_Log_Deleter
delete ***IIS logs / files in a directory*** older than...


Powershell script to delete files in a directory which are older than a certain period of time counted from the actual date in days.

Please take a look on the ***variables in the scipt*** to be set for productive usage!


It can be used as a scheduled task to keep directories already in the backup clean.
After deletion a mail is sent to the given mailaddress telling the names of the deleted files to be found in the backup if needed.
The user sending the mail has to have the ability to use the given SMTP as a relay.


If needed for the German comments use a translator.
