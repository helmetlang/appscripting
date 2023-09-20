<#
.SYNOPSIS
    Assignment #2 - Writing functions, passing arguments and returning values
.DESCRIPTION
    Luke is a rising leader of a group of rebels that must be stopped. All you know is his username: “Luke”
    A vulnerable JEDI login system is available for you to guess Luke’s password. Your job is to use
    a list of most commonly used passwords and attempt a new password until a match is found.
    The fate of the universe depends on you elite hacking skills!

    This assignment requires specific variable names for the autograder. Pay close attention to the comments
    so you don't miss credit.

    This assignment you will want to complete each section, then run the entire script. 
    You can complete the assignment in 20 lines or less. Debug along the way and Good Luck!
.INPUTS
    Victim's Username and Password dictionary file
.OUTPUTS
    Function bruteforce returns matched password
.NOTES
    Version:        1.0
    Author:         Jonathan
    Creation Date: September 18th
.EXAMPLE
    Assignment2.ps1
#>

#----------------------------------------------------------[Declarations]----------------------------------------------------------
$AssignmentNumber = "2"
#-----------------------------------------------------------[Assignment Code]------------------------------------------------------------

###################### DO NOT MODIFY #############################
# (Updates Console to location of Script File)                   #
$Path = $PSScriptRoot                                            #
cd $Path                                                         #                                                 #
##################################################################

# 1. First, you will need a variable with a list of most commonly used passwords to iterate 
# through when trying to hack the users password.
# Create a variable that stores the content from the most commonly used password file. 
# *Important* Use the file path .\10k-most-common-passwords.txt
# YOUR CODE BELOW HERE 

# specify file path
$filepath = "./10k-most-common-passwords.txt"
$passwordList = Get-Content -Path $filepath

# 2. A variable is needed that stores the victim's username. 
# HINT: Look for the victim's username in the description above.
# YOUR CODE BELOW HERE

$victimsUsername = 'Luke'

# 3. Now you are ready to write your function. 
# Your function name is crackLogin and will need 2 parameters.
# One parameter for the username and one for the password list.
# YOUR CODE BELOW HERE

### Function Statement here (*Note the lefthand Curly brace already provided)

function crackLogin {
    param (
        [string]$victimsUsername,
        [string[]]$passwordList
    )
    # 4. Below you will attempt each password in the pasword list for your brute force attack! 
    # Write a foreach loop method to itereate through each common password in the password file. 
    # (Hint: Check out the argument names you provided to the function, again the first lefthand curly brace provided)
    # YOUR CODE BELOW HERE 

    foreach ($password in $passwordList) {
        Write-Host "Checking password: $password"
        if ($password -eq $victimsUsername) {
            return $password
        }

        # 5. You will need to build an array of user credentials to attempt the hack with.
        # * Create an empty array called "payload". 
        # * Add your victim's username variable to the payload array. 
        #  HINT: To add items to an payload array you can use += operator
        # * Add a SINGLE password to the payload array.
        # Feel free to print out the payload array after its created
        # YOUR CODE BELOW HERE

        $payload = @()
        $payload += $victimsUsername
        $payload += $password
    
        Write-Host "Payload array contents:"
        $payload
        ## DO NOT MODIFY ##
        Write-Host "--------------" 

        # 6. The Invoke-Expression cmdlet is used to call other powershell scripts. 
        # Below will call Login.ps1 and send the payload (username, password) to the login page.
        # The syntax is partially provided.
        # 
        # Your job is complete the line and payload array created earlier.
        # Remember <payload array variable> will need to be replaced with the variable name of the payload array.
        # YOU MUST MODIFY LINE BELOW
        
        Invoke-Expression "& .\Login.ps1 $payload" -OutVariable out

        # 7. The payload has been sent to the login screen, and the result has been sent 
        # back to you as the variable $out.
        # * Write an if-statement that will let you know a match has been found. 
        #      HINT: The $out varialbe will equal either "Access Denied" or "Access Granted"
        # * When access is granted, write a statement to RETURN the successful payload array
        #   and stop the loop from attempting anymore payloads.
        # YOUR CODE BELOW HERE
        if ($out -match "Access Granted") {
            Write-Host "Login Successful for username $victimsUsername with the password $password"
            return $payload
        }
    ## DO NOT MODIFY BELOW    
    } 
}

#-----------------------------------------------------------[Execution]------------------------------------------------------------
# 8. Finally, you are ready to execute your function! You must store the results of the function 
# in the variable name $result to receive full credit.
#   Example: $result = <function name> argument1 argument2
# Remember to add your two arguments after calling your function. 
# You created two variables in #1 and #2 that could be reused.
# One final hint, a password match should happen in the first 15 seconds but no longer than a minute :)
# YOUR CODE BELOW HERE 

# call the function with the victim's username
$result = crackLogin -victimsUsername $victimsUsername -passwordList $passwordList

# wait up to 60 seconds for a match
$timeout = 60
$start = Get-Date
while ((Get-Date) -lt ($start.AddSeconds($timeout)) -and $result -eq $false) {
    Start-Sleep -Seconds 1
}