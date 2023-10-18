# Example of reading input from the user and determining what type of data it is?
userInput = input("Enter a number: ") #Input is a way to get user input in Python
print(type(userInput)) #Type function() is a way to get the object type

x = 10
y = x+int(userInput) #Error?   
print(y)

#Casting an int to a float, then a float to an int
int1 = 20
print(type(int1))
print(float(int1))
print(type(int1))

int1 = float(int1)
int1 = int(int1)
print(int1)

