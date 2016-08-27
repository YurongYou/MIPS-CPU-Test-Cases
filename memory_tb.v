`include "../define.v"
`include "memory.v"
module rom_tb;
	reg 						rst;
	reg 						ce;
	reg[`MemDataWidth-1:0]		data;
	reg[`MemAddrWidth-1:0]		addr;
	reg							we;
	reg[`ByteSlctWidth-1:0]		byte_slct;
	wire[`MemDataWidth-1:0]		data_o;

	memory #(.MemoryDataNum(32)) test_momory(
		.rst(rst),
		.ce(ce),
		.data_i(data),
		.addr_i(addr),
		.we(we),
		.byte_slct(byte_slct),
		.data_o(data_o)
	);

	reg[5:0] i;
	initial begin : memory_test
		$dumpfile("vcd/memory_tb.vcd");
		$dumpvars;
		$readmemb("testData/data.data", test_momory.mem_data);
		$display("time\taddr\tinst");
		rst = ~`RstEnable;

		for (i = 0; i < 32; i = i + 1) begin
			#1 ce = `ChipEnable;
			addr = i << 2;
			#1 $display("%2d\t%d\t%32b", $time, addr, data_o);
			ce = ~`ChipEnable;
		end
		rst = `RstEnable;
		#1 $display("==============================================================");
		rst = ~`RstEnable;
		for (i = 0; i < 32; i = i + 1) begin
			#1 ce = `ChipEnable;
			addr = i << 2;
			#1 $display("%2d\t%d\t%32b", $time, addr, data_o);
			ce = ~`ChipEnable;
		end
		#1 $display("==============================================================");
		for (i = 0; i < 32; i = i + 1) begin
			addr = i << 2;
			data = 32'b11111111111111111111111111111111;
			byte_slct = 4'b110;
			#1 we = `WriteEnable;
			#1 we = ~`WriteEnable;
		end
		for (i = 0; i < 32; i = i + 1) begin
			#1 ce = `ChipEnable;
			addr = i << 2;
			#1 $display("%2d\t%d\t%32b", $time, addr, data_o);
			ce = ~`ChipEnable;
		end
		#1 $display("==============================================================");
		for (i = 0; i < 32; i = i + 1) begin
			addr = i << 2;
			data = 32'b11111111111111111111111111111111;
			byte_slct = 4'b0001;
			#1 we = `WriteEnable;
			#1 we = ~`WriteEnable;
		end
		for (i = 0; i < 32; i = i + 1) begin
			#1 ce = `ChipEnable;
			addr = i << 2;
			#1 $display("%2d\t%d\t%32b", $time, addr, data_o);
			ce = ~`ChipEnable;
		end
		$finish;
	end
endmodule