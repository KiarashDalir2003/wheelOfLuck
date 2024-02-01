library verilog;
use verilog.vl_types.all;
entity Counter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        inputBit        : in     vl_logic;
        score           : out    vl_logic_vector(3 downto 0)
    );
end Counter;
