
module top(
    input           clk50,
    output          lvds_tx_locked,
    output  [3:0]   lvds_tx_out
    );

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

endmodule
