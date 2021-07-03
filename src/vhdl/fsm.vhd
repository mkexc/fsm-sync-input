library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
    port(
        bi,clk,rst: in std_logic;
        bo: out std_logic
    );
end fsm;

architecture Moore of fsm is
    type stateType is (S_wait,S_on,S_off);
    signal currState,nextState: stateType;
    
begin
    reg: process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst='1') then
                currState<=S_wait;
            else
                currState<=nextState;
            end if;
        end if;
    end process reg;
    
    comb: process(bi,currState) 
    begin
    bo<='0';
        case currState is
            when S_wait => if(bi='1') then
                            nextState<=S_on;
                           else
                            nextState<=S_wait;
                           end if;
            when S_on => if(bi='1') then
                            nextState<=S_off;
                           else
                            nextState<=S_wait;
                           end if;
                           bo<='1';
            when S_off => if(bi='1') then
                            nextState<=S_off;
                           else
                            nextState<=S_wait;
                           end if;
            when others => nextState<=S_wait;
        end case;
    end process comb;

end Moore;
