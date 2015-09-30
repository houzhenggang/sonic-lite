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

/* DO NOT MODIFY, AUTO GENERATED BY P4 COMPILER */

import Vector::*;
import DefaultValue::*;
import PCIE::*;

// Very easy to generate
function Bit#(32) byteSwap4B(Bit#(32) v);
   Vector#(4, Bit#(8)) bytes = unpack(v);
   return pack(reverse(bytes));
endfunction

function Bit#(16) byteSwap2B(Bit#(16) v);
   Vector#(2, Bit#(8)) bytes = unpack(v);
   return pack(reverse(bytes));
endfunction

typedef struct {
   Bit#(32) cnt;
} Cycle_t deriving(Bits, Eq);
instance DefaultValue#(Cycle_t);
   defaultValue =
   Cycle_t {
      cnt : 0
   };
endinstance
instance FShow#(Cycle_t);
   function Fmt fshow (Cycle_t v);
      return $format("Cycle %d: ", v.cnt);
   endfunction
endinstance

typedef struct {
   Bit#(48) dstAddr;
   Bit#(48) srcAddr;
   Bit#(16) etherType;
} Ethernet_t deriving(Bits, Eq);
instance DefaultValue#(Ethernet_t);
   defaultValue =
   Ethernet_t {
     dstAddr : 0,
     srcAddr : 0,
     etherType : 0
   };
endinstance
typedef struct {
   Bit#(3) pcp;
   Bit#(1) cfi;
   Bit#(12) vid;
   Bit#(16) etherType;
} Vlan_tag_t deriving(Bits, Eq);
instance DefaultValue#(Vlan_tag_t);
   defaultValue =
   Vlan_tag_t {
     pcp : 0,
     cfi : 0,
     vid : 0,
     etherType : 0
   };
endinstance
typedef struct {
   Bit#(4) version;
   Bit#(4) ihl;
   Bit#(8) diffserv;
   Bit#(16) totalLen;
   Bit#(16) identification;
   Bit#(3) flags;
   Bit#(13) fragOffset;
   Bit#(8) ttl;
   Bit#(8) protocol;
   Bit#(16) hdrChecksum;
   Bit#(32) srcAddr;
   Bit#(32) dstAddr;
} Ipv4_t deriving(Bits, Eq);
instance DefaultValue#(Ipv4_t);
   defaultValue =
   Ipv4_t {
     version : 0,
     ihl : 0,
     diffserv : 0,
     totalLen : 0,
     identification : 0,
     flags : 0,
     fragOffset : 0,
     ttl : 0,
     protocol : 0,
     hdrChecksum : 0,
     srcAddr : 0,
     dstAddr : 0
   };
endinstance
typedef struct {
   Bit#(9) ingress_port;
   Bit#(32) packet_length;
   Bit#(9) egress_spec;
   Bit#(9) egress_port;
   Bit#(32) egress_instance;
   Bit#(32) instance_type;
   Bit#(32) clone_spec;
   Bit#(5) _padding;
} Standard_metadata_t deriving(Bits, Eq);
instance DefaultValue#(Standard_metadata_t);
   defaultValue =
   Standard_metadata_t {
     ingress_port : 0,
     packet_length : 0,
     egress_spec : 0,
     egress_port : 0,
     egress_instance : 0,
     instance_type : 0,
     clone_spec : 0,
     _padding : 0
   };
endinstance
typedef struct {
   Bit#(12) vrf;
   Bit#(16) bd;
   Bit#(16) nexthop_index;
   Bit#(4) _padding;
} Ingress_metadata_t deriving(Bits, Eq);
instance DefaultValue#(Ingress_metadata_t);
   defaultValue =
   Ingress_metadata_t {
     vrf : 0,
     bd : 0,
     nexthop_index : 0,
     _padding : 0
   };
endinstance

