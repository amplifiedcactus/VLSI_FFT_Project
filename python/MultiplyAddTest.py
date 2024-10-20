from fxpmath import Fxp

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


#print(a*b)

# max output of first stage:
# A and B Inputs and w are <= 1 but complex,
# so B*w max is 2, A+B*w max is 3, max output of first stage is 3
# 2nd stage B*w max is 6, A+B*w max is 9
# 3rd stage B*w max is 18, A+B*w max is 27
# 4th stage B*w max is 54, A+B*w max is 81, but actual output of FFT should be 16 or less



Ar = 0.832
Ai = 1.0023
Br = 9.9
Bi = -3.766
wr = 0.222
wi = -0.6666

Yout = 0x0212e64b
Zout = 0x049421b9

#python hex function doesnt work for negative numbers
def tohex(val, nbits):
    return (val + (1 << nbits)) % (1 << nbits)

#convert complex decimal number to 2 Q6.10 fixed point twos complement binary numbers
#then convert that to 32bit hexadecimal, where real part is 16 MSBs and imaginary part is 16 LSBs
def decimalToFixedPoint(r, i):
    x = Fxp(r, signed=True, n_word=16, n_frac=10)
    y = Fxp(i, signed=True, n_word=16, n_frac=10)
    return hex(((tohex(x.val, 16) << 16) ^ tohex(y.val, 16)))

print("Inputs:")
print("A: ", decimalToFixedPoint(Ar,Ai))
print("B: ", decimalToFixedPoint(Br,Bi))
print("w: ", decimalToFixedPoint(wr,wi), "\n")

#print(hex(tohex(x.val, 16)))
#print(hex(tohex(y.val, 16)))
#print(hex(((tohex(x.val, 16) << 16) ^ tohex(y.val, 16))))


#perform complex multiply add


a = complex(Ar, Ai)
b = complex(Br, Bi)
w = complex (wr, wi)
print("Expected results in decimal:")
print("Y: ", a+(b*w))
print("Z: ", a-(b*w), "\n")



#Convert back to complex decimal
#out = 0x07fb1803

def twos_complement_to_int(bin_num, num_bits):
    # Check if the number is negative by examining the most significant bit (MSB)
    if (bin_num & (1 << (num_bits - 1))) != 0:  # MSB is 1, meaning it's negative
        # Convert to negative by subtracting from 2^num_bits
        int_value = bin_num - (1 << num_bits)
    else:
        # Positive number, no adjustment needed
        int_value = bin_num
    
    return int_value

def backToDecimal(out):
    outr = out >> 16
    outi = out & 0x0000FFFF
    return complex(twos_complement_to_int(outr, 16)/1024, twos_complement_to_int(outi, 16)/1024)
    #print(twos_complement_to_int(outr, 16)/1024)
    #print(twos_complement_to_int(outi, 16)/1024)

print("Actual results:")
print("Y: ", backToDecimal(Yout))
print("Z: ", backToDecimal(Zout))


#code below doesn't work unfortunately
#n = Fxp(0, signed=False, n_word=16, n_frac=10)
#m = Fxp(0, signed=False, n_word=16, n_frac=10)
#n.val = outr
#m.val = outi




#Divide by 2^ number of bits in fractional part to get integer
#print(twos_complement_to_int(outr, 16)/1024)
#print(twos_complement_to_int(outi, 16)/1024)

