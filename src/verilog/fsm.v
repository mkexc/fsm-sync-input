`timescale 1ns / 1ps

module fsm(
    clk,rst,bi,bo
    );
    
    input clk,rst,bi;
    output reg bo;
    
    parameter S_wait=0,S_on=1,S_off=2;
    reg [1:0] state,nextState;
    
    always @(posedge clk)
    begin
        if(rst==1)
        begin
            state<=S_wait;
        end
        else 
        begin
            state<=nextState;
        end
    end
    
    always @(state,bi)
    begin
        case (state) 
            S_wait: begin
                        bo<=1'b0;
                        if(bi==1) begin
                            nextState<=S_on;
                        end
                        else begin
                            nextState<=S_wait;
                        end
                    end
            S_on: begin
                        bo<=1'b1;
                        if(bi==1) begin
                            nextState<=S_off;
                        end
                        else begin
                            nextState<=S_wait;
                        end
                    end
            S_off: begin
                        bo<=1'b0;
                        if(bi==1) begin
                            nextState<=S_off;
                        end
                        else begin
                            nextState<=S_wait;
                        end
                    end
        endcase
        
    end
    
endmodule
