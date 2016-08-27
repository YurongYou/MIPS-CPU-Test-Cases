// `include "../define.v"
module rom (
	input							rst,
	input 							ce,
	input[`InstAddrWidth-1:0]		addr,

	output reg[`InstDataWidth-1:0]	inst
);

	parameter InstMemNum 	 = 2048;

	reg[`InstDataWidth-1:0]		rom_data[InstMemNum-1:0];

	always @(*) begin : proc_reset
		integer i;
		if (rst == `RstEnable) begin
			for (i = 0; i < InstMemNum; i = i + 1)
				rom_data[i] <= `ZeroWord;
		end
	end
	always @(*) begin : proc_read_inst
		if (ce == `ChipEnable && rst == ~`RstEnable)
			inst <= rom_data[addr >> 2];
		else
			inst <= `ZeroWord;
	end
endmodule