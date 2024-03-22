	component unsaved is
		port (
			atan2_a_external_connection_export      : out std_logic_vector(31 downto 0);                    -- export
			atan2_b_external_connection_export      : out std_logic_vector(31 downto 0);                    -- export
			atan2_q_external_connection_export      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			clk_clk                                 : in  std_logic                     := 'X';             -- clk
			i2c_busy_external_connection_export     : in  std_logic                     := 'X';             -- export
			i2c_dev_addr_external_connection_export : out std_logic_vector(7 downto 0);                     -- export
			i2c_en_external_connection_export       : out std_logic;                                        -- export
			i2c_miso_external_connection_export     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			i2c_mosi_external_connection_export     : out std_logic_vector(7 downto 0);                     -- export
			i2c_reg_addr_external_connection_export : out std_logic_vector(7 downto 0);                     -- export
			i2c_rst_external_connection_export      : out std_logic;                                        -- export
			i2c_rw_external_connection_export       : out std_logic;                                        -- export
			in_l_external_connection_export         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			led_external_connection_export          : out std_logic_vector(9 downto 0);                     -- export
			out0_external_connection_export         : out std_logic_vector(31 downto 0);                    -- export
			out1_external_connection_export         : out std_logic_vector(31 downto 0);                    -- export
			reset_reset_n                           : in  std_logic                     := 'X';             -- reset_n
			sample_clk_external_connection_export   : out std_logic;                                        -- export
			btn_external_connection_export          : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			hex_0_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			hex_1_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			hex_2_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			hex_3_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			hex_4_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			hex_5_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			sw_external_connection_export           : in  std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			atan2_a_external_connection_export      => CONNECTED_TO_atan2_a_external_connection_export,      --      atan2_a_external_connection.export
			atan2_b_external_connection_export      => CONNECTED_TO_atan2_b_external_connection_export,      --      atan2_b_external_connection.export
			atan2_q_external_connection_export      => CONNECTED_TO_atan2_q_external_connection_export,      --      atan2_q_external_connection.export
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                              clk.clk
			i2c_busy_external_connection_export     => CONNECTED_TO_i2c_busy_external_connection_export,     --     i2c_busy_external_connection.export
			i2c_dev_addr_external_connection_export => CONNECTED_TO_i2c_dev_addr_external_connection_export, -- i2c_dev_addr_external_connection.export
			i2c_en_external_connection_export       => CONNECTED_TO_i2c_en_external_connection_export,       --       i2c_en_external_connection.export
			i2c_miso_external_connection_export     => CONNECTED_TO_i2c_miso_external_connection_export,     --     i2c_miso_external_connection.export
			i2c_mosi_external_connection_export     => CONNECTED_TO_i2c_mosi_external_connection_export,     --     i2c_mosi_external_connection.export
			i2c_reg_addr_external_connection_export => CONNECTED_TO_i2c_reg_addr_external_connection_export, -- i2c_reg_addr_external_connection.export
			i2c_rst_external_connection_export      => CONNECTED_TO_i2c_rst_external_connection_export,      --      i2c_rst_external_connection.export
			i2c_rw_external_connection_export       => CONNECTED_TO_i2c_rw_external_connection_export,       --       i2c_rw_external_connection.export
			in_l_external_connection_export         => CONNECTED_TO_in_l_external_connection_export,         --         in_l_external_connection.export
			led_external_connection_export          => CONNECTED_TO_led_external_connection_export,          --          led_external_connection.export
			out0_external_connection_export         => CONNECTED_TO_out0_external_connection_export,         --         out0_external_connection.export
			out1_external_connection_export         => CONNECTED_TO_out1_external_connection_export,         --         out1_external_connection.export
			reset_reset_n                           => CONNECTED_TO_reset_reset_n,                           --                            reset.reset_n
			sample_clk_external_connection_export   => CONNECTED_TO_sample_clk_external_connection_export,   --   sample_clk_external_connection.export
			btn_external_connection_export          => CONNECTED_TO_btn_external_connection_export,          --          btn_external_connection.export
			hex_0_external_connection_export        => CONNECTED_TO_hex_0_external_connection_export,        --        hex_0_external_connection.export
			hex_1_external_connection_export        => CONNECTED_TO_hex_1_external_connection_export,        --        hex_1_external_connection.export
			hex_2_external_connection_export        => CONNECTED_TO_hex_2_external_connection_export,        --        hex_2_external_connection.export
			hex_3_external_connection_export        => CONNECTED_TO_hex_3_external_connection_export,        --        hex_3_external_connection.export
			hex_4_external_connection_export        => CONNECTED_TO_hex_4_external_connection_export,        --        hex_4_external_connection.export
			hex_5_external_connection_export        => CONNECTED_TO_hex_5_external_connection_export,        --        hex_5_external_connection.export
			sw_external_connection_export           => CONNECTED_TO_sw_external_connection_export            --           sw_external_connection.export
		);

