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
    output wire [NUMBITS-1:0] result_ripple;
    output wire [NUMBITS-1:0] carryout_ripple;

    full_adder #() first(  .a(A[0]),
                            .b(B[0]),
                            .c_in(carryin),
                            .s(result_ripple[0]),
                            .c_out(carryout_ripple[0]));

    genvar i;
    generate
        for(i=1; i<NUMBITS; i = i+1)begin
            full_adder #() ripplecont(  .a(A[i]),
                                        .b(B[i]),
                                        .c_in(carryout_ripple[i-1]),
                                        .s(result_ripple[i]),
                                        .c_out(carryout_ripple[i]));  
        end
    endgenerate

    always @(*) begin
        result <= result_ripple;
    end

endmodule
