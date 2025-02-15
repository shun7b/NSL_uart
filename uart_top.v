
/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sat Feb 15 14:27:29 2025
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module uart_top ( p_reset , m_clock , txd );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output txd;
  wire txd;
  reg [15:0] clk_divide;
  reg clk_10m;
  reg [15:0] start_count;
  wire [7:0] _send_Tx_Data_i;
  wire _send_TxD_o;
  wire [15:0] _send_Freq_Divide_Param_i;
  wire [1:0] _send_Tx_BitLength_i;
  wire _send_Tx_ParityEN_i;
  wire _send_Tx_OddParity_i;
  wire _send_Tx_Enable_i;
  wire _send_Tx_Ready_o;
  wire _send_Tx_ShiftClock_o;
  wire _send_Tx_Start_i;
  wire _send_Tx_Finish_o;
  wire _send_p_reset;
  wire _send_m_clock;
  wire _net_0;
  wire _net_1;
  wire _net_2;
uart send (.m_clock(m_clock), .p_reset( p_reset), .Tx_Finish_o(_send_Tx_Finish_o), .Tx_Start_i(_send_Tx_Start_i), .Tx_ShiftClock_o(_send_Tx_ShiftClock_o), .Tx_Ready_o(_send_Tx_Ready_o), .Tx_Enable_i(_send_Tx_Enable_i), .Tx_OddParity_i(_send_Tx_OddParity_i), .Tx_ParityEN_i(_send_Tx_ParityEN_i), .Tx_BitLength_i(_send_Tx_BitLength_i), .Freq_Divide_Param_i(_send_Freq_Divide_Param_i), .TxD_o(_send_TxD_o), .Tx_Data_i(_send_Tx_Data_i));

   assign  _send_Tx_Data_i = 8'b00111000;
   assign  _send_Freq_Divide_Param_i = 16'b0000000000100000;
   assign  _send_Tx_BitLength_i = 2'b11;
   assign  _send_Tx_ParityEN_i = 1'b0;
   assign  _send_Tx_Enable_i = 1'b1;

// synthesis translate_off
// synopsys translate_off
always @(posedge _send_Tx_Start_i)
  begin
#1 if (_send_Tx_Start_i===1'bx)
 begin
$display("Warning: control hazard(uart_top:_send_Tx_Start_i) at %d",$time);
 end
#1 if (((_net_1)===1'bx) || (1'b1)===1'bx) $display("hazard (_net_1 || 1'b1) line 22 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _send_Tx_Start_i = _net_1;
   assign  _send_p_reset = p_reset;
   assign  _send_m_clock = m_clock;
   assign  _net_0 = (clk_divide==16'b0000000000000100);
   assign  _net_1 = ((start_count > 4'b0101)&(start_count < 7'b0010010));
   assign  _net_2 = (start_count==7'b0100000);
   assign  txd = _send_TxD_o;
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     clk_divide <= 16'b0000000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((~_net_0)&_net_0))   clk_divide <= 16'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~_net_0))
      clk_divide <= (clk_divide+16'b0000000000000001);
else if (_net_0)
      clk_divide <= 16'b0000000000000000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~_net_0)|_net_0)==1'b1) ||
 (((~_net_0)|_net_0)==1'b0) ) begin
 if (((~_net_0)&_net_0))
 begin $display("Warning: assign collision(uart_top:clk_divide) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart_top:clk_divide) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     clk_10m <= 1'b0;
else if (_net_0)
      clk_10m <= (~clk_10m);
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     start_count <= 16'b0000000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((~_net_2)&_net_2))   start_count <= 16'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~_net_2))
      start_count <= (start_count+16'b0000000000000001);
else if (_net_2)
      start_count <= 7'b0011111;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~_net_2)|_net_2)==1'b1) ||
 (((~_net_2)|_net_2)==1'b0) ) begin
 if (((~_net_2)&_net_2))
 begin $display("Warning: assign collision(uart_top:start_count) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(uart_top:start_count) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
endmodule

/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sat Feb 15 14:27:29 2025
 Licensed to :EVALUATION USER*/
