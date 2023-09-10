<#
.SYNOPSIS
  Assignment #1 - PowerShell Basics
.DESCRIPTION
  The goal of this assignment is to get you familiar with PowerShell basic concepts. 
  You will demonstrate your knowledge in Variables, Arrays, and CMDLETs.
  There are a total of 12 problems in this assignment.
.NOTES
  Version:        1.0
  Author:         <Your Name>

#>

###################### DO NOT MODIFY #############################
# (Updates Console to location of Script File)                   #
$Path = $PSScriptRoot                                            #
cd $Path                                                         #
##################################################################

#----------------------------------------------------------[Variables]-------------------------------------------------------
### You can store all types of values in PowerShell variables. 
### A variable is a unit of memory in which values are stored. 
### 1. Create a two int variables $i and $x and assign the value to 122 and 633 respectively.
## YOUR CODE HERE

$i = 122
$x = 633

### 2. Now, add $i and $x together and store the value in another variable $y. 
### Then output(print) the value of $y to the console.
## YOUR CODE HERE

$y = $i + $x
write-host $y

### 3. Divide $y by $i and round the answer to the two closest decimal places and 
### store the value in variable $z. Then print value of $z to the console. 
### HINT: Do some research on how to round values in PowerShell online. Lots of examples are available ;)
## YOUR CODE HERE

$z = $y / $i
$z = [math]::Round($z)
write-host $z
### 4. In PowerShell strings and number variables can added together. 
### Create a variable $str and set it to "The value of z is: " and 
### add $str and $z together. Then output $str to the console.
## YOUR CODE HERE

$str = "The value of z is: "
$str = $str + $z
write-host $str
#----------------------------------------------------------[Arrays]-------------------------------------------------------
### Arrays are powerfull datatype that can store a collection of items.
### 1. Create an array variable named $arr and set it to 
### the following collection of integers (10,20,30,40,50,60,70,80,90,100)
## YOUR CODE HERE

$arr = 10,20,30,40,50,60,70,80,90,100

### 2. Create a new variable called $itemSum and store the sum of the 2nd and last item in $arr. 
### Print the resule to the console. (10,->20<-,30,40,50,60,70,80,90,->100<-)

$itemSum = $arr[1] + $arr[-1]
write-host $itemSum

#----------------------------------------------------------[CMDLET]-------------------------------------------------------
### This section examines the use of CMDLETs to find information. 
### It begins with a large set of data returned back to us. Later we will continue
### to filter out unneccessary data until the desired set of data is returned.
### 1. Create a variable called $files1 and assign it the output all files including 
### inside of subfolders in C:\Windows\System32\driverStore using the cmdlet Get-ChildItem
## HINT: You will need to use two additional parameters to recusively retrieve files in sub-directories
## HINT: 1644 items will be returned. Use count attribute to verify size (Example: $files1.count)

$files1 = Get-ChildItem -Path "C:\Windows\System32\DriverStore" -File -Recurse
$numberOfFiles = $files1.Count
Write-Host "Number of files found: $numberOfFiles"
# returns 2679 files and not 1644 items


### 2. Create a variable called $files2 and assign it the output all ".sys" files 
### in C:\Windows\System32\driverStore using the cmdlet: Get-ChildItem
## HINT: 329 files returned

# creates a variable to store the list of ".sys" files
$files2 = Get-ChildItem -Path "C:\Windows\System32\DriverStore" -File -Recurse | Where-Object { $_.Extension -eq '.sys' }
# count the number of items in the list
$numberOfFiles = $files2.Count
# print statement 
Write-Host "Number of .sys files found: $numberOfFiles"
# found 434 files and not 329

### 3. Create a variable called $files3 and assign it the output all ".sys" files 
### larger than 500 KB (Length > 500KB) in 
### C:\Windows\System32\driverStore using the cmdlet: Get-ChildItem
## HINT: Length property is in Bytes 500KB = 512000 Bytes
## HINT: 51 files returned. 

# create a variable to store the list of ".sys" files larger than 500 KB
$files3 = Get-ChildItem -Path "C:\Windows\System32\DriverStore" -File -Recurse | Where-Object { ($_.Extension -eq '.sys') -and ($_.Length -gt 512000) }
# count the number of items in the list
$numberOfFiles = $files3.Count
# print statement
Write-Host "Number of '.sys' files larger than 500 KB found: $numberOfFiles"
# found 100 files and not 51


### 4.  Create a variable called $files4 and assign it the output all ".sys" files 
### that start with the letter s and larger than 500 KB (Length > 500KB) in 
### C:\Windows\System32\driverStore using the cmdlet: Get-ChildItem
## HINT: 2 files returned

# create a variable to store the list of ".sys" files starting with 's' and larger than 500 KB
$files4 = Get-ChildItem -Path "C:\Windows\System32\DriverStore" -File -Recurse | Where-Object { ($_.Extension -eq '.sys') -and ($_.Length -gt 512000) -and ($_.Name -match '^s') }
# count the number of items in the list
$numberOfFiles = $files4.Count
# print statement
Write-Host "Number of '.sys' files starting with 's' and larger than 500 KB found: $numberOfFiles"
# found 2 files like it should have

### 5. Now that the two files we were looking for are found and stored in $files4, 
## let's export them out to CSV file named findings.csv
## HINT: 1 CSV file should output to the current directory. 

# Export the files in $files4 to a CSV file named "findings.csv" in the current directory
$files4 | Export-Csv -Path ".\findings.csv" -NoTypeInformation

### 6. Over 1000 CMDLETS are available in PowerShell, research and find 
### a CMDLET to test displays diagnostic information for a network connection. 
### For this exercise, setup a network connection test to ung.edu using port 443
### and store the variable name $connection. 
### Lastly, print $connection to the console. Did it succeed?

# test network connection to ung.edu on port 443
$connection = Test-NetConnection -ComputerName ung.edu -Port 443 # -TimeoutMilliseconds 30000
# print the $connection variable
$connection

# after I tried to test connection I got hit with attempting TCP connect waiting for response.
#----------------------------------------------------------[Complete]-------------------------------------------------------------