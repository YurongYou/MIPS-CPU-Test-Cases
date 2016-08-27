module memory (
	input							rst,
	input							ce,
	input[`MemDataWidth-1:0]		data_i,
	input[`MemAddrWidth-1:0]		addr_i,
	input							we,
	input[`ByteSlctWidth-1:0]		byte_slct,

	`ifdef DEBUG
	output reg[`MemDataWidth-1:0]	data_o,

	output[`MemDataWidth-1:0]		mem0,
	output[`MemDataWidth-1:0]		mem1,
	output[`MemDataWidth-1:0]		mem2,
	output[`MemDataWidth-1:0]		mem3,
	output[`MemDataWidth-1:0]		mem4,
	output[`MemDataWidth-1:0]		mem5,
	output[`MemDataWidth-1:0]		mem6,
	output[`MemDataWidth-1:0]		mem7,
	output[`MemDataWidth-1:0]		mem8
	`endif
	`ifndef DEBUG
	output reg[`MemDataWidth-1:0]	data_o
	`endif
);
	`ifdef DEBUG
	assign mem0 = mem_data[0];
	assign mem1 = mem_data[1];
	assign mem2 = mem_data[2];
	assign mem3 = mem_data[3];
	assign mem4 = mem_data[4];
	assign mem5 = mem_data[5];
	assign mem6 = mem_data[6];
	assign mem7 = mem_data[7];
	assign mem8 = mem_data[8];
	`endif
	parameter					MemoryDataNum = 2048;
	reg[`MemDataWidth-1:0]		mem_data[MemoryDataNum-1:0];

	wire[7:0]					mem_byte_0;
	wire[7:0]					mem_byte_1;
	wire[7:0]					mem_byte_2;
	wire[7:0]					mem_byte_3;
	wire[`MemDataWidth-1:0]		data_temp;

	assign mem_byte_3 = (byte_slct[3] == 1'b1) ? data_i[31:24] : mem_data[addr_i >> 2][31:24];
	assign mem_byte_2 = (byte_slct[2] == 1'b1) ? data_i[23:16] : mem_data[addr_i >> 2][23:16];
	assign mem_byte_1 = (byte_slct[1] == 1'b1) ? data_i[15:8] : mem_data[addr_i >> 2][15:8];
	assign mem_byte_0 = (byte_slct[0] == 1'b1) ? data_i[7:0] : mem_data[addr_i >> 2][7:0];
	// always @(*) begin
	// 	mem_byte_3 <= (byte_slct[3] == 1'b1) ? data_i[31:24] : mem_data[addr_i >> 2][31:24];
	// 	mem_byte_2 <= (byte_slct[2] == 1'b1) ? data_i[23:16] : mem_data[addr_i >> 2][23:16];
	// 	mem_byte_1 <= (byte_slct[1] == 1'b1) ? data_i[15:8] : mem_data[addr_i >> 2][15:8];
	// 	mem_byte_0 <= (byte_slct[0] == 1'b1) ? data_i[7:0] : mem_data[addr_i >> 2][7:0];
	// end
	assign data_temp  = {mem_byte_3, mem_byte_2, mem_byte_1, mem_byte_0};
	// reset
	always @(*) begin : proc_reset
		integer i;
		if (rst == `RstEnable) begin
			for (i = 0; i < MemoryDataNum; i = i + 1)
				mem_data[i] <= `ZeroWord;
		end
	end

	// write operation
	always @ (*) begin
		if (rst == ~`RstEnable && we == `WriteEnable)
			#0.1 mem_data[addr_i >> 2] <= data_temp;
	end

	// read operation
	always @ (*) begin
		if (rst == ~`RstEnable && ce == `ChipEnable)
			data_o <= mem_data[addr_i >> 2];
		else
			data_o <= `ZeroWord;
	end
endmodule