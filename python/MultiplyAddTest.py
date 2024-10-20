from fxpmath import Fxp

#Enter real and imaginary parts of A, B, and w below
#Code will convert them to the correct format for input to FFT module and print the results

Ar = 0.832
Ai = 1.0023
Br = 9.9
Bi = -3.766
wr = 0.222
wi = -0.6666

#Enter the results from simulating MultiplyAddUnit
#Code will convert them back to decimal and print them next to expected result from inputs above

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




#perform complex multiply add


a = complex(Ar, Ai)
b = complex(Br, Bi)
w = complex (wr, wi)
print("Expected results in decimal:")
print("Y: ", a+(b*w))
print("Z: ", a-(b*w), "\n")



#Convert back to complex decimal


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

