// SPDX-FileCopyrightText: 2022 Subash Polisetty
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
// SPDX-FileContributor: Subash Polisetty (subash92.16@gmail.com)

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is a 8-bit Universal shift register that performs multiple operations based on ctrlIn
 *
 * ctrlIn[0]    |    ctrlIn[1]   |    Operation        
 *     0        |        0       |    Parallel Load
 *     0        |        1       |    Right shift
 *     1        |        0       |    Left shift
 *     1        |        1       |    Serial input
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    universal_shift_register #(
            .BITS(8)
    ) universal_shift_register(
            .clk(wb_clk_i),                //input clock
            .reset(wb_rst_i),              //input reset
			.dataIn(io_in[15:8]),          //input data, where data[0] can be used as serial input with ctrlIn = 11
            .ctrlIn(io_in[6:5]),           //input to select the type of operation
            .regOut(io_out[37:30]),        //output of the shift register
            .outValid(io_oeb[29])
    );

endmodule

`default_nettype wire
