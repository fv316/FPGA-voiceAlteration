library verilog;
use verilog.vl_types.all;
entity lfsr7 is
    port(
        enable          : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic
    );
end lfsr7;
