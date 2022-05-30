// =============================================================================
// Filename: processor.v
// -----------------------------------------------------------------------------
// This file implements the RISC 5 Stage processor.
// =============================================================================


module mux2to1_5bit (	input[4:0] a,
			input[4:0] b,
			input sel,
			output[4:0] out);

assign out = sel ? b : a;

endmodule


module mux2to1 (	input[7:0] a,
			input[7:0] b,
			input sel,
			output[7:0] out);

assign out = sel ? b : a;

endmodule

module forwardunit
(   
    EX_MEM_RegWrite_i,
    EX_MEM_RD_i,
    ID_EX_RS_i,
    ID_EX_RT_i,
    MEM_WB_RegWrite_i,
    MEM_WB_RD_i,
    forward_mux1,
    forward_mux2
);

input			EX_MEM_RegWrite_i, MEM_WB_RegWrite_i;
input	    	[4:0]	ID_EX_RS_i, ID_EX_RT_i, EX_MEM_RD_i, MEM_WB_RD_i;
output reg	    [1:0]	forward_mux1, forward_mux2;

always@(*)begin

    // forward 0
    forward_mux1 = 2'b00;

    // forward EX
    if(EX_MEM_RegWrite_i && (EX_MEM_RD_i != 8'h00) && (EX_MEM_RD_i == ID_EX_RS_i))
    forward_mux1 = 2'b10;

    // forward MEM
    else if(MEM_WB_RegWrite_i && (MEM_WB_RD_i != 8'h00) && MEM_WB_RD_i == ID_EX_RS_i)
    forward_mux1 = 2'b01;

    // forward 0
    forward_mux2 = 2'b00;

    // forward EX
    if(EX_MEM_RegWrite_i && (EX_MEM_RD_i != 8'h00) && (EX_MEM_RD_i == ID_EX_RT_i))
    forward_mux2 = 2'b10;

    // forward MEM
    else if(MEM_WB_RegWrite_i && (MEM_WB_RD_i != 8'h00) && MEM_WB_RD_i == ID_EX_RT_i)
    forward_mux2 = 2'b01;

end
endmodule

module mux4to1 (	input[7:0] a,
			input[7:0] b,
			input[7:0] c,
			input[7:0] d,
			input[1:0] sel,
			output[7:0] out);

assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);

endmodule


module comparator(
input       control, 
input[1:0]  opCode,
input[7:0]  a, b, 
output reg  comp);

always@(*)
begin
   if (opCode == 2'b01)
      comp = a < b;
   else if (opCode == 2'b10)
      comp = a > b;
   else if (opCode == 2'b11)
      comp = a == b;
end

endmodule

module Imm_gen(
    input [1:0] ImmSel_o,
    input [31:0] Instr,
    output reg[7:0] Imm_o
);

wire [11:0] imm_i;
wire [7:0]  imm_s1; 
wire [5:0]  imm_s2;
assign imm_i  = Instr[31:20];
assign imm_s2 = Instr[11:7];
assign imm_s1 = Instr[31:25];

always@(*) 
begin
    case(ImmSel_o)
        default : begin
            Imm_o <= 7'b0000000;
        end

        2'b01 : begin //I type
            Imm_o <= imm_i[7:0];
        end

        2'b10 : begin //S type
            Imm_o <= (imm_s1[2:0] << 5) + imm_s2;
        end    

        2'b11 : begin //SB type
            Imm_o <= (imm_s1[2:0] << 5) + (imm_s2[4:1] << 1) + 1'b0;
        end            

    endcase
    $display("Out Imm: %d", Imm_o);
end

endmodule


module pc(
    input clk,
    input reset,
    input hazard,
    input  [7:0] pc_i,
    output reg[7:0] pc_o);

reg[7:0] spc_o;

always@(posedge clk or negedge reset)
begin
    if(!reset) spc_o <= 0;
    //else if (hazard) spc_o <= pc_i;
    //else if (pc_i == 256) spc_o <= 0;
    else  spc_o <= pc_i;
end

always@(*)
begin
    pc_o <= spc_o + 4;
end
endmodule

module registerFile(input           clock, reset, regWrite,
                    input[4:0]      rAddr1, rAddr2, wAddr, 
                    input[7:0]      datain,
                    output reg[7:0] output1, output2);

reg[7:0] register[15:0];
reg[7:0] sregister[15:0];

// Write data in register
always@(posedge clock or negedge reset)
begin
   if (!reset)
      begin
      sregister[0]        <= 8'h00;
	    sregister[1]        <= 8'h00;
	    sregister[2]        <= 8'h00;
	    sregister[3]        <= 8'h00;
	    sregister[4]        <= 8'h00;
	    sregister[5]        <= 8'h00;
	    sregister[6]        <= 8'h00;
	    sregister[7]        <= 8'h00;
	    sregister[8]        <= 8'h00;
	    sregister[9]        <= 8'h00;
	    sregister[10]       <= 8'h00;
	    sregister[11]       <= 8'h00;
	    sregister[12]       <= 8'h00;
	    sregister[13]       <= 8'h00;
	    sregister[14]       <= 8'h00;
	    sregister[15]       <= 8'h00;
      end
   else
     begin
       sregister[wAddr]        <= datain;
     end
end

// Output data
always@(*)
begin
    if (regWrite) register[wAddr] <= sregister[wAddr]; 
   output1 <= register[rAddr1];
   output2 <= register[rAddr2];
end

endmodule

module shiftL1(
input[7:0]      in,
output reg[7:0] out);

always@(*)
begin
   out = in << 1;
end

endmodule

module Control(
input [6:0]     Op_i,
output  reg[2:0]    ALUOp_o,
output  reg[1:0]    ImmSel_o,
output  reg    ALUSrc_o, RegDst_o, PCSrc_o,
output  reg    RegWrite_o ,MemRd_o,MemWr_o,MemToReg_o);


always@(*)begin

    case(Op_i)
        default:begin
            ALUOp_o <= 3'b111;
            ALUSrc_o <= 1'b0;
            RegWrite_o <= 1'b0;
            MemRd_o <= 1'b0;
            MemWr_o <= 1'b0;
            MemToReg_o <= 1'b0;
            RegDst_o <= 1'b0;
            PCSrc_o <= 1'b0;
            ImmSel_o <= 2'b00;
        end

        7'b0011011:begin //I cal
            ALUOp_o <= 3'b011;
            ALUSrc_o <= 1'b1;
            RegWrite_o <= 1'b1;
            MemRd_o <= 1'b0;
            MemWr_o <= 1'b0;
            MemToReg_o <= 1'b0;
            RegDst_o <= 1'b1;
            PCSrc_o <= 1'b0;
            ImmSel_o <= 2'b01;
        end

        7'b0110110:begin //R
            ALUOp_o <= 3'b010;
            ALUSrc_o <= 1'b0;
            RegWrite_o <= 1'b1;
            MemRd_o <= 1'b0;
            MemWr_o <= 1'b0;
            MemToReg_o <= 1'b0;
            RegDst_o <= 1'b1;
            PCSrc_o <= 1'b0;
            ImmSel_o <= 2'b01;
        end

        7'b1111100:begin //Lw
            ALUOp_o <= 3'b001;
            ALUSrc_o <= 1'b1;
            RegWrite_o <= 1'b1;
            MemRd_o <= 1'b1;
            MemWr_o <= 1'b0;
            MemToReg_o <= 1'b1;
            RegDst_o <= 1'b1;
            PCSrc_o <= 1'b0;
            ImmSel_o <= 2'b01;
        end

        7'b1101100:begin //Sw
            ALUOp_o <= 3'b001;
            ALUSrc_o <= 1'b1;
            RegWrite_o <= 1'b0;
            MemRd_o <= 1'b0;
            MemWr_o <= 1'b1;
            MemToReg_o <= 1'b0;
            RegDst_o <= 1'b0;
            PCSrc_o <= 1'b0;
            ImmSel_o <= 2'b10;
        end

        7'b1011001:begin //SB
            ALUOp_o <= 3'b110;
            ALUSrc_o <= 1'b1;
            RegWrite_o <= 1'b0;
            MemRd_o <= 1'b0;
            MemWr_o <= 1'b0;
            MemToReg_o <= 1'b0;
            RegDst_o <= 1'b0;
            PCSrc_o <= 1'b1;
            ImmSel_o <= 2'b11;
        end

        7'b0110011:begin //UJ
            ALUOp_o <= 3'b000;
            ALUSrc_o <= 1'b1;
            RegWrite_o <= 1'b0;
            MemRd_o <= 1'b0;
            MemWr_o <= 1'b0;
            MemToReg_o <= 1'b0;
            RegDst_o <= 1'b0;
            PCSrc_o <= 1'b1;
            ImmSel_o <= 2'b00;
        end

    endcase
    //$display("ALUOp_o = %b ,ALUSrc_o = %b, RegWrite_o = %b, MemRd_o = %b, MemWr_o = %b, MemToReg_o = %b, RegDst_o = %b,
      //      PCSrc_o = %b, ImmSel_o = %b",ALUOp_o, ALUSrc_o, RegWrite_o, MemRd_o, MemWr_o, MemToReg_o, RegDst_o, ImmSel_o);

end

endmodule

module data_memory(
input wire [7:0] addr,          // Memory Address
input wire [7:0] write_data,    // Memory Address Contents
input wire       memwrite, memread,
input wire       clk,reset,           // All synchronous elements, including memories, should have a clock signal
output reg [7:0] read_data      // Output of Memory Address Contents
);

reg [7:0] sMEMO[0:30];
reg [7:0] sread_data;
reg [7:0] MEMO[0:30];  // 256 words of 8-bit memory

integer i;

always@(posedge clk or negedge reset)
begin
  if (!reset) begin
    sread_data <= 8'h00;
    for (i = 0; i < 30; i = i + 1) begin
        sMEMO[i] <= 8'h00 + i;
    end
  end  
  else
    begin
     sMEMO[addr] <= write_data;
     sread_data <= MEMO[addr];
    end
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(posedge clk) begin
  if (memwrite == 1'b1) begin
    MEMO[addr] <= sMEMO[addr];
  end
  // Use memread to indicate a valid address is on the line and read the memory into a register at that address when memread is asserted
  if (memread == 1'b1) begin
    read_data <= sread_data;
  end

  //$display("mem[4]:%d, mem[5]:%d, mem[7]:%d ",MEMO[4] ,MEMO[5], MEMO[7]);
end

endmodule

module IDEX(input            clock, reset, flush,
            input[7:0]       pc, imm, 
            input[7:0]       Rdata1, Rdata2, 
            input[4:0]       Rd, Rs1, Rs2, 
            input[6:0]       opCode, funct7,
            input[2:0]       funct3, ALUOp_in,
            input        ALUSrc_in, RegDst_in, PCSrc_in,
                             RegWrite_in ,MemRd_in,MemWr_in,MemToReg_in,
            output reg[7:0]  IDEX_pc, IDEX_imm,
            output reg[7:0]  IDEX_Rdata1, IDEX_Rdata2,
            output reg[4:0]  IDEX_Rd, IDEX_Rs2, IDEX_Rs1,
            output reg[6:0]  IDEX_opCode, IDEX_funct7,
            output reg[2:0]  IDEX_funct3, IDEX_ALUOp,
            output reg       IDEX_ALUSrc, IDEX_RegDst, IDEX_PCSrc, 
                             IDEX_MemRead, IDEX_MemWrite, IDEX_RegWrite, IDEX_MemToReg);

            reg[7:0]  sIDEX_pc, sIDEX_imm;
          reg[7:0]  sIDEX_Rdata1, sIDEX_Rdata2;
         reg[4:0]  sIDEX_Rd, sIDEX_Rs2, sIDEX_Rs1;
          reg[6:0]  sIDEX_opCode, sIDEX_funct7;
          reg[2:0]  sIDEX_funct3, sIDEX_ALUOp;
          reg       sIDEX_ALUSrc, sIDEX_RegDst, sIDEX_PCSrc, 
                    sIDEX_MemRead, sIDEX_MemWrite, sIDEX_RegWrite, sIDEX_MemToReg;


always@(posedge clock or negedge reset)
begin
   if (!reset)
      begin
         // Reset
         sIDEX_pc          <= 8'h0;
         sIDEX_Rd          <= 5'h0;
         sIDEX_Rs1         <= 5'h0;
         sIDEX_Rs2         <= 5'h0;
         sIDEX_imm         <= 8'h0;
         sIDEX_Rdata1      <= 8'h0;
         sIDEX_Rdata2      <= 8'h0;

         sIDEX_opCode      <= 7'h0;
         sIDEX_funct7      <= 7'h0;

         sIDEX_funct3      <= 3'b000;
         sIDEX_ALUOp       <= 3'b000;

         sIDEX_ALUSrc      <= 1'b0;
         sIDEX_RegDst      <= 1'b0;
         sIDEX_PCSrc       <= 1'b0;
         sIDEX_MemRead     <= 1'b0;
         sIDEX_MemWrite    <= 1'b0;
         sIDEX_RegWrite    <= 1'b0;
         sIDEX_MemToReg    <= 1'b0;
      end
      else if(flush)
      begin
         sIDEX_pc          <= 8'h0;
         sIDEX_Rd          <= 5'h0;
         sIDEX_Rs1         <= 5'h0;
         sIDEX_Rs2         <= 5'h0;
         sIDEX_imm         <= 8'h0;
         sIDEX_Rdata1      <= 8'h0;
         sIDEX_Rdata2      <= 8'h0;

         sIDEX_opCode      <= 7'h0;
         sIDEX_funct7      <= 7'h0;

         sIDEX_funct3      <= 3'b000;
         sIDEX_ALUOp       <= 3'b000;

         sIDEX_ALUSrc      <= 1'b0;
         sIDEX_RegDst      <= 1'b0;
         sIDEX_PCSrc       <= 1'b0;
         sIDEX_MemRead     <= 1'b0;
         sIDEX_MemWrite    <= 1'b0;
         sIDEX_RegWrite    <= 1'b0;
         sIDEX_MemToReg    <= 1'b0;
      end
      else
      begin
      
      sIDEX_pc          <= pc;
      sIDEX_Rd          <= Rd;
      sIDEX_Rs1         <= Rs1;
      sIDEX_Rs2         <= Rs2;
      sIDEX_imm         <= imm;
      sIDEX_Rdata1      <= Rdata1;
      sIDEX_Rdata2      <= Rdata2;

      sIDEX_opCode      <= opCode;
      sIDEX_funct7      <= funct7;

      sIDEX_funct3      <= funct3;
      sIDEX_ALUOp       <= ALUOp_in;

      sIDEX_ALUSrc      <= ALUSrc_in;
      sIDEX_RegDst      <= RegDst_in;
      sIDEX_PCSrc       <= PCSrc_in;
      sIDEX_MemRead     <= MemRd_in;
      sIDEX_MemWrite    <= MemWr_in;
      sIDEX_RegWrite    <= RegWrite_in;
      sIDEX_MemToReg    <= MemToReg_in;
      
      end
      
end


// Output
always@(*)
begin
      IDEX_pc          <= sIDEX_pc;
      IDEX_Rd          <= sIDEX_Rd;
      IDEX_Rs1         <= sIDEX_Rs1;
      IDEX_Rs2         <= sIDEX_Rs2;
      IDEX_imm         <= sIDEX_imm;
      IDEX_Rdata1      <= sIDEX_Rdata1;
      IDEX_Rdata2      <= sIDEX_Rdata2;

      IDEX_opCode      <= sIDEX_opCode;
      IDEX_funct7      <= sIDEX_funct7;

      IDEX_funct3      <= sIDEX_funct3;
      IDEX_ALUOp       <= sIDEX_ALUOp;

      IDEX_ALUSrc      <= sIDEX_ALUSrc;
      IDEX_RegDst      <= sIDEX_RegDst;
      IDEX_PCSrc       <= sIDEX_PCSrc;
      IDEX_MemRead     <= sIDEX_MemRead;
      IDEX_MemWrite    <= sIDEX_MemWrite;
      IDEX_RegWrite    <= sIDEX_RegWrite;
      IDEX_MemToReg    <= sIDEX_MemToReg;
end

endmodule

module EXMEM(
            input            clock, reset,
            input[7:0]       ALU, Rdata2, PC_IDEX,
            input[4:0]       Rd,
            input            RegWrite_in ,MemRd_in ,MemWr_in ,MemToReg_in, PCSrc_in,
            output reg[7:0]  EXMEM_ALU, EXMEM_Rdata2, EXMEM_PC_O,
            output reg[4:0]  EXMEM_Rd, 
            output reg       EXMEM_MemRead, EXMEM_MemWrite, EXMEM_RegWrite, EXMEM_MemToReg, EXMEM_PCSrc);


reg[7:0]  s_EXMEM_ALU, s_EXMEM_Rdata2, sEXMEM_PC_O;
reg[4:0]  s_EXMEM_Rd;
reg       s_EXMEM_MemRead, s_EXMEM_MemWrite, s_EXMEM_RegWrite, s_EXMEM_MemToReg, s_EXMEM_PCSrc;


always@(posedge clock or negedge reset)
begin
   if (!reset)
      begin
// Reset
      s_EXMEM_ALU         <= 8'h0;
      s_EXMEM_Rdata2      <= 8'h0;
      s_EXMEM_Rd          <= 5'h0;
      s_EXMEM_MemRead     <= 1'b0;
      s_EXMEM_MemWrite    <= 1'b0;
      s_EXMEM_RegWrite    <= 1'b0;
      s_EXMEM_MemToReg    <= 1'b0;
      s_EXMEM_PCSrc       <= 1'b0;
      sEXMEM_PC_O      <= 1'b0;
      end
      else
      begin
        s_EXMEM_ALU         <= ALU;
   s_EXMEM_Rdata2      <= Rdata2;
   s_EXMEM_Rd          <= Rd;
   s_EXMEM_MemRead     <= MemRd_in;
   s_EXMEM_MemWrite    <= MemWr_in;
   s_EXMEM_RegWrite    <= RegWrite_in;
   s_EXMEM_MemToReg    <= MemToReg_in;
   s_EXMEM_PCSrc       <= PCSrc_in;
   sEXMEM_PC_O <= PC_IDEX;
   
      end
end

// Output
always@(*)
begin
   EXMEM_ALU         <= s_EXMEM_ALU;
   EXMEM_Rdata2      <= s_EXMEM_Rdata2;
   EXMEM_Rd          <= s_EXMEM_Rd;
   EXMEM_MemRead     <= s_EXMEM_MemRead;
   EXMEM_MemWrite    <= s_EXMEM_MemWrite;
   EXMEM_RegWrite    <= s_EXMEM_RegWrite;
   EXMEM_MemToReg    <= s_EXMEM_MemToReg;
   EXMEM_PCSrc       <= s_EXMEM_PCSrc;
   EXMEM_PC_O      <= sEXMEM_PC_O;
end

endmodule

module MEMWB(      input            clock, reset,
                   input[7:0]       ALU, ReadData,
                   input[4:0]       Rd,
                   input            RegWrite_in, MemToReg_in,
                   output reg[7:0]  MEMWB_ALU, MEMWB_ReadData,
                   output reg[4:0]  MEMWB_Rd,
                   output reg       MEMWB_RegWrite, MEMWB_MemToReg);


                  reg[7:0]  sMEMWB_ALU, sMEMWB_ReadData;
                reg[4:0]  sMEMWB_Rd;
               reg       sMEMWB_RegWrite, sMEMWB_MemToReg;

always@(posedge clock or negedge reset)
begin
   if (!reset)
   begin
      sMEMWB_ALU         <= 8'h0;
      sMEMWB_ReadData    <= 8'h0;
      sMEMWB_Rd          <= 5'h0;
      sMEMWB_RegWrite    <= 1'b0;
      sMEMWB_MemToReg    <= 1'b0;
   end
   else
   begin
   sMEMWB_ALU         <= ALU;
   sMEMWB_ReadData    <= ReadData;
   sMEMWB_Rd          <= Rd;
   sMEMWB_RegWrite    <= RegWrite_in;
   sMEMWB_MemToReg    <= MemToReg_in;
   
   end
end

always@(*)
begin
   MEMWB_ALU         <= sMEMWB_ALU;
   MEMWB_ReadData    <= sMEMWB_ReadData;
   MEMWB_Rd          <= sMEMWB_Rd;
   MEMWB_RegWrite    <= sMEMWB_RegWrite;
   MEMWB_MemToReg    <= sMEMWB_MemToReg;

end

endmodule


module hazardUnit(input[4:0] IFID_Rs1, IFID_Rs2, IDEX_Rd, 
                  input      IDEX_memRead, 
                  output reg pc_stall, IFID_stall, IDEX_flush);

always@(*)
begin

   // Hazard occur, stall process, reset pc

   if ((IFID_Rs1 != 0) && (IFID_Rs2 != 0) && IDEX_memRead && ((IFID_Rs1 == IDEX_Rd) || (IFID_Rs2 == IDEX_Rd)))
      begin //$display("stall");
         pc_stall      = 1'b1;
         IFID_stall    = 1'b1;
         IDEX_flush    = 1'b1;
      end
   else 
      begin //$display("No Hazard");
         pc_stall      = 1'b0;
         IFID_stall    = 1'b0;
         IDEX_flush    = 1'b0;
      end
end

endmodule


module instructionMemory(input           clock, reset, 
                         input[7:0]      programCounter, 
                         output reg[31:0] readRegister);

reg [31:0] instruction [12:0];

always@(posedge clock or negedge reset)
begin
   if(!reset) begin
      // I format-----------imm----------- rs--- fun rd--- opcode-----
      // R format-----------fun7-----rs2-- rs1-- fun rd--- opcode-----
      // s format-----------i11-5----rs2-- rs1-- fun i4-0- opcode-----
      instruction[00] <= 32'b0000000_00001_00000_001_00101_1111100;  //lw $5, 1($0)   r5<=1
      instruction[01] <= 32'b0000000_00010_00000_010_00110_1111100;  //lw $6, 2($0)   r6<=2
      instruction[02] <= 32'b0000000_00010_00101_000_00111_0011011;  //addi $7, $5, 2 r7<=1+2=3
      instruction[03] <= 32'b0000000_00110_00101_001_00100_0110110;  //sub $4, $5, $6 r4<=1-2=-1
      instruction[04] <= 32'b0000000_00100_00000_001_00100_0110110;  //sub $4, $0, $4 r4<=-(-1)=1   (com $4, $4)   
      /*instruction[05] <= 32'b0000000_00101_00100_000_01100_1011001;  //beq $5, $4, 6  if (r5==r4) pc=pc+3
      instruction[06] <= 32'b0000000_00010_00000_010_00101_1111100;  //lw $5, 2($0)   r5<=2 nop
      instruction[07] <= 32'b0000000_00110_00111_000_00111_0110110;  //add $7, $7, $6 r7<=3+2=5 nop
      instruction[08] <= 32'b0000000_00101_00101_010_00101_0110110;  //lsl $5, $5, $5 r5<=1X2=2
      instruction[09] <= 32'b0000000_00111_00101_100_00111_0110110;  //and $7, $5, $7 r7<=11^10=01=1
      instruction[10] <= 32'b0000000_00101_00000_010_00101_1101100;  //sw $5, 5($0)   mem[0+5]<=2  
      instruction[11] <= 32'b0000000_00111_00000_001_00111_1101100;  //sw $7, 7($0)   mem[7]<=1
      instruction[12] <= 32'b0000000_00100_00000_001_00100_1101100;  //sw $4. 4($0)   mem[4]<=1 */
   end
end
	
always@(*)
begin
   readRegister = instruction[programCounter>>2];
   $display("PC:%d Instruction[%d]:%b ",programCounter ,(programCounter>>2), instruction[programCounter>>2]);
end

endmodule

module IFID(input           clock, reset, stall, flush,
                  input[7:0]      programCounter,
		  input[31:0]	instructionMemory,
        output reg[31:0] IFID_instMem,
                  output reg[7:0] IFID_pc);

reg[7:0] temp_programCounter;
reg[31:0] temp_instructionMemory;

always@(posedge clock or negedge reset)
begin
   if (!reset)
      begin
         temp_programCounter    <= 8'h00;
         temp_instructionMemory <= 32'h00000000;
      end
   else if (stall)
      begin
         // Stall
         temp_programCounter    <= temp_programCounter;
         temp_instructionMemory <= temp_instructionMemory;
      end
   //else if (flush)
     // begin
     //    temp_programCounter    <= 0;
     //    temp_instructionMemory <= 0;
   //   end
   else
      begin
         temp_programCounter    <= programCounter;
         temp_instructionMemory <= instructionMemory;
      end
end

// Output PC and instruction Memory
always@(*)
begin
   IFID_pc             <= temp_programCounter;
   IFID_instMem        <= temp_instructionMemory;
end

endmodule


module muxHazard(
input	[2:0]	ALUOp_i,
input	RegDst_i, Hazard_i, ALUSrc_i, RegWrite_i, MemToReg_i, MemRead_i, MemWrite_i,
output	reg[2:0]	ALUOp_o,
output  reg[1:0]    ImmSel_o, 
output	reg RegDst_o, ALUSrc_o, RegWrite_o, MemToReg_o, MemRead_o, MemWrite_o, PCSrc_o);

always@(*)begin
    case(Hazard_i)
    1'b1 : begin
        RegDst_o <=1'b0;  
        ALUOp_o <= 3'b000;
        ALUSrc_o <= 1'b0; 
        RegWrite_o <= 1'b0;
        MemToReg_o <= 1'b0;
        MemRead_o <= 1'b0;
        MemWrite_o <= 1'b0;
        PCSrc_o <= 1'b0;
        ImmSel_o <= 2'b00;
    end

    1'b0 : begin
        RegDst_o <= RegDst_i;  
        ALUOp_o <= ALUOp_i;
        ALUSrc_o <= ALUSrc_i; 
        RegWrite_o <= RegWrite_i;
        MemToReg_o <= MemToReg_i;
        MemRead_o <= MemRead_i;
        MemWrite_o <= MemWrite_i;
        ImmSel_o <= ImmSel_o;
    end

    default : begin
        RegDst_o <= RegDst_i;  
        ALUOp_o <= ALUOp_i;
        ALUSrc_o <= ALUSrc_i; 
        RegWrite_o <= RegWrite_i;
        MemToReg_o <= MemToReg_i;
        MemRead_o <= MemRead_i;
        MemWrite_o <= MemWrite_i;
        ImmSel_o <= ImmSel_o;
    end

    endcase
end
endmodule

module ALU(
    input [7:0] data1_i, data2_i,
    input [6:0] funct7,//funct7[9:3]+funct3[2:0]
    input [2:0] funct3,
    input [2:0] ALUOp_i,//00 for addi
    output reg[7:0] data_o,
    output reg Zero_o
);


reg[9:0] funct_i;



always@(*)begin

funct_i <= (funct7 << 7) + funct3;

  case(ALUOp_i)
    
    3'b011 : begin //R
        case(funct_i)
            3'b000 : begin //addi
                data_o = data1_i + data2_i;
            end
            3'b001 : begin //subi
                data_o = data1_i - data2_i;
            end
            3'b011 : begin //ori
                data_o = data1_i | data2_i;
            end
            3'b111 : begin //xori
                data_o = data1_i ^ data2_i;
            end
            3'b100 : begin //andi
                data_o = data1_i & data2_i;
            end
        endcase
    end

    3'b010 : begin //R
        case(funct_i)
            10'b0000000000 : begin //add
                data_o = data1_i + data2_i;
            end
            10'b0000000001 : begin //sub
                data_o = data1_i - data2_i;
            end
            10'b1000000010 : begin //lsl
                data_o = data1_i << data2_i;
            end
            10'b1100000010 : begin //lsr
                data_o = data1_i >> data2_i;
            end
            10'b0000000011 : begin //or
                data_o = data1_i | data2_i;
            end
            10'b1000000111 : begin //xor
                data_o = data1_i ^ data2_i;
            end
            10'b0000000100 : begin //and
                data_o = data1_i & data2_i;
            end
            10'b1000000110 : begin //greater
                data_o = data1_i > data2_i;
            end
            10'b1100000110 : begin //less
                data_o = data1_i < data2_i;
            end
            10'b1110000110 : begin //equal
                data_o = data1_i == data2_i;
            end
            default : begin
                //ALUCtrl_o = 3'b000;
            end
        endcase
    end

    3'b110 : begin //sb
        case(funct_i)
            3'b000 : begin //eq
                data_o = data1_i == data2_i;
            end
            3'b001 : begin //neq
                data_o = data1_i != data2_i;
            end
            3'b011 : begin //greater
                data_o = data1_i > data2_i;
            end
            3'b111 : begin //less
                data_o = data1_i < data2_i;
            end
        endcase
    end

    3'b001 : begin //sw or lw
        data_o = data1_i + data2_i;
    end

    default : begin
        data_o = data_o;
    end
    endcase

    Zero_o = (data_o == 0)?0:1;
    $display("Rs1:%d Rs2:%d ALUResult:%d ",data1_i ,data2_i, data_o);
end

endmodule

module processor
(
clk,
reset,
aluout
);

// IO
input clk;
input reset;
output [7:0] aluout;
// Wire ---------------------------------------------------------------------------------------------------------------------------------------------

// Program Counter
wire [7:0] pc_in, pc_out, pc_out_ifid, pc_out_idex, pc_out_branch;
wire pc_stall;

//IF/ID
wire [31:0] instruction_memory_out, instruction_memory_out_ifid;
wire ifid_stall, idex_flush;
wire [7:0] register_read_data1, register_read_data2;

// ID/EX
wire [7:0] idex_imm, idex_Rdata1, idex_Rdata2;
wire [4:0] idex_Rd, idex_Rs1, idex_Rs2;
wire [6:0] idex_Opcode, idex_funct7;
wire [2:0] idex_funct3, idex_alu_opcode;
wire    idex_alu_src, idex_reg_dst, idex_pc_src, idex_mem_read, idex_mem_write, idex_reg_write, idex_mem_to_reg;

// Forwardunit
wire [1:0] forward_mux_top, forward_mux_bottom;

//MuxHazard
wire [2:0] mux_hazard_alu_opcode;
wire [1:0] mux_hazard_imm_sel;
wire mux_hazard_reg_dst, mux_hazard_alu_src, mux_hazard_reg_write, mux_hazard_mem_to_reg, mux_hazard_mem_read, mux_hazard_mem_write, mux_hazard_pc_src; 

// Mux
wire [7:0] forward_out1, forward_out2, alumux_out;
wire [4:0] regdstmux_out;

//Control
wire [1:0] control_imm_select;
wire [7:0] imm_out;
wire control_alu_src, control_reg_dst, control_pc_src, control_reg_write, control_mem_rd, control_mem_wr, control_mem_to_reg;
wire [2:0] control_alu_opcode;

//MEM/WB
wire memwb_reg_write, memwb_mem_to_reg;
wire [7:0] wb_data, memwb_alu_out, memwb_data_memory_out;
wire [4:0] memwb_Rd;

//ALU
wire [7:0] alu_out;
wire alu_zero_out;

// Data Memory
wire [7:0] data_memory_out;

// EX/MEM
wire [7:0] exmem_alu, exmem_Rdata2;
wire [4:0] exmem_Rd;
wire exmem_mem_read, exmem_mem_write, exmem_reg_write, exmem_mem_to_reg, exmem_pc_src;

assign aluout = exmem_alu;
// Module ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// IF/ID
pc pc(
    // Input
    .clk(clk),          //1
    .reset(reset),      //1
    .hazard(pc_stall),  //1
    .pc_i(pc_in),       //1
    // Output
    .pc_o(pc_out));       //8

instructionMemory instruction_mem(
    //input
    .clock(clk),        //1
    .reset(reset),      //1
    .programCounter(pc_out),            //8
    //output
    .readRegister(instruction_memory_out));    //31

IFID IFID(
    // Input
    .clock(clk),        //1
    .reset(reset),      //1
    .stall(ifid_stall), //1
    .flush(idex_pc_src),  //1
    .programCounter(pc_out),                //8
    .instructionMemory(instruction_memory_out),    //8
    //Output
    .IFID_pc(pc_out_ifid),                  //8
    .IFID_instMem(instruction_memory_out_ifid));   //8

hazardUnit hazard(
    // Input
    .IFID_Rs1(instruction_memory_out_ifid[19:15]),    //5
    .IFID_Rs2(instruction_memory_out_ifid[24:20]),   //5
    .IDEX_Rd(instruction_memory_out_ifid[11:7]),     //5
    .IDEX_memRead(idex_mem_read),              //1
    // Output
    .pc_stall(pc_stall),                    //1
    .IFID_stall(ifid_stall),                //1
    .IDEX_flush(idex_flush));               //1

registerFile register(
    // Input
    .clock(clk),                //1
    .reset(reset),              //1
    .regWrite(memwb_reg_write), //1
    .rAddr1(instruction_memory_out_ifid[19:15]),     //8
    .rAddr2(instruction_memory_out_ifid[24:20]),    //8
    .wAddr(instruction_memory_out_ifid[11:7]),     //8
    .datain(wb_data),       //8
    // Output
    .output1(register_read_data1),     //8
    .output2(register_read_data2));   //8

Control control(
    // Input
    .Op_i(instruction_memory_out_ifid[6:0]),   //7
    // Output
    .ALUOp_o(control_alu_opcode),          //3
    .ImmSel_o(control_imm_select),      //2
    .ALUSrc_o(control_alu_src),        //1
    .RegDst_o(control_reg_dst),        //1
    .PCSrc_o(control_pc_src),                   //1
    .RegWrite_o(control_reg_write),    //1
    .MemRd_o(control_mem_rd),          //1
    .MemWr_o(control_mem_wr),          //1
    .MemToReg_o(control_mem_to_reg));   //1

mux2to1 muxBranch(
    // Input
    .a(pc_out),             //8
    .b(pc_out_branch),          //8
    .sel(exmem_pc_src),           //1
    // Output
    .out(pc_in));           //8

Imm_gen immgen(
    // Input
    .ImmSel_o(control_imm_select),            //2  from control
    .Instr(instruction_memory_out_ifid),               //32
    // Output
    .Imm_o(imm_out));              //8

muxHazard muxhazard(
    // Input
    .ALUOp_i(control_alu_opcode),          //3
    .RegDst_i(control_reg_dst),        //1
    .Hazard_i(idex_flush),              //1
    .ALUSrc_i(control_alu_src),        //1
    .RegWrite_i(control_reg_write),    //1
    .MemToReg_i(control_mem_to_reg),    //1
    .MemRead_i(control_mem_rd),        //1
    .MemWrite_i(control_mem_wr),       //1
    // Output
    .ALUOp_o(mux_hazard_alu_opcode),             //3
    .ImmSel_o(mux_hazard_imm_sel),            //2
    .RegDst_o(mux_hazard_reg_dst),            //1
    .ALUSrc_o(mux_hazard_alu_src),            //1
    .RegWrite_o(mux_hazard_reg_write),          //1
    .MemToReg_o(mux_hazard_mem_to_reg),          //1
    .MemRead_o(mux_hazard_mem_read),           //1
    .MemWrite_o(mux_hazard_mem_write),        //1
    .PCSrc_o(mux_hazard_pc_src));           //1

// ID/EX ---------------------------------------------------------------------------------------------
mux4to1 muxEX_top(
    // Input
    .a(idex_Rdata1),           //8
    .b(wb_data),    //8
    .c(exmem_alu),          //8
    .d(idex_imm),          //8
    .sel(forward_mux_top),      //2
    // Output
    .out(forward_out1));       //8

mux4to1 muxEX_Bottom(
    // Input
    .a(idex_Rdata2),           //8
    .b(wb_data),    //8
    .c(exmem_alu),          //8
    .d(idex_imm),          //8
    .sel(forward_mux_bottom),      //2
    // Output
    .out(forward_out2));       //8

IDEX IDEX(
    // Input
    .clock(clk),        //1
    .reset(reset),      //1
    .flush(idex_flush), //1
    .pc(pc_out_ifid),   //8
    .imm(imm_out),             //8
    .Rdata1(register_read_data1),          //8
    .Rdata2(register_read_data2),          //8
    .Rd(instruction_memory_out_ifid[11:7]),              //5
    .Rs1(instruction_memory_out_ifid[19:15]),             //5
    .Rs2(instruction_memory_out_ifid[24:20]),             //5
    .opCode(instruction_memory_out_ifid[6:0]),          //7
    .funct7(instruction_memory_out_ifid[31:25]),          //7
    .funct3(instruction_memory_out_ifid[14:12]),          //3
    .ALUOp_in(mux_hazard_alu_opcode),        //3
    .ALUSrc_in(mux_hazard_alu_src),       //1
    .RegDst_in(mux_hazard_reg_dst),       //1
    .PCSrc_in(mux_hazard_pc_src),        //1
    .RegWrite_in(mux_hazard_reg_write),     //1
    .MemRd_in(mux_hazard_mem_read),        //1
    .MemWr_in(mux_hazard_mem_write),        //1
    .MemToReg_in(mux_hazard_mem_to_reg),     //1
    // Output
    .IDEX_pc(pc_out_idex),         //8
    .IDEX_imm(idex_imm),        //8
    .IDEX_Rdata1(idex_Rdata1),     //8
    .IDEX_Rdata2(idex_Rdata2),     //8
    .IDEX_Rd(idex_Rd),         //5
    .IDEX_Rs1(idex_Rs1),        //5
    .IDEX_Rs2(idex_Rs2),        //5
    .IDEX_opCode(idex_Opcode),     //7
    .IDEX_funct7(idex_funct7),     //7
    .IDEX_funct3(idex_funct3),     //3
    .IDEX_ALUOp(idex_alu_opcode),      //3
    .IDEX_ALUSrc(idex_alu_src),     //1
    .IDEX_RegDst(idex_reg_dst),     //1
    .IDEX_PCSrc(idex_pc_src),      //1
    .IDEX_MemRead(idex_mem_read),    //1
    .IDEX_MemWrite(idex_mem_write),   //1
    .IDEX_RegWrite(idex_reg_write),   //1
    .IDEX_MemToReg(idex_mem_to_reg));  //1


// EX/MEM ----------------------------------------------------------------------------------------------------------------------
EXMEM exmem(
    // Input
    .clock(clk),    //1
    .reset(reset),  //1
    .ALU(alu_out),         //8
    .Rdata2(forward_out2),      //8
    .Rd(regdstmux_out),          //5
    .RegWrite_in(idex_reg_write), //1
    .MemRd_in(idex_mem_read),    //1
    .MemWr_in(idex_mem_write),    //1
    .MemToReg_in(idex_mem_to_reg), //1
    .PCSrc_in(idex_pc_src),    //1
    .PC_IDEX(pc_out_idex),
    // Output
    .EXMEM_ALU(exmem_alu),   //8
    .EXMEM_Rdata2(exmem_Rdata2),//8
    .EXMEM_Rd(exmem_Rd),    //5
    .EXMEM_MemRead(exmem_mem_read),   //1
    .EXMEM_MemWrite(exmem_mem_write),  //1
    .EXMEM_RegWrite(exmem_reg_write),  //1
    .EXMEM_MemToReg(exmem_mem_to_reg),  //1
    .EXMEM_PC_O(pc_out_branch),
    .EXMEM_PCSrc(exmem_pc_src));     //1

mux2to1 alumux(
    //input
    .a(forward_out2),
    .b(idex_imm),
    .sel(idex_alu_src),
    //output
    .out(alumux_out));

mux2to1_5bit regdstmux(
    //input
    .a(idex_Rs2),
    .b(idex_Rd),
    .sel(idex_reg_dst),
    //output
    .out(regdstmux_out));

ALU ALU(
    // Input
    .data1_i(forward_out1),        //8
    .data2_i(alumux_out),        //8
    .funct7(idex_funct7),             //7
    .funct3(idex_funct3),              //3
    .ALUOp_i(idex_alu_opcode),  //3
    // Output
    .data_o(alu_out),          //8
    .Zero_o(alu_zero_out));             //1

forwardunit forward(
    // Input
    .EX_MEM_RegWrite_i(exmem_reg_write),   //1
    .MEM_WB_RegWrite_i(memwb_reg_write),   //1
    .ID_EX_RS_i(idex_Rs1), //8
    .ID_EX_RT_i(idex_Rs2), //8    instr[rs2]
    .EX_MEM_RD_i(exmem_Rd),         //8
    .MEM_WB_RD_i(memwb_Rd),         //8
    // Output
    .forward_mux1(forward_mux_top),     //2
    .forward_mux2(forward_mux_bottom));    //2

// MEM/WB --------------------------------------------------------------------------------
data_memory data_mem(
    // Input
    .addr(alu_out),          //8
    .write_data(exmem_Rdata2),   //8
    .memwrite(exmem_mem_write),   //1
    .memread(exmem_mem_read),     //1
    .clk(clk),                      //1
    .reset(reset),
    // Output
    .read_data(data_memory_out));        //8
    
MEMWB MEMWB(
    // Input
    .clock(clk),        //1
    .reset(reset),      //1
    .ALU(alu_out),             //8
    .ReadData(data_memory_out),        //8
    .Rd(exmem_Rd),              //5
    .RegWrite_in(exmem_reg_write),     //1
    .MemToReg_in(exmem_mem_to_reg),     //1
    // Output
    .MEMWB_ALU(memwb_alu_out),       //8
    .MEMWB_ReadData(memwb_data_memory_out),  //8
    .MEMWB_Rd(memwb_Rd),        //5
    .MEMWB_RegWrite(memwb_reg_write),  //1
    .MEMWB_MemToReg(memwb_mem_to_reg)); //1

mux2to1 muxDataMem(
    // Input
    .a(memwb_data_memory_out),         //8
    .b(memwb_alu_out),   //8
    .sel(memwb_mem_to_reg),        //1
    // Output
    .out(wb_data));         //8

/*
initial
begin
   clk = 0;
   reset = 0;

   #5 reset = 1;
end

initial
begin
   forever #10 clk = ~clk;
end

initial
begin
   #500 $finish;
end

*/
endmodule

