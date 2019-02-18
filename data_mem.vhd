----------------------------------------------------------------------------------
-- Company: mpor
-- Engineer: Ashour
-- 
-- Create Date:    21:10:10 02/14/2019 
-- Design Name: 
-- Module Name:    data_mem - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity data_mem is
generic( data_width: integer:=8;
          add_width: integer :=8);
    Port ( address : in  STD_LOGIC_VECTOR (add_width-1 downto 0);
           data : inout  STD_LOGIC_VECTOR (data_width-1 downto 0);
           cs : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           we : in  STD_LOGIC;
           clck : in  STD_LOGIC);
end data_mem;

architecture Behavioral of data_mem is
type ram is array (integer range<>) of std_logic_vector(data_width-1 downto 0);
constant ram_depth: integer := 2** add_width;
signal mem : ram (ram_depth-1 downto 0);
signal data_out :STD_LOGIC_VECTOR (data_width-1 downto 0);
begin
--- write data  we=1, cs=1
Write_data:process(clck)
begin
if (rising_edge(clck)) then
   if (we='1' and cs='1') then
	  mem(conv_integer(unsigned(address)))<= data;
	 end if;
end if;
end process;

--- read data oe=1 , cs=1
Read_data:process(clck)
begin
if (rising_edge(clck)) then
   if ( cs='1' and oe='1') then
	  data_out<=mem(conv_integer(unsigned(address)));
	  
	 end if;
end if;
end process;
data<= data_out when ( cs='1' and oe='1') else
       (others=>'Z');
end Behavioral;

