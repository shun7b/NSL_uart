
/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sun Feb  2 17:55:21 2025
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module uart ( p_reset , m_clock , Tx_Data_i , TxD_o , Freq_Divide_Param_i , Tx_BitLength_i , Tx_ParityEN_i , Tx_OddParity_i , Tx_Enable_i , Tx_Ready_o , Tx_ShiftClock_o , Tx_Start_i , Tx_Finish_o );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] Tx_Data_i;
  wire [7:0] Tx_Data_i;
  output TxD_o;
  wire TxD_o;
  input [15:0] Freq_Divide_Param_i;
  wire [15:0] Freq_Divide_Param_i;
  input [1:0] Tx_BitLength_i;
  wire [1:0] Tx_BitLength_i;
  input Tx_ParityEN_i;
  wire Tx_ParityEN_i;
  input Tx_OddParity_i;
  wire Tx_OddParity_i;
  input Tx_Enable_i;
  wire Tx_Enable_i;
  output Tx_Ready_o;
  wire Tx_Ready_o;
  output Tx_ShiftClock_o;
  wire Tx_ShiftClock_o;
  input Tx_Start_i;
  wire Tx_Start_i;
  output Tx_Finish_o;
  wire Tx_Finish_o;
  wire [3:0] BitLength;
  reg [3:0] ShiftCount;
  reg [19:0] BaudCounter;
  reg ShiftTiming;
  reg [11:0] Tx_ShiftReg;
  reg internal_TxD_out;
  wire Tx_Parity;
  reg internal_READY;
  reg capture_TxData;
  reg shift_Operation;
  reg access_complete;
  wire _proc_access_complete_set;
  wire _proc_access_complete_reset;
  wire _proc_shift_Operation_set;
  wire _proc_shift_Operation_reset;
  wire _proc_capture_TxData_set;
  wire _proc_capture_TxData_reset;
  wire _net_0;
  wire _net_1;
  wire _net_2;
  wire _net_3;
  wire _net_4;
  wire _net_5;
  wire _net_6;
  wire _net_7;
  wire _net_8;
  wire _net_9;
  wire _net_10;
  wire _net_11;


// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if ((((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))&((~_net_1)&_net_7))|((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))&((~_net_1)&_net_6)))|(((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))&((~_net_1)&_net_5)))|((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))&(((_net_1&(~_net_2))&(~_net_3))&(~_net_4))))|(((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))&(_net_1&_net_4)))|((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))|(_net_1&_net_4))&(_net_1&_net_3)))|(((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))|(_net_1&_net_4))|(_net_1&_net_3))&(_net_1&_net_2))))
 begin $display("Warning: assign collision(uart:BitLength) at %d",$time);
if (((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))) $display("assert (((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))) line 71 at %d\n",$time);
if (((~_net_1)&_net_7)) $display("assert (((~_net_1)&_net_7)) line 65 at %d\n",$time);
if (((~_net_1)&_net_6)) $display("assert (((~_net_1)&_net_6)) line 67 at %d\n",$time);
if (((~_net_1)&_net_5)) $display("assert (((~_net_1)&_net_5)) line 69 at %d\n",$time);
if ((((_net_1&(~_net_2))&(~_net_3))&(~_net_4))) $display("assert ((((_net_1&(~_net_2))&(~_net_3))&(~_net_4))) line 61 at %d\n",$time);
if ((_net_1&_net_4)) $display("assert ((_net_1&_net_4)) line 55 at %d\n",$time);
if ((_net_1&_net_3)) $display("assert ((_net_1&_net_3)) line 57 at %d\n",$time);
if ((_net_1&_net_2)) $display("assert ((_net_1&_net_2)) line 59 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  BitLength = 
// synthesis translate_off
// synopsys translate_off
((((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))&((~_net_1)&_net_7))|((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))&((~_net_1)&_net_6)))|(((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))&((~_net_1)&_net_5)))|((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))&(((_net_1&(~_net_2))&(~_net_3))&(~_net_4))))|(((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))&(_net_1&_net_4)))|((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))|(_net_1&_net_4))&(_net_1&_net_3)))|(((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))|(_net_1&_net_4))|(_net_1&_net_3))&(_net_1&_net_2))))? 4'bx :((((((((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7))|((~_net_1)&_net_7))|((~_net_1)&_net_6))|((~_net_1)&_net_5))|(((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))|(_net_1&_net_4))|(_net_1&_net_3))|(_net_1&_net_2)))? 
// synthesis translate_on
// synopsys translate_on
((((((~_net_1)&(~_net_5))&(~_net_6))&(~_net_7)))?4'b1011:4'b0)|
    ((((~_net_1)&_net_7))?4'b1000:4'b0)|
    ((((~_net_1)&_net_6))?4'b1001:4'b0)|
    ((((~_net_1)&_net_5))?4'b1010:4'b0)|
    (((((_net_1&(~_net_2))&(~_net_3))&(~_net_4)))?4'b1010:4'b0)|
    (((_net_1&_net_4))?4'b0111:4'b0)|
    (((_net_1&_net_3))?4'b1000:4'b0)|
    (((_net_1&_net_2))?4'b1001:4'b0)
