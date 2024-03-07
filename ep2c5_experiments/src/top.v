module top(
    input wire          clk50,
    input wire          clk50_dup,
    output wire [2:0]   leds,
    output wire         clk50_out, 
    output wire         clk50_out2, 
	 output wire         clk100_out,
    output wire         clk200_out,
    output wire         clk250_out,	 
    input wire          lvds_rx_in,
    output wire         rx_result
    );

    reg [23:0] cntr = 0;


    always @(posedge clk50) begin
        cntr <= cntr + 1;
    end

    assign leds = ~cntr[23:21];
    assign clk50_out = clk50;
    assign clk50_out2 = clk50;

    pll50_200	pll50_200_inst (
	    .inclk0     (clk50),
	    .c0         (clk200_out),
	    .c1         (clk250_out),
		 .c2         (clk100_out)
	);


    lvds_rx	lvds_rx_inst (
	    .rx_in      ( lvds_rx_in ),
	    .rx_inclock ( clk50_dup ),
	    .rx_out     ( rx_out_sig ),
	    .rx_outclock( rx_outclock_sig )
	);

    reg rx_reg;

    always @(posedge rx_outclock_sig) begin
        rx_reg <= rx_out_sig;
    end

    assign rx_result = rx_reg;

	 
endmodule
