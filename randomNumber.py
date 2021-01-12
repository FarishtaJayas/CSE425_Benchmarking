import random
import os

afile = open("numbers.txt", "w" )

for i in range(0, 100000):
    line = str(random.randint(0, 100000))+"\n"
    afile.write(line)
    print(line)

afile.close()