// synthesis translate_off
// synopsys translate_off
:4'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if (((~Tx_OddParity_i)&Tx_OddParity_i))
 begin $display("Warning: assign collision(uart:Tx_Parity) at %d",$time);
if ((~Tx_OddParity_i)) $display("assert ((~Tx_OddParity_i)) line 80 at %d\n",$time);
if (Tx_OddParity_i) $display("assert (Tx_OddParity_i) line 79 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  Tx_Parity = 
// synthesis translate_off
// synopsys translate_off
(((~Tx_OddParity_i)&Tx_OddParity_i))? 1'bx :(((~Tx_OddParity_i)|Tx_OddParity_i))? 
// synthesis translate_on
// synopsys translate_on
(((~Tx_OddParity_i))?(^Tx_Data_i):1'b0)|
    ((Tx_OddParity_i)?(~(^Tx_Data_i)):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_access_complete_set)
  begin
#1 if (_proc_access_complete_set===1'bx)
 begin
$display("Warning: control hazard(uart:_proc_access_complete_set) at %d",$time);
 end
#1 if (((((shift_Operation&(ShiftTiming != 1'b0))&_net_11))===1'bx) || (1'b1)===1'bx) $display("hazard (((shift_Operation&(ShiftTiming != 1'b0))&_net_11) || 1'b1) line 153 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_access_complete_set = ((shift_Operation&(ShiftTiming != 1'b0))&_net_11);

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_access_complete_reset)
  begin
#1 if (_proc_access_complete_reset===1'bx)
 begin
$display("Warning: control hazard(uart:_proc_access_complete_reset) at %d",$time);
 end
#1 if (((access_complete)===1'bx) || (1'b1)===1'bx) $display("hazard (access_complete || 1'b1) line 164 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_access_complete_reset = access_complete;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_shift_Operation_set)
  begin
#1 if (_proc_shift_Operation_set===1'bx)
 begin
$display("Warning: control hazard(uart:_proc_shift_Operation_set) at %d",$time);
 end
#1 if (((((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 138 at %d\n",$time);
#1 if (((((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 136 at %d\n",$time);
#1 if (((((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 114 at %d\n",$time);
#1 if (((((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 112 at %d\n",$time);
#1 if (((((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 122 at %d\n",$time);
#1 if (((((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 120 at %d\n",$time);
#1 if (((((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 130 at %d\n",$time);
#1 if (((((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 128 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_shift_Operation_set = ((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0)))|
    ((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0))|
    ((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0)))|
    ((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0))|
    ((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0)))|
    ((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0))|
    ((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0)))|
    ((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0));

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_shift_Operation_reset)
  begin
#1 if (_proc_shift_Operation_reset===1'bx)
 begin
$display("Warning: control hazard(uart:_proc_shift_Operation_reset) at %d",$time);
 end
#1 if (((((shift_Operation&(ShiftTiming != 1'b0))&_net_11))===1'bx) || (1'b1)===1'bx) $display("hazard (((shift_Operation&(ShiftTiming != 1'b0))&_net_11) || 1'b1) line 153 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_shift_Operation_reset = ((shift_Operation&(ShiftTiming != 1'b0))&_net_11);

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_capture_TxData_set)
  begin
