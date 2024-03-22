	component unnamed is
		port (
			dataa  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- dataa
			datab  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datab
			n      : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- n
			result : out std_logic_vector(31 downto 0)                     -- result
		);
	end component unnamed;

	u0 : component unnamed
		port map (
			dataa  => CONNECTED_TO_dataa,  -- s1.dataa
			datab  => CONNECTED_TO_datab,  --   .datab
			n      => CONNECTED_TO_n,      --   .n
			result => CONNECTED_TO_result  --   .result
		);

