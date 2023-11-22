module RAM_1(clk,chip_s,w_en,o_en,r_en,data_out,data_in,address);
input clk,chip_s,w_en,o_en,r_en;
input [4:0]address;
input [7:0] data_in;
output [7:0] data_out;
reg [7:0] memory[31:0];
reg [7:0] temp_data;

always@(posedge clk)
begin
if(chip_s & w_en& !r_en) 
  memory[address]<=data_in;
end

always@(posedge clk)
begin
if(chip_s& r_en & !w_en)
  temp_data<=memory[address];

end

assign data_out=chip_s& o_en &r_en ? temp_data:1;

endmodule
