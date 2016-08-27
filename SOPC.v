`timescale 1ns/100ps
`define DEBUG 1
`define RegDataWidth	32
`define ByteSlctWidth	4
`define MemAddrWidth	32
`define MemDataWidth	32
`define InstAddrWidth	32
`define InstDataWidth	32
`define RstEnable		1'b1
`define ZeroWord		32'b0
`define ChipEnable		1'b1
`define WriteEnable		1'b1


`include "rom.v"
`include "memory.v"
module SOPC;
	reg 						clk;
	reg 						rst;

	wire[`RegDataWidth-1:0]		data_from_mem;
	wire[`MemAddrWidth-1:0]		mem_addr;
	wire[3:0]					mem_byte_slct;
	wire[`RegDataWidth-1:0]		data_to_write_mem;
	wire						mem_we;
	wire						mem_re;
	wire[`InstDataWidth-1:0] 	inst_from_rom;
	wire[`InstAddrWidth-1:0] 	rom_addr;
	wire						rom_ce;

	supply1 					vcc;
	supply0 					gnd;

	/*
		insert your CPU here, for example
		pipeline_CPU CPU(
			.clk(clk),
			.rst(rst),
			.data_from_mem(data_from_mem),
			.mem_addr(mem_addr),
			.mem_byte_slct(mem_byte_slct),
			.data_to_write_mem(data_to_write_mem),
			.mem_we(mem_we),
			.mem_re(mem_re),
			.inst_from_rom(inst_from_rom),
			.rom_addr(rom_addr),
			.rom_ce(rom_ce)
		);
	 */

	rom ROM(
		.rst(gnd),
		.ce(rom_ce),
		.addr(rom_addr),
		.inst(inst_from_rom)
	);

	memory RAM(
		.rst(rst),
		.ce(mem_re),
		.data_i(data_to_write_mem),
		.addr_i(mem_addr),
		.we(mem_we),
		.byte_slct(mem_byte_slct),
		.data_o(data_from_mem)
	);
	initial begin
		clk = 1;
		forever #1 clk = ~clk;
	end
	initial begin
		$dumpfile(/* input path to dump the waveform file */);
		$dumpvars;
		$readmemh(/* choose which case you want to test*/, ROM.rom_data, 0, /* #line of the rom data - 1*/);
		rst = `RstEnable;
		#3 rst = ~`RstEnable;
		#60 $finish;
	end
endmodule