library verilog;
use verilog.vl_types.all;
entity delay is
    generic(
        idle            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        counting        : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        done            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        nstate          : integer := 3
    );
    port(
        N               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        trigger         : in     vl_logic;
        time_out        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of counting : constant is 1;
    attribute mti_svvh_generic_type of done : constant is 1;
    attribute mti_svvh_generic_type of nstate : constant is 1;
end delay;
