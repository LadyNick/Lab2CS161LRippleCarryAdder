//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Nicole Navarro
// Email: nnava026@ucr.edu
// 
// Assignment name: Lab 2: Ripple Carry Adder
// Lab section: 021
// TA: Jincong Lu 
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

`timescale 1ns / 1ps

//  Constant definitions 

module ripple_carry_adder # ( parameter NUMBITS = 16 ) (
    input  wire[NUMBITS-1:0] A, 
    input  wire[NUMBITS-1:0] B, 
    input wire carryin, 
    output reg [NUMBITS-1:0] result,  
    output reg carryout); 

    // ------------------------------
    // Insert your solution below
    // ------------------------------ 


    full_adder #(.NUMBITS(1)) first(  .A(A[0]),
                                        .B(B[0]),
                                        .c_in(carryin),
                                        .s(result[0])
                                        .c_out(carryout));

    genvar i;
    generate
        for(i=2; i<NUMBITS; i = i+1)begin
            full_adder #(.NUMBITS(i)) ripplecont(  .A(A[i]),
                                                .B(B[i]),
                                                .c_in(carryout),
                                                .s(result[i])
                                                .c_out(carryin));
            
        end
    endgenerate




endmodule
