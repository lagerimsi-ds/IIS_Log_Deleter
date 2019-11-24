<#
.SYNOPSIS
   <A brief description of the script>
.DESCRIPTION
   
.PARAMETER <paramName>
   <Description of script parameter>
.EXAMPLE
   <An example of using the script>
#>

# Erstellt ursprünglichfür das IT-DLZ Bayern Anfang des Jahres 2018.
# published for everybodies use 11-2019
#
# ---> if needed please adjust the comments to your language.
#
# 
# As I am still owner of this work made at the IT-DLZ Bayern as a worker for a governmental institution
# I make this script public under the following conditions:
#
# 
#    Copyright (C) 2019  Dominik Steinberger
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#
#
#


###
#Variables to be set
###

#gibt das Logverzeichnis an, in dem die Logs liegen
$log_dir = "<Pfad>"

# gibt die Endung der Logdatei an
$logfile = "$log_dir\*.log"


# gibt an wie weit die Suche in der Vergangenheit liegen soll (in Tagen)  - "Minus" für Vergangenheit (!)
$searchtime = "-7"

#"von", "an, "server" und "body" der Mail

$mailfrom = '<sender-mailaddress>' # Absender der Notification-Mail
$mailto = "<your-mailaddress>"   # Empfänger der Notification-Mail 
$smtpserver = 'relay.darksideofthe.moon'   # SMTP-Server 
$betreff = 'Logs auf IIS <Servernamen> gelöscht' 


###########################################
##### Ende der zu setzenden Variablen #####
###########################################


# momentane Zeit in eine Variable speichern und die Zeit des maximal zurückliegenden Logs gleich abziehen, dann Umwandlung in den gewünschten String

$date = get-date

$files = get-childitem $logfile | Where-Object -Property CreationTime -lt ($date).AddDays($searchtime)

$body = "$($files | Select-Object -ExpandProperty Name)"




foreach ($file in $files) {

#echo $file
remove-item $file

}

# eine Mail versenden mit den Dateinamen im Body

send-mailmessage -from $mailfrom -to $mailto -smtpserver $smtpserver -subject $betreff -body $body -encoding UTF8 -Attachments $attached_files