typedef struct {
   Bit#(9) standard_metadata_ingress_port;
   Bit#(32) header_addr;
   Bit#(32) payload_addr;
   Bit#(16) payload_len;
} MatchKey_port_mapping deriving (Bits, Eq);
instance DefaultValue#(MatchKey_port_mapping);
   defaultValue =
   MatchKey_port_mapping {
     standard_metadata_ingress_port : 0,
     header_addr : 0,
     payload_addr : 0,
     payload_len : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_bd;
   Bit#(32) header_addr;
   Bit#(32) payload_addr;
   Bit#(16) payload_len;
} MatchKey_bd deriving (Bits, Eq);
instance DefaultValue#(MatchKey_bd);
   defaultValue =
   MatchKey_bd {
     ingress_metadata_bd : 0,
     header_addr : 0,
     payload_addr : 0,
     payload_len : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
   Bit#(32) header_addr;
   Bit#(32) payload_addr;
   Bit#(16) payload_len;
} MatchKey_ipv4_fib deriving (Bits, Eq);
instance DefaultValue#(MatchKey_ipv4_fib);
   defaultValue =
   MatchKey_ipv4_fib {
     ingress_metadata_vrf : 0,
     header_addr : 0,
     payload_addr : 0,
     payload_len : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
   Bit#(32) header_addr;
   Bit#(32) payload_addr;
   Bit#(16) payload_len;
} MatchKey_ipv4_fib_lpm deriving (Bits, Eq);
instance DefaultValue#(MatchKey_ipv4_fib_lpm);
   defaultValue =
   MatchKey_ipv4_fib_lpm {
     ingress_metadata_vrf : 0,
     header_addr : 0,
     payload_addr : 0,
     payload_len : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
   Bit#(32) header_addr;
   Bit#(32) payload_addr;
   Bit#(16) payload_len;
} MatchKey_nexthop deriving (Bits, Eq);
instance DefaultValue#(MatchKey_nexthop);
   defaultValue =
   MatchKey_nexthop {
     ingress_metadata_nexthop_index : 0,
     header_addr : 0,
     payload_addr : 0,
     payload_len : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
   Bit#(32) header_addr;
   Bit#(32) payload_addr;
   Bit#(16) payload_len;
} MatchKey_rewrite_mac deriving (Bits, Eq);
instance DefaultValue#(MatchKey_rewrite_mac);
   defaultValue =
   MatchKey_rewrite_mac {
     ingress_metadata_nexthop_index : 0,
     header_addr : 0,
     payload_addr : 0,
     payload_len : 0
   };
endinstance

//FIXME: handle lpm match_spec
typedef struct {
   Bit#(9) standard_metadata_ingress_port;
} MatchSpec_port_mapping deriving (Bits, Eq);
instance DefaultValue#(MatchSpec_port_mapping);
   defaultValue =
   MatchSpec_port_mapping {
      standard_metadata_ingress_port : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_bd;
} MatchSpec_bd deriving (Bits, Eq);
instance DefaultValue#(MatchSpec_bd);
   defaultValue =
   MatchSpec_bd {
      ingress_metadata_bd : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
   Bit#(32) ipv4_dstAddr;
} MatchSpec_ipv4_fib deriving (Bits, Eq);
instance DefaultValue#(MatchSpec_ipv4_fib);
   defaultValue =
   MatchSpec_ipv4_fib {
      ingress_metadata_vrf : 0,
      ipv4_dstAddr : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
   Bit#(32) ipv4_dstAddr;
} MatchSpec_ipv4_fib_lpm deriving (Bits, Eq);
instance DefaultValue#(MatchSpec_ipv4_fib_lpm);
   defaultValue =
   MatchSpec_ipv4_fib_lpm {
      ingress_metadata_vrf : 0,
      ipv4_dstAddr : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
} MatchSpec_nexthop deriving (Bits, Eq);
instance DefaultValue#(MatchSpec_nexthop);
   defaultValue =
   MatchSpec_nexthop {
      ingress_metadata_nexthop_index : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
} MatchSpec_rewrite_mac deriving (Bits, Eq);
instance DefaultValue#(MatchSpec_rewrite_mac);
   defaultValue =
   MatchSpec_rewrite_mac {
      ingress_metadata_nexthop_index : 0
   };
endinstance

//FIXME: bug! duplicate params
typedef struct {
   Bit#(16) bd;
} ActionSpec_port_mapping deriving (Bits, Eq);
instance DefaultValue#(ActionSpec_port_mapping);
   defaultValue =
   ActionSpec_port_mapping {
      bd : 0
   };
endinstance
typedef struct {
   Bit#(12) vrf;
} ActionSpec_bd deriving (Bits, Eq);
instance DefaultValue#(ActionSpec_bd);
   defaultValue =
   ActionSpec_bd {
      vrf : 0
   };
endinstance
typedef struct {
   Bit#(16) nexthop_index;
} ActionSpec_ipv4_fib deriving (Bits, Eq);
instance DefaultValue#(ActionSpec_ipv4_fib);
   defaultValue =
   ActionSpec_ipv4_fib {
      nexthop_index : 0
   };
endinstance
typedef struct {
   Bit#(16) nexthop_index;
} ActionSpec_ipv4_fib_lpm deriving (Bits, Eq);
instance DefaultValue#(ActionSpec_ipv4_fib_lpm);
   defaultValue =
   ActionSpec_ipv4_fib_lpm {
      nexthop_index : 0
   };
