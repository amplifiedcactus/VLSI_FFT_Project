A = bin(0xA2095A20)
B = bin(0xD64882D5)
w = bin(0x1D8B6621)


A1 = complex(int(A[:18], 2), int(A[18:], 2))
B1 = complex(int(B[:18], 2), int(B[18:], 2))
w1 = complex(int(w[:18], 2), int(w[18:], 2))

Y = (B1*w1)

# print(hex(int(Y.real)))
# print(hex(int(Y.imag)))
# print(int(Y.real))
# print(int(Y.imag))

# print(A[18:])
# print(hex(int(A[18:], 2)))
# print(hex(int(A[:18], 2)))

s = 0b01101100
t = 0b10011000
print(bin(s*t))
