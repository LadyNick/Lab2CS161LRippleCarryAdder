Name: Nicole Navarro   
email: nnava026@ucr.edu

Testbench Descriptions:
1.1: 0 + 0 = 0, c_out = 0. This is adding the 8bit values 0 and 0 which should give a result of 0 with 0 carryout.

1.2: 255 + 1 = 256, c_out = 1. This is adding the all 1's 8bit value 8'hff, 255, the max value that can be represented by 8 bits unsigned and the 8bit value 1 which would be 256, which would require 9 bits to show. In the 8 bit expected result there should be a 0, and the carryout bit should be 1 because of the overflow.

1.3: 11 + 11 = 22, c_out = 0. This is adding 2 8'h0B values to get 8'h16 in the result output with a carryout of 0, because 22 is less than 256.

1.4: 213 + 100 = 313, c_out = 1. This is adding the 8bit values 8'hD5 and 8'h64 which would give us a result of 313, which requires 9 bits because it is greater than 256. Therefore, the expected remaining 8 bits in the result should be 8'h39 which is a decimal 57, and there should be a carryout, so the carryout bit should be 1.

2.1: 65535 + 1 = 65536, c_out = 1. This is testing going 1 over the max value for a system of 16 bits adding 16 1's with another binary 1. This results with a 16bit 0 and a carryout of 1.

2.2: 4294967295 + 1 = 4294967296, c_out = 1. This is testing going 1 over the max value for a system of 32 bits adding 32 1's with another binary 1. This results with a 32bit 0 and a carryout of 1.

2.3: 340282366920938463463374607431768211455 + 1 = 340282366920938463463374607431768211456, c_out = 1. This is testing going 1 over the max value for a system of 128 bits adding 128 1's with another binary 1. This results with a 128bit 0 and a carryout of 1.

Waveform Screenshot:
I guessed that it would take 64 bits for it to fail but I added a testcase for 128 bits in case I was wrong. It looks like it already fails at 16 bits.

![waveform](cs161lab2waveform.png)