endinstance
typedef struct {
   Bit#(9) egress_spec;
} ActionSpec_nexthop deriving (Bits, Eq);
instance DefaultValue#(ActionSpec_nexthop);
   defaultValue =
   ActionSpec_nexthop {
      egress_spec : 0
   };
endinstance
typedef struct {
   Bit#(48) smac;
   Bit#(48) dmac;
} ActionSpec_rewrite_mac deriving (Bits, Eq);
instance DefaultValue#(ActionSpec_rewrite_mac);
   defaultValue =
   ActionSpec_rewrite_mac {
      smac : 0,
      dmac : 0
   };
endinstance

typedef struct {
   Bit#(16) ingress_metadata_bd;
} ActionInput_port_mapping deriving (Bits, Eq);
instance DefaultValue#(ActionInput_port_mapping);
   defaultValue =
   ActionInput_port_mapping {
      ingress_metadata_bd : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
} ActionInput_bd deriving (Bits, Eq);
instance DefaultValue#(ActionInput_bd);
   defaultValue =
   ActionInput_bd {
      ingress_metadata_vrf : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
   Bit#(8) ipv4_ttl;
} ActionInput_ipv4_fib deriving (Bits, Eq);
instance DefaultValue#(ActionInput_ipv4_fib);
   defaultValue =
   ActionInput_ipv4_fib {
      ingress_metadata_nexthop_index : 0,
      ipv4_ttl : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
   Bit#(8) ipv4_ttl;
} ActionInput_ipv4_fib_lpm deriving (Bits, Eq);
instance DefaultValue#(ActionInput_ipv4_fib_lpm);
   defaultValue =
   ActionInput_ipv4_fib_lpm {
      ingress_metadata_nexthop_index : 0,
      ipv4_ttl : 0
   };
endinstance
typedef struct {
   Bit#(9) standard_metadata_egress_spec;
} ActionInput_nexthop deriving (Bits, Eq);
instance DefaultValue#(ActionInput_nexthop);
   defaultValue =
   ActionInput_nexthop {
      standard_metadata_egress_spec : 0
   };
endinstance
typedef struct {
   Bit#(48) ethernet_srcAddr;
   Bit#(48) ethernet_dstAddr;
} ActionInput_rewrite_mac deriving (Bits, Eq);
instance DefaultValue#(ActionInput_rewrite_mac);
   defaultValue =
   ActionInput_rewrite_mac {
      ethernet_srcAddr : 0,
      ethernet_dstAddr : 0
   };
endinstance

typedef struct {
   Bit#(16) ingress_metadata_bd;
} ActionOutput_port_mapping deriving (Bits, Eq);
instance DefaultValue#(ActionOutput_port_mapping);
   defaultValue =
   ActionOutput_port_mapping {
      ingress_metadata_bd : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
} ActionOutput_bd deriving (Bits, Eq);
instance DefaultValue#(ActionOutput_bd);
   defaultValue =
   ActionOutput_bd {
      ingress_metadata_vrf : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
   Bit#(8) ipv4_ttl;
} ActionOutput_ipv4_fib deriving (Bits, Eq);
instance DefaultValue#(ActionOutput_ipv4_fib);
   defaultValue =
   ActionOutput_ipv4_fib {
      ingress_metadata_nexthop_index : 0,
      ipv4_ttl : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
   Bit#(8) ipv4_ttl;
} ActionOutput_ipv4_fib_lpm deriving (Bits, Eq);
instance DefaultValue#(ActionOutput_ipv4_fib_lpm);
   defaultValue =
   ActionOutput_ipv4_fib_lpm {
      ingress_metadata_nexthop_index : 0,
      ipv4_ttl : 0
   };
endinstance
typedef struct {
   Bit#(9) standard_metadata_egress_spec;
} ActionOutput_nexthop deriving (Bits, Eq);
instance DefaultValue#(ActionOutput_nexthop);
   defaultValue =
   ActionOutput_nexthop {
      standard_metadata_egress_spec : 0
   };
endinstance
typedef struct {
   Bit#(48) ethernet_srcAddr;
   Bit#(48) ethernet_dstAddr;
} ActionOutput_rewrite_mac deriving (Bits, Eq);
instance DefaultValue#(ActionOutput_rewrite_mac);
   defaultValue =
   ActionOutput_rewrite_mac {
      ethernet_srcAddr : 0,
      ethernet_dstAddr : 0
   };
endinstance

