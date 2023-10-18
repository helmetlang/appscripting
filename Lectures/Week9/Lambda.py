#Using a function to perofrm a procedure
def square(num):
    return num**2
    
print("Square function:",square(4))




#Examples of Lambda (Quick functions)
squareLambda = lambda num: num**2
print("Square function using lambda:",squareLambda(4))


sum = lambda arg1, arg2: arg1 + arg2;

# Now you can call sum as a function
print("Value of total : ", sum( 10, 20 ))
print("Value of total : ", sum( 20, 20 ))