#1 if (_proc_capture_TxData_set===1'bx)
 begin
$display("Warning: control hazard(uart:_proc_capture_TxData_set) at %d",$time);
 end
#1 if (((Tx_Start_i)===1'bx) || (1'b1)===1'bx) $display("hazard (Tx_Start_i || 1'b1) line 93 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_capture_TxData_set = Tx_Start_i;

// synthesis translate_off
// synopsys translate_off
always @(posedge _proc_capture_TxData_reset)
  begin
#1 if (_proc_capture_TxData_reset===1'bx)
 begin
$display("Warning: control hazard(uart:_proc_capture_TxData_reset) at %d",$time);
 end
#1 if (((((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 138 at %d\n",$time);
#1 if (((((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 136 at %d\n",$time);
#1 if (((((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 114 at %d\n",$time);
#1 if (((((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 112 at %d\n",$time);
#1 if (((((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 122 at %d\n",$time);
#1 if (((((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 120 at %d\n",$time);
#1 if (((((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))) || 1'b1) line 130 at %d\n",$time);
#1 if (((((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))===1'bx) || (1'b1)===1'bx) $display("hazard (((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)) || 1'b1) line 128 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _proc_capture_TxData_reset = ((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0)))|
    ((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0))|
    ((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0)))|
    ((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0))|
    ((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0)))|
    ((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0))|
    ((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0)))|
    ((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0));
   assign  _net_0 = 
