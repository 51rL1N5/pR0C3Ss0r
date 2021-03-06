-- Bin2BCD
--	
-- 8bits input
-- Output: tens and ones
--

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BinToBCD_8bits is 
	port
	(
		input :  in std_logic_vector(7 downto 0);
		tens  : out std_logic_vector(3 downto 0);
		ones  : out std_logic_vector(3 downto 0)
	);
end binToBCD_8bits;


architecture behavior of BinToBCD_8bits is 

signal hundreds : std_logic_vector(3 downto 0);

begin
	
	
bcd1: process(input)	
			variable temp : std_logic_vector(7 downto 0);
			variable BCD  : unsigned(15 downto 0) := (others => '0');
			
		begin 
			bcd := (others => '0');
			
			temp(7 downto 0) := input; 
		
		for i in 0 to 7 loop  
			if bcd(3 downto 0) > 4 then 
			  bcd(3 downto 0) := bcd(3 downto 0) + 3;
			end if;
			
			if bcd(7 downto 4) > 4 then 
			  bcd(7 downto 4) := bcd(7 downto 4) + 3;
			end if;
			  
			bcd := bcd(14 downto 0) & temp(11);
		 
			temp := temp(10 downto 0) & '0';
		 
		 end loop;
		 
		ones <= STD_LOGIC_VECTOR(bcd(3 downto 0));
		tens <= STD_LOGIC_VECTOR(bcd(7 downto 4));
		
		end process bcd1;

end behavior;