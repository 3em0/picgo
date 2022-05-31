`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/02 08:14:43
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
input clk,
input rst,
input change, //RF 1 DM 0
input [4:0] choose,//���żĴ���
input level,//ѡ���16 1 ���ǵ�16 0
output wire [3:0]an,//ʹ�ܶ�
output wire [6:0]seg
    );
    // 100 000000
//    reg clk = 0;
//    reg [99:0] cnt =100'b0;
//    always@(posedge clk1) 
//    begin
//        if(cnt > 20000000)
//            begin
//                cnt <= 0;
//                clk <= ~clk;
//            end
//        else
//            begin
//                cnt <= cnt + 1;
//            end
//    end
    //ȫ��RF DM
    wire [1023:0] RF;
    wire [1023:0] DM;
    wire [15:0] data1;
    //CTRL ģ������
    wire [1:0] NPCop;//�Ƿ�Ϊ��֧��� ����0λ
    wire [1:0]Mem2Reg;// ����
    wire Mem2Write;//DM�Ƿ��д 1��
    wire [1:0] ALUC;//ALU����
    wire IMrc; //1 Imm 0 rs1
    wire RFw; //Rf �Ƿ��д
    wire [4:0] rd;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [2:0] EXTop;// 4 ��Top
    wire PCwr; //pc��д
    wire IMen;//IM ʹ�ܶ� 1 ����address��
    wire DMwr;
    //3·ѡ����
    wire [31:0] RegD;
    //2·ѡ����
    wire [31:0]IMR;
    //NPC
    wire [31:0] u_NPC;
    //PC
    wire [31:0] u_PC;
    //U_ALU
    wire Zero;//��� 0�ź�
    wire [31:0]data; //���������
    //DM
    wire [31:0] DMout;
    //ext
    wire [31:0]imm32;
    //IM
     wire[31:0]IM;
     //RF
     wire [31:0] RFouts1;
     wire [31:0] RFouts2;
/*
input wire [31:0] IM,
input zero,
input rst,
input clk,
*/     
    ctrl  Ctrl(
     .IM(IM),
     .zero(Zero),
     .rst(rst),
     .clk(clk),
     .NPCop(NPCop),
     .Mem2Reg(Mem2Reg),
     .Mem2Write(Mem2Write),
     .ALUC(ALUC),
     .IMrc(IMrc),
     .RFw(RFw),
     .rd(rd),
     .rs1(rs1),
     .rs2(rs2),
     .EXTop(EXTop),
     .PCwr(PCwr),
     .IMen(IMen),
     .DMwr(DMwr)
     );
          /*
      input clk,
    input rst,
    input wire[31:0] Rs1,//���� R[rs1]
    input wire[31:0] Imr,// R[rs2] imm
    input wire [1:0]ALUC,//ALU�������
     */
     U_ALU u_alu(
     .clk(clk),
     .rst(rst),
     .Rs1(RFouts1),
     .Imr(IMR),
     .ALUC(ALUC),
     .Zero(Zero),
     .data(data)
     );
    /*
    input rst,
    input wire[31:0]IMaddr,
    input clk,
    input IMen,
     */
     U_IM u_im(
     .IMaddr(u_PC),
     .clk(clk),
     .IMen(IMen),
     .In(IM)
     );
     /*
     input wire [1:0] Mem2Reg,
    input wire [31:0] Mem,
    input wire [31:0] NPc,
    input wire [31:0] ALu,
    input wire [31:0] Imm,
     */ 
     MUX_THREE Mux_Three(
     .Mem2Reg(Mem2Reg),
     .Mem(DMout),
     .NPc(u_NPC),
     .ALu(data),
     .Imm(imm32),
     .RegD(RegD)
     );
     /*
     input wire [31:0]Rs2,
    input wire [31:0]Imm,
    input Imrc,
     */
     MUX_TWO Mux_TWO(
     .clk(clk),
     .Rs2(RFouts2),
     .Imm(imm32),
     .Imrc(IMrc),
     .IMR(IMR)
     );
     /*
     input wire clk,
    input wire rst,
    input wire [31:0] Rs1,
    input wire [31:0] PC,
    input wire [31:0] imm,
    input wire [1:0]  NPCop,
     */
     NPC Npc(
     .clk(clk),
     .rst(rst),
     .Rs1(RFouts1),
     .PC(u_PC),
     .PCwr(PCwr),
     .imm(imm32),
     .NPCop(NPCop),
     .NPC(u_NPC)
     );
     
     /*
     input [31:0]NPC,
    input clk,
    input rst,
    input PCwr,
     */
     PC u_pc(
     .NPC(u_NPC),
     .clk(clk),
     .rst(rst),
     .PCwr(PCwr),
     .PC(u_PC)
     );

     /*
     input wire [31:0]DMin,
input wire [31:0]DMaddr,
input DMwr,
input clk,
input rst,
     */
     U_DM u_dm(
     .DMin(RFouts2),
     .DMaddr(data),
     .DMwr(DMwr),
     .clk(clk),
     .rst(rst),
     .DMout(DMout),
     .DM1(DM)
     );
     /*
     input wire [31:0]im,//ֱ�ӽ���ָ�� ��չ32λ
    input wire [2:0] EXTop,
     */
     U_EXT u_ext(
     .clk(clk),
    .im(IM),//ֱ�ӽ���ָ�� ��չ32λ
    .EXTop(EXTop),
    .imm32(imm32)
     );
     
     /*
     input wire [4:0] rd,
input wire [4:0] rs1,
input wire [4:0] rs2,
input wire [31:0] RFin,
input wire  clk,
input wire  rfw,
input wire  rst,
     */
     U_RF u_rf(
     .rd(rd),
     .rs1(rs1),
     .rs2(rs2),
     .RFin(RegD),
     .clk(clk),
     .rfw(RFw),
     .rst(rst),
     .RFouts1(RFouts1),
     .RFouts2(RFouts2),
     .RF1(RF)
     );
     /*
      input  [1023:0] RF,
   input [1023:0] DM,
   input [4:0]choose,
   input level,//ѡ���16 1 ���ǵ�16 0
   input change,//RF 1 DM 0
   input rst,//0
   input clk,
   output reg [15:0] data
     */
     show u_show(
     .clk(clk),
     .rst(rst),
     .RF(RF),
     .DM(DM),
     .choose(choose),
     .level(level),
     .change(change),
     .data(data1)
     );
     /*
     input wire [15:0]data,//�����bcd��
    input  clk,//ʱ���ź� ���hz
    output reg [3:0]an,//ʹ�ܶ�
    output reg [6:0]seg//�����
     */
     decode u_decode(
     .data(data1),
     .clk(clk),
     .an(an),
     .seg(seg)
     );
     
endmodule
