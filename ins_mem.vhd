----------------------------------------------------------------------------------
-- Company:MPOR 
-- Engineer:maher and ashour
-- 
-- Create Date:    15:35:52 02/14/2019 
-- Design Name: 
-- Module Name:    ins_mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_logic_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
entity ins_mem is
generic(data_width: integer:=3;
        add_bits: integer := 3);
    Port ( pc : in  STD_LOGIC_VECTOR (data_width-1 downto 0);
           instruction : out  STD_LOGIC_VECTOR (data_width-1 downto 0));
end ins_mem;

architecture Behavioral of ins_mem is
type ins_type is array (2**add_bits -1 downto 0) of std_logic_vector(data_width-1 downto 0);

constant ins_mem :ins_type :=
("000", 
 "001",
 "010",
 "011",
 "101",
 "110",
 "100",
 "111");


begin

instruction<= ins_mem(conv_integer(unsigned (pc)));
end Behavioral;

