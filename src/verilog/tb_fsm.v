`timescale 10 ns/10 ps

module tb_fsm();

    reg clk_s,rst_s,bi_s;
    wire bo_s;
    
    fsm dut(clk_s,rst_s,bi_s,bo_s);
    
    always
    begin
        clk_s<=0;
        #5;
        clk_s<=1;
        #5;
    end
    
    initial
    begin
        rst_s<=1'b1;
        @(posedge(clk_s));
        #5 rst_s<=1'b0; bi_s<=1'b0;
        @(posedge(clk_s));
        #5; bi_s<=1'b1;
        @(posedge(clk_s));
        #5; bi_s<=1'b1;
        @(posedge(clk_s));
        #5; bi_s<=1'b0;
        @(posedge(clk_s));
        #5; bi_s<=1'b0;
        @(posedge(clk_s));
        #5; bi_s<=1'b0;
        @(posedge(clk_s));
        #5; bi_s<=1'b1;
        @(posedge(clk_s));
        #5; bi_s<=1'b1;
        @(posedge(clk_s));
        #5; bi_s<=1'b1;
        
    end

endmodule