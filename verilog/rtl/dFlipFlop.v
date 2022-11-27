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


module dFlipFlop(
    input din,
    input clk,
    input rst,
    output dout
);
    reg out;

    always@(posedge clk)
    begin
        if(rst)
            out <= 1'b0;
        else
            out <= din;
    end

    assign dOut = out;

endmodule
