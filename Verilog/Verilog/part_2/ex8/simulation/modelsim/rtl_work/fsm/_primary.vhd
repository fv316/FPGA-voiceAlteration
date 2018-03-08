library verilog;
use verilog.vl_types.all;
entity fsm is
    generic(
        idle            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        start_led       : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        state_start_delay: vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        Nstate          : integer := 3
    );
    port(
        clk             : in     vl_logic;
        tick            : in     vl_logic;
        trigger         : in     vl_logic;
        time_out        : in     vl_logic;
        en_lfsr         : out    vl_logic;
        start_delay     : out    vl_logic;
        ledr            : out    vl_logic_vector(9 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of start_led : constant is 1;
    attribute mti_svvh_generic_type of state_start_delay : constant is 1;
    attribute mti_svvh_generic_type of Nstate : constant is 1;
end fsm;
