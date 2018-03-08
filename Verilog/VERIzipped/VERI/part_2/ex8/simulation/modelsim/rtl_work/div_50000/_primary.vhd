library verilog;
use verilog.vl_types.all;
entity div_50000 is
    generic(
        BIT_SZ          : integer := 16
    );
    port(
        clock           : in     vl_logic;
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BIT_SZ : constant is 1;
end div_50000;
