
module top(
    input           clk50,
	input   [7:0]   lvds_rx_in0,
    input           lvds_rx_fclk0,
    input           lvds_rx_clk0,
	input   [7:0]   lvds_rx_in1,
    input           lvds_rx_fclk1,
    input           lvds_rx_clk1,
    output          lvds_tx_locked,
    output  [3:0]   lvds_tx_out,
	 
    output          dummy0,
    output          dummy1,
	 
    inout   [15:0]  ddr_dq,
    output  [1:0]   ddr_dqs,
    output  [1:0]   ddr_dm,
    output  [12:0]  ddr_a,
    output  [1:0]   ddr_ba,
    output          ddr_cas_n,
    output          ddr_ras_n,
    output          ddr_we_n,
    output  [0:0]   ddr_cke,
    output  [0:0]   ddr_cs_n,
    output  [0:0]   clk_to_sdram,
    output  [0:0]   clk_to_sdram_n,
	 
	 input 				ft_clk,
	 inout 	[15:0]	ft_data,
	 inout	[1:0]		ft_be,
	 input 				ft_txe_n,
	 input 				ft_rxf_n,
	 output 				ft_wr_n,
	 output 				ft_rd_n,
	 output 				ft_oe_n,
	 output 				ft_reset_n,
	 output 				ft_wakeup_n,
	 output 	[1:0]		ft_gpio
    );
	 
	 assign ft_data = 16'd0;

    assign  ddr_dq          = dummy0;
    assign  ddr_dqs         = dummy0;
    assign  ddr_dm          = dummy0;
    assign  ddr_a           = dummy0;
    assign  ddr_ba          = dummy0;
    assign  ddr_cas_n       = dummy0;
    assign  ddr_ras_n       = dummy0;
    assign  ddr_we_n        = dummy0;
    assign  ddr_cke         = dummy0;
    assign  ddr_cs_n        = dummy0;
    assign  clk_to_sdram    = dummy0;
    assign  clk_to_sdram_n  = dummy0;

    reg [23:0] tx_data;
    reg phase = 0;

    always @(posedge clk50) begin
        phase <= ~phase;
        if (phase==0) begin
            tx_data[5:0]    <= 6'b111100;
            tx_data[11:6]   <= 6'b101010;
            tx_data[17:12]  <= 6'b001000;
            tx_data[23:18]  <= tx_data[23:18] + 1'b1;
        end
        else begin
            tx_data[5:0]    <= 6'b000000;
            tx_data[11:6]   <= 6'b101010;
            tx_data[17:12]  <= 6'b000000;
            tx_data[23:18]  <= tx_data[23:18] + 1'b1;
        end
    end

    lvds_tx_4chan_6x    lvds_tx_4chan_6x_inst (
        .tx_in              (tx_data ),
        .tx_inclock         (clk50),
        .tx_locked          (lvds_tx_locked),
        .tx_out             (lvds_tx_out)
    );

    wire [53:0] rx_data0, rx_data1;
    wire rx_clk0, rx_clk1;

    lvds_rx_9chan_6x	lvds_rx_9chan_6x_0 (
	    .rx_data_align      ( rx_data_align0 ),
	    .rx_in              ( {lvds_rx_fclk0, lvds_rx_in0} ),
	    .rx_inclock         ( lvds_rx_clk0 ),
	    .rx_locked          ( rx_locked0 ),
	    .rx_out             ( rx_data0 ),
	    .rx_outclock        ( rx_clk0 )
	);

    lvds_rx_9chan_6x	lvds_rx_9chan_6x_1 (
	    .rx_data_align      ( rx_data_align1 ),
	    .rx_in              ( {lvds_rx_fclk1, lvds_rx_in1} ),
	    .rx_inclock         ( lvds_rx_clk1 ),
	    .rx_locked          ( rx_locked1 ),
	    .rx_out             ( rx_data1 ),
	    .rx_outclock        ( rx_clk1 )
	);

    reg rx_data_merged0, rx_data_merged1;

    always @(rx_clk0) begin
        rx_data_merged0 <= ^rx_data0;
    end

    assign dummy0 = rx_data_merged0;

    always @(rx_clk1) begin
        rx_data_merged1 <= ^rx_data1;
    end

    assign dummy1 = rx_data_merged1;

endmodule
