`ifndef DEFINES_V
`define DEFINES_V

// ALU Operators
`define ALU_OP_ADD 3'b000
`define ALU_OP_SUB 3'b001
`define ALU_OP_SLL 3'b010
`define ALU_OP_OR 3'b011
`define ALU_OP_AND 3'b100
`define ALU_OP_LT 3'b101
`define ALU_OP_SLT 3'b110
`define ALU_OP_XOR 3'b111

// Operators
`define OP_ADD 6'b000000
`define OP_SUB 6'b000001
`define OP_ADDIU 6'b000010

`define OP_ANDI 6'b010000
`define OP_AND 6'b010001
`define OP_ORI 6'b010010
`define OP_OR 6'b010011

`define OP_SLL 6'b011000
`define OP_SLTI 6'b011100

`define OP_SW 6'b100110
`define OP_LW 6'b100111

`define OP_BEQ 6'b110000
`define OP_BNE 6'b110001
`define OP_BLTZ 6'b110010

`define OP_J 6'b111000
`define OP_HALT 6'b111111

// PC Src
`define PC_NEXT 2'b00
`define PC_REL_JUMP 2'b01
`define PC_ABS_JUMP 2'b10
`define PC_HALT 2'b11

`endif
