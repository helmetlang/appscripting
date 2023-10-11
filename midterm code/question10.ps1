# Define user information using a hashtable
$userInfo = @{
    FirstName = "Nigel"
    LastName = "Nighthawk"
    Address = "3820 Mundy Mill Rd"
    City = "Oakwood"
    State = "Georgia"
}

# Function to print user information
function Print-UserInfo($info) {
    Write-Host "### User Information ###"
    Write-Host "First Name: $($info.FirstName)"
    Write-Host "Last Name: $($info.LastName)"
    Write-Host "Address: $($info.Address)"
    Write-Host "City: $($info.City)"
    Write-Host "State: $($info.State)"
}

# Call the function to print user information
Print-UserInfo $userInfo