// synthesis translate_off
// synopsys translate_off
((Tx_Enable_i != 1'b0))? 
// synthesis translate_on
// synopsys translate_on
(((Tx_Enable_i != 1'b0))?(BaudCounter==({Freq_Divide_Param_i,4'b1111})):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_1 = (~Tx_ParityEN_i);
   assign  _net_2 = 
// synthesis translate_off
// synopsys translate_off
(_net_1)? 
// synthesis translate_on
// synopsys translate_on
((_net_1)?(Tx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_3 = 
// synthesis translate_off
// synopsys translate_off
(_net_1)? 
// synthesis translate_on
// synopsys translate_on
((_net_1)?(Tx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_4 = 
// synthesis translate_off
// synopsys translate_off
(_net_1)? 
// synthesis translate_on
// synopsys translate_on
((_net_1)?(Tx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_5 = 
// synthesis translate_off
// synopsys translate_off
((~_net_1))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_1))?(Tx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_6 = 
// synthesis translate_off
// synopsys translate_off
((~_net_1))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_1))?(Tx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_7 = 
// synthesis translate_off
// synopsys translate_off
((~_net_1))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_1))?(Tx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_8 = 
// synthesis translate_off
// synopsys translate_off
(capture_TxData)? 
// synthesis translate_on
// synopsys translate_on
((capture_TxData)?(Tx_BitLength_i==2'b10):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_9 = 
// synthesis translate_off
// synopsys translate_off
(capture_TxData)? 
// synthesis translate_on
// synopsys translate_on
((capture_TxData)?(Tx_BitLength_i==2'b01):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_10 = 
// synthesis translate_off
// synopsys translate_off
(capture_TxData)? 
// synthesis translate_on
// synopsys translate_on
((capture_TxData)?(Tx_BitLength_i==2'b00):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_11 = 
// synthesis translate_off
// synopsys translate_off
((shift_Operation&(ShiftTiming != 1'b0)))? 
// synthesis translate_on
// synopsys translate_on
(((shift_Operation&(ShiftTiming != 1'b0)))?(ShiftCount==BitLength):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  TxD_o = internal_TxD_out;
   assign  Tx_Ready_o = internal_READY;
   assign  Tx_ShiftClock_o = ShiftTiming;

// synthesis translate_off
// synopsys translate_off
always @(posedge Tx_Finish_o)
  begin
#1 if (Tx_Finish_o===1'bx)
 begin
$display("Warning: control hazard(uart:Tx_Finish_o) at %d",$time);
 end
#1 if (((access_complete)===1'bx) || (1'b1)===1'bx) $display("hazard (access_complete || 1'b1) line 160 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  Tx_Finish_o = access_complete;
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     ShiftCount <= 4'b0000;
else 
// synthesis translate_off
// synopsys translate_off
if (((shift_Operation&(ShiftTiming != 1'b0))&capture_TxData))   ShiftCount <= 4'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((shift_Operation&(ShiftTiming != 1'b0)))
      ShiftCount <= (ShiftCount+4'b0001);
else if (capture_TxData)
      ShiftCount <= 4'b0000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((shift_Operation&(ShiftTiming != 1'b0))|capture_TxData)==1'b1) ||
 (((shift_Operation&(ShiftTiming != 1'b0))|capture_TxData)==1'b0) ) begin
 if (((shift_Operation&(ShiftTiming != 1'b0))&capture_TxData))
 begin $display("Warning: assign collision(uart:ShiftCount) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart:ShiftCount) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     BaudCounter <= 20'b00000000000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((((~(Tx_Enable_i != 1'b0))&((Tx_Enable_i != 1'b0)&(~_net_0)))|(((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))&((Tx_Enable_i != 1'b0)&_net_0))))   BaudCounter <= 20'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~(Tx_Enable_i != 1'b0)))
      BaudCounter <= 20'b00000000000000000000;
else if (((Tx_Enable_i != 1'b0)&(~_net_0)))
      BaudCounter <= (BaudCounter+20'b00000000000000000001);
else if (((Tx_Enable_i != 1'b0)&_net_0))
      BaudCounter <= 20'b00000000000000000000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))|((Tx_Enable_i != 1'b0)&_net_0))==1'b1) ||
 ((((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))|((Tx_Enable_i != 1'b0)&_net_0))==1'b0) ) begin
 if ((((~(Tx_Enable_i != 1'b0))&((Tx_Enable_i != 1'b0)&(~_net_0)))|(((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))&((Tx_Enable_i != 1'b0)&_net_0))))
 begin $display("Warning: assign collision(uart:BaudCounter) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart:BaudCounter) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     ShiftTiming <= 1'b0;
else 
// synthesis translate_off
// synopsys translate_off
if ((((~(Tx_Enable_i != 1'b0))&((Tx_Enable_i != 1'b0)&(~_net_0)))|(((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))&((Tx_Enable_i != 1'b0)&_net_0))))   ShiftTiming <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~(Tx_Enable_i != 1'b0)))
      ShiftTiming <= 1'b0;
else if (((Tx_Enable_i != 1'b0)&(~_net_0)))
      ShiftTiming <= 1'b0;
else if (((Tx_Enable_i != 1'b0)&_net_0))
      ShiftTiming <= 1'b1;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))|((Tx_Enable_i != 1'b0)&_net_0))==1'b1) ||
 ((((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))|((Tx_Enable_i != 1'b0)&_net_0))==1'b0) ) begin
 if ((((~(Tx_Enable_i != 1'b0))&((Tx_Enable_i != 1'b0)&(~_net_0)))|(((~(Tx_Enable_i != 1'b0))|((Tx_Enable_i != 1'b0)&(~_net_0)))&((Tx_Enable_i != 1'b0)&_net_0))))
 begin $display("Warning: assign collision(uart:ShiftTiming) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart:ShiftTiming) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     Tx_ShiftReg <= 12'b000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((((((((((shift_Operation&(ShiftTiming != 1'b0))&((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|(((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))&((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0))))|((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))&((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0)))))|(((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))&((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0))))|((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))&((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0)))))|(((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))&((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0))))|((((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))&((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0)))))|(((((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))&((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))))   Tx_ShiftReg <= 12'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((shift_Operation&(ShiftTiming != 1'b0)))
      Tx_ShiftReg <= ({1'b1,(Tx_ShiftReg[11:1])});
else if (((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))
      Tx_ShiftReg <= ({({({1'b1}),1'b1}),1'b1,(Tx_Data_i[7:0]),1'b0});
else if (((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))
      Tx_ShiftReg <= ({({({1'b1}),1'b1}),Tx_Parity,(Tx_Data_i[7:0]),1'b0});
else if (((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))
      Tx_ShiftReg <= ({({({1'b1,1'b1,1'b1,1'b1}),1'b1}),1'b1,(Tx_Data_i[4:0]),1'b0});
else if (((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))
      Tx_ShiftReg <= ({({({1'b1,1'b1,1'b1,1'b1}),1'b1}),Tx_Parity,(Tx_Data_i[4:0]),1'b0});
else if (((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))
      Tx_ShiftReg <= ({({({1'b1,1'b1,1'b1}),1'b1}),1'b1,(Tx_Data_i[5:0]),1'b0});
else if (((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))
      Tx_ShiftReg <= ({({({1'b1,1'b1,1'b1}),1'b1}),Tx_Parity,(Tx_Data_i[5:0]),1'b0});
else if (((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))
      Tx_ShiftReg <= ({({({1'b1,1'b1}),1'b1}),1'b1,(Tx_Data_i[6:0]),1'b0});
else if (((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))
      Tx_ShiftReg <= ({({({1'b1,1'b1}),1'b1}),Tx_Parity,(Tx_Data_i[6:0]),1'b0});
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))==1'b1) ||
 ((((((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))==1'b0) ) begin
 if ((((((((((shift_Operation&(ShiftTiming != 1'b0))&((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|(((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))&((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0))))|((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))&((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0)))))|(((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))&((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0))))|((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))&((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0)))))|(((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))&((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0))))|((((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))&((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0)))))|(((((((((shift_Operation&(ShiftTiming != 1'b0))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(~(Tx_ParityEN_i != 1'b0))))|((((capture_TxData&(~_net_8))&(~_net_9))&(~_net_10))&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_10)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_10)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_9)&(~(Tx_ParityEN_i != 1'b0))))|((capture_TxData&_net_9)&(Tx_ParityEN_i != 1'b0)))|((capture_TxData&_net_8)&(~(Tx_ParityEN_i != 1'b0))))&((capture_TxData&_net_8)&(Tx_ParityEN_i != 1'b0)))))
 begin $display("Warning: assign collision(uart:Tx_ShiftReg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart:Tx_ShiftReg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     internal_TxD_out <= 1'b1;
else 
// synthesis translate_off
// synopsys translate_off
if (((shift_Operation&(ShiftTiming != 1'b0))&capture_TxData))   internal_TxD_out <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((shift_Operation&(ShiftTiming != 1'b0)))
      internal_TxD_out <= (Tx_ShiftReg[0]);
else if (capture_TxData)
      internal_TxD_out <= 1'b1;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((shift_Operation&(ShiftTiming != 1'b0))|capture_TxData)==1'b1) ||
 (((shift_Operation&(ShiftTiming != 1'b0))|capture_TxData)==1'b0) ) begin
 if (((shift_Operation&(ShiftTiming != 1'b0))&capture_TxData))
 begin $display("Warning: assign collision(uart:internal_TxD_out) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart:internal_TxD_out) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     internal_READY <= 1'b1;
else 
// synthesis translate_off
// synopsys translate_off
if ((access_complete&capture_TxData))   internal_READY <= 1'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (access_complete)
      internal_READY <= 1'b1;
else if (capture_TxData)
      internal_READY <= 1'b0;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((access_complete|capture_TxData)==1'b1) ||
 ((access_complete|capture_TxData)==1'b0) ) begin
 if ((access_complete&capture_TxData))
 begin $display("Warning: assign collision(uart:internal_READY) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart:internal_READY) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     capture_TxData <= 1'b0;
else if ((_proc_capture_TxData_set|_proc_capture_TxData_reset))
      capture_TxData <= _proc_capture_TxData_set;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     shift_Operation <= 1'b0;
else if ((_proc_shift_Operation_set|_proc_shift_Operation_reset))
      shift_Operation <= _proc_shift_Operation_set;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     access_complete <= 1'b0;
else if ((_proc_access_complete_set|_proc_access_complete_reset))
      access_complete <= _proc_access_complete_set;
end
endmodule

/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sun Feb  2 17:55:21 2025
 Licensed to :EVALUATION USER*/
