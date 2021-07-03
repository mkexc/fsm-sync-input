library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_fsm is
end tb_fsm;

architecture Behavioral of tb_fsm is
    component fsm is
        port(
            bi,clk,rst: in std_logic;
            bo: out std_logic
        );
    end component fsm;
    
    signal bi_s,bo_s,clk_s,rst_s: std_logic;
    constant clkper: time :=10 ns;
begin
    dut: fsm port map(bi=>bi_s,bo=>bo_s,clk=>clk_s,rst=>rst_s);
    
    process
    begin
        clk_s<='0';
        wait for clkper/2;
        clk_s<='1';
        wait for clkper/2;
    end process;

    process
    begin   
        rst_s<='1';
        wait for clkper;
        rst_s<='0'; bi_s<='0';
        wait for clkper;
        bi_s<='1';
        wait for clkper;
        bi_s<='1';
        wait for clkper;
        bi_s<='0';
        wait for clkper;
        bi_s<='1';
        wait for clkper;
        bi_s<='0';
        wait for clkper;
        wait;
    end process;
end Behavioral;
