import sys

f = open(sys.argv[1], "r")
ftemp = open(sys.argv[1] + ".tmp", "w")
flag = False
for line in f:
    if line == "===========================================================\n": 
        flag = not flag
        continue

    if flag:
        i = 0
        new = ""
        flag2 = True;
        for char in line:
            if char.isdigit() and flag2:
                new += " "
            else:
                flag2 = False
                new += char
        ftemp.write(new)



f.close()
ftemp.close()
