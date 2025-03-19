----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2024 12:32:49
-- Design Name: 
-- Module Name: Proiect - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Proiect is
Port 
    ( 
    clk_in : in  std_logic; 
    selectie : in std_logic;
    reset_in : in  STD_LOGIC; 
    Data_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Proiect;

architecture Behavioral of Proiect is

Signal clock:std_logic;
Signal a : std_logic_vector(3 downto 0);
Signal gray: std_logic_vector(3 downto 0);

begin

    process(clk_in) 
    	variable  n : integer range 0 to 1000000000; 
    begin 
        if clk_in'event and clk_in='1' then 
            if n < 100000000 then 
                n := n+1; 
            else 
                n := 0;  
            end if; 
            if n <= 50000000 then 
                clock <= '1'; 
            else
                clock <= '0'; 
            end if; 
        end if; 
    end process;
    
    process( clock , selectie , reset_in ) 
    begin 
        if reset_in = '1' then        --1 
            a <= (others => '0'); 
        elsif (clock'event and clock = '1') then   
            a<=a+1;
            if selectie = '1' then             --2 
                --a <=  a + 1; 
                Data_out <= a;
            elsif selectie = '0' then           
                gray(3)<=a(3);
                gray(2)<=a(3) xor a(2);
                gray(1)<= a(2) xor a(1);
                gray(0)<= a(1) xor a(0);
                Data_out<=gray;
            end if;                         --2 
        end if;
        
    end process;
     
end Behavioral;
