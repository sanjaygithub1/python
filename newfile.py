num= input("Enter a number: ")
num=int(num)
if num%2==0:
    print ("the given number is Even")
else:
    print("the given number is Odd")
indian=["samosa", "daal"]
chinese=["egg role", "manchurian"]

dish=input("Enter dish name: ")
if dish in indian:
    print("dish is indian")
elif dish in chinese:
    print("dish is chinese")
else:
    print("unknown dish")

exp=[1000, 2000, 3000]
total=0
for item in exp:
    total = total + item

print(total)


for i in range(1,12):
 print(i)