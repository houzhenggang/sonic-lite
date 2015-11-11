// Copyright (c) 2015 Cornell University.

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

/*
* SimpleMatchTable, which:
* - uses low order bits in input keys as indices to internal table
* - implements the same interface as cuckoo hashtable
* - is used for development and debugging purposes only
*/

import BRAM::*;
import Connectable::*;
import FIFOF::*;
import Pipe::*;
import SpecialFIFOs::*;

import P4Types::*;
import SimpleCAM::*;

interface MatchTable_port_mapping;
   interface PipeIn#(MatchInput_port_mapping) phv_in;
   interface PipeOut#(ActionSpec_port_mapping) action_data;
   interface Put#(MatchSpec_port_mapping) put_entry;
   interface Get#(Maybe#(MatchSpec_port_mapping)) get_entry;
endinterface

interface MatchTable_bd;
   interface PipeIn#(MatchInput_bd) phv_in;
   interface PipeOut#(ActionSpec_bd) action_data;
   interface Put#(MatchSpec_bd) put_entry;
   interface Get#(Maybe#(MatchSpec_bd)) get_entry;
endinterface

// Input: MatchInput
// Input: MatchSpec
// Output: ActionSpec
(* synthesize *)
module mkMatchTable_port_mapping(MatchTable_port_mapping);

   Reg#(Bit#(32)) cycle <- mkReg(0);
   FIFOF#(MatchInput_port_mapping) fifo_in_port_mapping <- mkSizedFIFOF(1);
   FIFOF#(ActionSpec_port_mapping) fifo_out_action_data <- mkSizedFIFOF(1);

   CAM#(16, Bit#(9), Bit#(9)) cam <- mkCAM();

   BRAM_Configure cfg = defaultValue;
   cfg.latency = 1;
   BRAM2Port#(Bit#(9), ActionSpec_port_mapping) actionRam <- mkBRAM2Server(cfg);

   rule every1;
      cycle <= cycle + 1;
   endrule

   rule cam_lookup;
      let v <- toGet(fifo_in_port_mapping).get;
      $display("%x: match table get_phv %x", cycle, v);
      cam.readPort.request.put(pack(v));
   endrule

   rule action_param_lookup;
      let v <- cam.readPort.response.get;
      if (isValid(v)) begin
         actionRam.portA.request.put(BRAMRequest{write:False, responseOnWrite:False, address:fromMaybe(?, v), datain:?});
      end
      else begin
         $display("Packed match missed");
      end
   endrule

   rule action_param_output;
      let v <- actionRam.portA.response.get;
      fifo_out_action_data.enq(v);
   endrule

   interface Put put_entry;
      method Action put(MatchSpec_port_mapping e);
         cam.writePort.put(tuple2(pack(e), pack(e)));
      endmethod
   endinterface

   interface PipeIn phv_in = toPipeIn(fifo_in_port_mapping);
   interface PipeOut action_data = toPipeOut(fifo_out_action_data);
endmodule

(* synthesize *)
module mkMatchTable_bd(MatchTable_bd);

   FIFOF#(MatchInput_bd) fifo_in_bd <- mkSizedFIFOF(1);
   FIFOF#(ActionSpec_bd) fifo_out_action_data <- mkSizedFIFOF(1);

   CAM#(16, Bit#(16), Bit#(16)) cam <- mkCAM();

   rule get_phv;
      let v <- toGet(fifo_in_bd).get;
      cam.readPort.request.put(pack(v));
   endrule

   rule getMatchResult;
      let v <- cam.readPort.response.get;
      fifo_out_action_data.enq(ActionSpec_bd{vrf:0});
   endrule

   interface Put put_entry;
      method Action put(MatchSpec_bd e);
         cam.writePort.put(tuple2(pack(e), pack(e)));
      endmethod
   endinterface

   interface PipeIn phv_in = toPipeIn(fifo_in_bd);
   interface PipeOut action_data = toPipeOut(fifo_out_action_data);
endmodule
