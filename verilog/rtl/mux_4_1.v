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


module mux_4_1(
    input [3:0] in,
    input [1:0] sel,
    output muxOut
);

    assign muxOut = (sel == 2'd0) ? in[0] : (sel == 2'd1) ? in[1] : (sel == 2'd2) ? in[2] : (sel == 2'd3) ? in[3] : in[4];

endmodule