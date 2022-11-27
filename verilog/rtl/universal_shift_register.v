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


module universal_shift_register #(
    parameter BITS = 8
)(
    input             clk,
    input             reset,
    input  [BITS-1:0] dataIn,
	input  [BITS-1:0] ctrlIn,
    output [BITS-1:0] regOut,
    output            outValid
);
    wire selOut1;
    wire selOut2;
    wire selOut3;
    wire selOut4;
    wire selOut5;
    wire selOut6;
    wire selOut7;
    wire selOut8;

    wire [BITS-1:0] dOut;

	assign regOut = dOut;
	assign outValid = (dOut >= 8'd0)? 1'b1: 1'b0;

    //Block 1
    mux_4_1 slector1 (
        .in({dataIn[0], dOut[1], dOut[7], dataIn[0]}),
        .sel(ctrlIn),
        .muxOut(selOut1)
    );

    dFilpFlop D1 (
        .clk(clk),
        .rst(reset),
        .din(selOut1),
        .dout(dOut[0])
    );

    //Block 2
    mux_4_1 slector2 (
        .in({dataIn[1], dOut[2], dOut[0], dOut[0]}),
        .sel(ctrlIn),
        .muxOut(selOut2)
    );

    dFilpFlop D2 (
        .clk(clk),
        .rst(reset),
        .din(selOut2),
        .dout(dOut[1])
    );

    //Block 3
    mux_4_1 slector3 (
        .in({dataIn[2], dOut[3], dOut[1], dOut[1]}),
        .sel(ctrlIn),
        .muxOut(selOut3)
    );

    dFilpFlop D3 (
        .clk(clk),
        .rst(reset),
        .din(selOut3),
        .dout(dOut[2])
    );

    //Block 4
    mux_4_1 slector4 (
        .in({dataIn[3], dOut[4], dOut[2], dOut[2]}),
        .sel(ctrlIn),
        .muxOut(selOut4)
    );

    dFilpFlop D4 (
        .clk(clk),
        .rst(reset),
        .din(selOut4),
        .dout(dOut[3])
    );

    //Block 5
    mux_4_1 slector5 (
        .in({dataIn[4], dOut[5], dOut[3], dOut[3]}),
        .sel(ctrlIn),
        .muxOut(selOut5)
    );

    dFilpFlop D5 (
        .clk(clk),
        .rst(reset),
        .din(selOut5),
        .dout(dOut[4])
    );

    //Block 6
    mux_4_1 slector6 (
        .in({dataIn[5], dOut[6], dOut[4], dOut[4]}),
        .sel(ctrlIn),
        .muxOut(selOut6)
    );

    dFilpFlop D6 (
        .clk(clk),
        .rst(reset),
        .din(selOut6),
        .dout(dOut[5])
    );

    //Block 7
    mux_4_1 slector7 (
        .in({dataIn[6], dOut[7], dOut[5], dOut[5]}),
        .sel(ctrlIn),
        .muxOut(selOut7)
    );

    dFilpFlop D7 (
        .clk(clk),
        .rst(reset),
        .din(selOut7),
        .dout(dOut[6])
    );

    //Block 8
    mux_4_1 slector8 (
        .in({dataIn[7], dOut[0], dOut[6], dOut[6]}),
        .sel(ctrlIn),
        .muxOut(selOut8)
    );

    dFilpFlop D8 (
        .clk(clk),
        .rst(reset),
        .din(selOut8),
        .dout(dOut[7])
    );


endmodule
