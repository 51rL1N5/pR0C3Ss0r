library ieee;
use ieee.std_logic_1164.all;


entity subtractor4bits is
	port
	(
		A     : in std_logic_vector (3 downto 0);
		B     : in std_logic_vector (3 downto 0);
		S     : out std_logic_vector (3 downto 0)
	);
end entity;


architecture hardware of subtractor4bits is
	component adder4bits is
		port 
		(
			A     : in std_logic_vector (3 downto 0);
			B     : in std_logic_vector (3 downto 0);
			cin   : in std_logic;
			S     : out std_logic_vector (3 downto 0);
			carry : out std_logic	 
		);
	end component;
	
	signal void : std_logic;
	
begin
	
	Add0: adder4bits port map(A => A, B => not B, cin => '1', S => S, carry => void );
end hardware;