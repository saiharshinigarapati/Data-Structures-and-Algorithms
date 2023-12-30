import numpy as np
x = np.array([[12, 34], [22, 10]])
y = np.array([[3, 4], [2, 1]])
z = np.zeros((2, 2))
m1, m2, m3, m4, m5, m6, m7 = 0, 0, 0, 0, 0, 0, 0
print("The first matrix is: ")
for i in range(2):
    print()
    for j in range(2):
        print(x[i][j], end="\t")
print("\nThe second matrix is: ")
for i in range(2):
    print()
    for j in range(2):
        print(y[i][j], end="\t")
m1 = (x[0][0] + x[1][1]) * (y[0][0] + y[1][1])
m2 = (x[1][0] + x[1][1]) * y[0][0]
m3 = x[0][0] * (y[0][1] - y[1][1])
m4 = x[1][1] * (y[1][0] - y[0][0])
m5 = (x[0][0] + x[0][1]) * y[1][1]
m6 = (x[1][0] - x[0][0]) * (y[0][0] + y[0][1])
m7 = (x[0][1] - x[1][1]) * (y[1][0] + y[1][1])

z[0][0] = m1 + m4 - m5 + m7
z[0][1] = m3 + m5
z[1][0] = m2 + m4
z[1][1] = m1 - m2 + m3 + m6

print("\nProduct achieved using Strassen's algorithm: ")
for i in range(2):
    print()
    for j in range(2):
        print(z[i][j], end="\t")