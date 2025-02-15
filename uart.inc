/*

    Input clock frequency is expected to 10.000MHz.

*/

#define     TRUE    1'b1
#define     FALSE   1'b0

declare     uart    {
// Transmit data input
    input       Tx_Data_i[8];               // Transmit data in.

// Transmit data output
    output      TxD_o;                      // Transmit data out. LSB first

    // Command and Status bit
    input       Freq_Divide_Param_i[16] ;
                // Frequency divider parameter for 10.000MHz.
    input       Tx_BitLength_i[2] ;
                // Transmit bit length. 5, 6, 7, and 8.
    input       Tx_ParityEN_i ;
                // Parity enable bit. 1 = Parity enable, 0 = Parity disable.
    input       Tx_OddParity_i ;
                // Odd parity bit. 1 = Odd parity, 0 = Even parity.
    input       Tx_Enable_i ;
                // Transmit enable bit. 1 = Enable, 0 = disable

    output      Tx_Ready_o ;
                // Transmit ready flag.
    output      Tx_ShiftClock_o ;
                // Transmit shift clock. ( for timing check )

// Control signals
    func_in     Tx_Start_i ;
                // Transmit start request.
    func_out    Tx_Finish_o ;
                // Transmit finish acknowledge.
}

