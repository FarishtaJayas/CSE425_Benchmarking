f = open('E:\Codes\cse425_benchmarking\digits.txt', 'r')
my_list = f.read()
print(my_list)
length = len(my_list)

for line in my_list:
    my_list.append(line)
for i in str(length):
    for j in str(length-1):
        if my_list[j] > my_list[j+1]:
            my_list[j], my_list[j+1] = my_list[j+1], my_list[j]
            print(my_list)

f.close()