typedef struct {
   Bit#(9) standard_metadata_ingress_port;
} MatchInput_port_mapping deriving (Bits, Eq);
instance DefaultValue#(MatchInput_port_mapping);
   defaultValue =
   MatchInput_port_mapping {
      standard_metadata_ingress_port : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_bd;
} MatchInput_bd deriving (Bits, Eq);
instance DefaultValue#(MatchInput_bd);
   defaultValue =
   MatchInput_bd {
      ingress_metadata_bd : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
   Bit#(32) ipv4_dstAddr;
} MatchInput_ipv4_fib deriving (Bits, Eq);
instance DefaultValue#(MatchInput_ipv4_fib);
   defaultValue =
   MatchInput_ipv4_fib {
      ingress_metadata_vrf : 0,
      ipv4_dstAddr : 0
   };
endinstance
typedef struct {
   Bit#(12) ingress_metadata_vrf;
   Bit#(32) ipv4_dstAddr;
} MatchInput_ipv4_fib_lpm deriving (Bits, Eq);
instance DefaultValue#(MatchInput_ipv4_fib_lpm);
   defaultValue =
   MatchInput_ipv4_fib_lpm {
      ingress_metadata_vrf : 0,
      ipv4_dstAddr : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
} MatchInput_nexthop deriving (Bits, Eq);
instance DefaultValue#(MatchInput_nexthop);
   defaultValue =
   MatchInput_nexthop {
      ingress_metadata_nexthop_index : 0
   };
endinstance
typedef struct {
   Bit#(16) ingress_metadata_nexthop_index;
} MatchInput_rewrite_mac deriving (Bits, Eq);
instance DefaultValue#(MatchInput_rewrite_mac);
   defaultValue =
   MatchInput_rewrite_mac {
      ingress_metadata_nexthop_index : 0
   };
endinstance

function Ethernet_t extrace_ethernet(Bit#(112) data);
   Vector#(112, Bit#(1)) dataVec = unpack(data);
   Vector#(48, Bit#(1)) dstAddr = takeAt(0, dataVec);
   Vector#(48, Bit#(1)) srcAddr = takeAt(48, dataVec);
   Vector#(16, Bit#(1)) etherType = takeAt(96, dataVec);
   Ethernet_t ethernet = defaultValue;
   ethernet.dstAddr = pack(dstAddr);
   ethernet.srcAddr = pack(srcAddr);
   ethernet.etherType = pack(etherType);
   return ethernet;
endfunction

function Vlan_tag_t extract_vlan(Bit#(32) data);
   Vector#(32, Bit#(1)) dataVec = unpack(data);
   Vector#(3, Bit#(1)) pcp = takeAt(0, dataVec);
   Vector#(1, Bit#(1)) cfi = takeAt(3, dataVec);
   Vector#(12, Bit#(1)) vid = takeAt(4, dataVec);
   Vector#(16, Bit#(1)) etherType = takeAt(16, dataVec);
   Vlan_tag_t vlan = defaultValue;
   vlan.pcp = pack(pcp);
   vlan.cfi = pack(cfi);
   vlan.vid = pack(vid);
   vlan.etherType = pack(etherType);
   return vlan;
endfunction

function Ipv4_t extract_ipv4 (Bit#(160) data);
   Vector#(160, Bit#(1)) dataVec = unpack(data);
   Vector#(4, Bit#(1)) version = takeAt(0, dataVec);
   Vector#(4, Bit#(1)) ihl = takeAt(4, dataVec);
   Vector#(8, Bit#(1)) diffserv = takeAt(8, dataVec);
   Vector#(16, Bit#(1)) totalLen = takeAt(16, dataVec);
   Vector#(16, Bit#(1)) identification = takeAt(32, dataVec);
   Vector#(3, Bit#(1)) flags = takeAt(48, dataVec);
   Vector#(13, Bit#(1)) fragOffset = takeAt(51, dataVec);
   Vector#(8, Bit#(1)) ttl = takeAt(64, dataVec);
   Vector#(8, Bit#(1)) protocol = takeAt(72, dataVec);
   Vector#(16, Bit#(1)) hdrChecksum = takeAt(80, dataVec);
   Vector#(32, Bit#(1)) srcAddr = takeAt(96, dataVec);
   Vector#(32, Bit#(1)) dstAddr = takeAt(128, dataVec);
   Ipv4_t ipv4 = defaultValue;
   ipv4.version = pack(version);
   ipv4.ihl = pack(ihl);
   ipv4.diffserv = pack(diffserv);
   ipv4.totalLen = pack(totalLen);
   ipv4.identification = pack(identification);
   ipv4.flags = pack(flags);
   ipv4.fragOffset = pack(fragOffset);
   ipv4.ttl = pack(ttl);
   ipv4.protocol = pack(protocol);
   ipv4.hdrChecksum = pack(hdrChecksum);
   ipv4.srcAddr = pack(srcAddr);
   ipv4.dstAddr = pack(dstAddr);
   return ipv4;
endfunction

