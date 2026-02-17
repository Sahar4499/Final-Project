module mult16x16
  (input  [15:0] a,
   input  [15:0] b,
   output [31:0] p);
  wire [31:0] n174_o;
  wire n177_o;
  wire n178_o;
  wire n179_o;
  wire n180_o;
  wire n181_o;
  wire n182_o;
  wire n183_o;
  wire n184_o;
  wire n185_o;
  wire n186_o;
  wire n187_o;
  wire n188_o;
  wire n189_o;
  wire n190_o;
  wire n191_o;
  wire n192_o;
  wire [16:0] n193_o;
  wire n194_o;
  wire [16:0] n195_o;
  wire n196_o;
  wire [1:0] n197_o;
  wire [16:0] n198_o;
  wire n199_o;
  wire [2:0] n200_o;
  wire n202_o;
  wire n204_o;
  wire n205_o;
  wire n207_o;
  wire n209_o;
  wire n210_o;
  wire n212_o;
  wire n214_o;
  wire n216_o;
  wire n218_o;
  wire n219_o;
  wire [4:0] n220_o;
  reg [31:0] n227_o;
  wire n229_o;
  wire n231_o;
  wire [31:0] n233_o;
  wire n235_o;
  wire [31:0] n236_o;
  wire n238_o;
  wire [31:0] n240_o;
  wire [31:0] n241_o;
  wire n243_o;
  wire [4:0] n244_o;
  reg [31:0] n247_o;
  wire [31:0] n249_o;
  wire [16:0] n250_o;
  wire n251_o;
  wire [16:0] n252_o;
  wire n253_o;
  wire [1:0] n254_o;
  wire [16:0] n255_o;
  wire n256_o;
  wire [2:0] n257_o;
  wire n259_o;
  wire n261_o;
  wire n262_o;
  wire n264_o;
  wire n266_o;
  wire n267_o;
  wire n269_o;
  wire n271_o;
  wire n273_o;
  wire n275_o;
  wire n276_o;
  wire [4:0] n277_o;
  reg [31:0] n284_o;
  wire n286_o;
  wire n288_o;
  wire [31:0] n290_o;
  wire n292_o;
  wire [31:0] n293_o;
  wire n295_o;
  wire [31:0] n297_o;
  wire [31:0] n298_o;
  wire n300_o;
  wire [4:0] n301_o;
  reg [31:0] n304_o;
  wire [31:0] n306_o;
  wire [16:0] n307_o;
  wire n308_o;
  wire [16:0] n309_o;
  wire n310_o;
  wire [1:0] n311_o;
  wire [16:0] n312_o;
  wire n313_o;
  wire [2:0] n314_o;
  wire n316_o;
  wire n318_o;
  wire n319_o;
  wire n321_o;
  wire n323_o;
  wire n324_o;
  wire n326_o;
  wire n328_o;
  wire n330_o;
  wire n332_o;
  wire n333_o;
  wire [4:0] n334_o;
  reg [31:0] n341_o;
  wire n343_o;
  wire n345_o;
  wire [31:0] n347_o;
  wire n349_o;
  wire [31:0] n350_o;
  wire n352_o;
  wire [31:0] n354_o;
  wire [31:0] n355_o;
  wire n357_o;
  wire [4:0] n358_o;
  reg [31:0] n361_o;
  wire [31:0] n363_o;
  wire [16:0] n364_o;
  wire n365_o;
  wire [16:0] n366_o;
  wire n367_o;
  wire [1:0] n368_o;
  wire [16:0] n369_o;
  wire n370_o;
  wire [2:0] n371_o;
  wire n373_o;
  wire n375_o;
  wire n376_o;
  wire n378_o;
  wire n380_o;
  wire n381_o;
  wire n383_o;
  wire n385_o;
  wire n387_o;
  wire n389_o;
  wire n390_o;
  wire [4:0] n391_o;
  reg [31:0] n398_o;
  wire n400_o;
  wire n402_o;
  wire [31:0] n404_o;
  wire n406_o;
  wire [31:0] n407_o;
  wire n409_o;
  wire [31:0] n411_o;
  wire [31:0] n412_o;
  wire n414_o;
  wire [4:0] n415_o;
  reg [31:0] n418_o;
  wire [31:0] n420_o;
  wire [16:0] n421_o;
  wire n422_o;
  wire [16:0] n423_o;
  wire n424_o;
  wire [1:0] n425_o;
  wire [16:0] n426_o;
  wire n427_o;
  wire [2:0] n428_o;
  wire n430_o;
  wire n432_o;
  wire n433_o;
  wire n435_o;
  wire n437_o;
  wire n438_o;
  wire n440_o;
  wire n442_o;
  wire n444_o;
  wire n446_o;
  wire n447_o;
  wire [4:0] n448_o;
  reg [31:0] n455_o;
  wire n457_o;
  wire n459_o;
  wire [31:0] n461_o;
  wire n463_o;
  wire [31:0] n464_o;
  wire n466_o;
  wire [31:0] n468_o;
  wire [31:0] n469_o;
  wire n471_o;
  wire [4:0] n472_o;
  reg [31:0] n475_o;
  wire [31:0] n477_o;
  wire [16:0] n478_o;
  wire n479_o;
  wire [16:0] n480_o;
  wire n481_o;
  wire [1:0] n482_o;
  wire [16:0] n483_o;
  wire n484_o;
  wire [2:0] n485_o;
  wire n487_o;
  wire n489_o;
  wire n490_o;
  wire n492_o;
  wire n494_o;
  wire n495_o;
  wire n497_o;
  wire n499_o;
  wire n501_o;
  wire n503_o;
  wire n504_o;
  wire [4:0] n505_o;
  reg [31:0] n512_o;
  wire n514_o;
  wire n516_o;
  wire [31:0] n518_o;
  wire n520_o;
  wire [31:0] n521_o;
  wire n523_o;
  wire [31:0] n525_o;
  wire [31:0] n526_o;
  wire n528_o;
  wire [4:0] n529_o;
  reg [31:0] n532_o;
  wire [31:0] n534_o;
  wire [16:0] n535_o;
  wire n536_o;
  wire [16:0] n537_o;
  wire n538_o;
  wire [1:0] n539_o;
  wire [16:0] n540_o;
  wire n541_o;
  wire [2:0] n542_o;
  wire n544_o;
  wire n546_o;
  wire n547_o;
  wire n549_o;
  wire n551_o;
  wire n552_o;
  wire n554_o;
  wire n556_o;
  wire n558_o;
  wire n560_o;
  wire n561_o;
  wire [4:0] n562_o;
  reg [31:0] n569_o;
  wire n571_o;
  wire n573_o;
  wire [31:0] n575_o;
  wire n577_o;
  wire [31:0] n578_o;
  wire n580_o;
  wire [31:0] n582_o;
  wire [31:0] n583_o;
  wire n585_o;
  wire [4:0] n586_o;
  reg [31:0] n589_o;
  wire [31:0] n591_o;
  wire [16:0] n592_o;
  wire n593_o;
  wire [16:0] n594_o;
  wire n595_o;
  wire [1:0] n596_o;
  wire [16:0] n597_o;
  wire n598_o;
  wire [2:0] n599_o;
  wire n601_o;
  wire n603_o;
  wire n604_o;
  wire n606_o;
  wire n608_o;
  wire n609_o;
  wire n611_o;
  wire n613_o;
  wire n615_o;
  wire n617_o;
  wire n618_o;
  wire [4:0] n619_o;
  reg [31:0] n626_o;
  wire n628_o;
  wire n630_o;
  wire [31:0] n632_o;
  wire n634_o;
  wire [31:0] n635_o;
  wire n637_o;
  wire [31:0] n639_o;
  wire [31:0] n640_o;
  wire n642_o;
  wire [4:0] n643_o;
  reg [31:0] n646_o;
  wire [31:0] n648_o;
  wire [255:0] n649_o;
  wire [31:0] n650_o;
  wire [255:0] n651_o;
  wire [31:0] n652_o;
  wire [255:0] n653_o;
  wire [31:0] n654_o;
  wire [31:0] n655_o;
  wire [31:0] n656_o;
  wire [31:0] n657_o;
  wire [31:0] n658_o;
  wire [31:0] n659_o;
  wire [31:0] n660_o;
  wire [31:0] n661_o;
  wire [31:0] n663_o;
  wire [255:0] n664_o;
  wire [31:0] n665_o;
  wire [255:0] n666_o;
  wire [31:0] n667_o;
  wire [255:0] n668_o;
  wire [31:0] n669_o;
  wire [31:0] n670_o;
  wire [31:0] n671_o;
  wire [31:0] n672_o;
  wire [31:0] n673_o;
  wire [31:0] n674_o;
  wire [31:0] n675_o;
  wire [31:0] n676_o;
  wire [31:0] n678_o;
  wire [255:0] n679_o;
  wire [31:0] n680_o;
  wire [31:0] n681_o;
  wire [31:0] n682_o;
  wire [31:0] n683_o;
  wire [31:0] n684_o;
  wire [31:0] n685_o;
  wire [31:0] n686_o;
  wire [31:0] n687_o;
  wire [31:0] n689_o;
  wire [255:0] n690_o;
  wire [31:0] n691_o;
  wire [31:0] n692_o;
  wire [31:0] n693_o;
  wire [31:0] n694_o;
  wire [31:0] n695_o;
  wire [31:0] n696_o;
  wire [31:0] n697_o;
  wire [31:0] n698_o;
  wire [31:0] n700_o;
  wire [31:0] n701_o;
  wire [31:0] n702_o;
  wire [31:0] n703_o;
  wire [31:0] n704_o;
  wire [31:0] n705_o;
  wire [31:0] n706_o;
  wire [31:0] n707_o;
  wire [31:0] n709_o;
  wire [31:0] n710_o;
  wire [31:0] n711_o;
  assign p = n711_o;
  /* mult16x16.vhd:44:12  */
  assign n174_o = {16'b0, a};  //  uext
  /* mult16x16.vhd:54:22  */
  assign n177_o = b[0];
  /* mult16x16.vhd:54:22  */
  assign n178_o = b[1];
  /* mult16x16.vhd:54:22  */
  assign n179_o = b[2];
  /* mult16x16.vhd:54:22  */
  assign n180_o = b[3];
  /* mult16x16.vhd:54:22  */
  assign n181_o = b[4];
  /* mult16x16.vhd:54:22  */
  assign n182_o = b[5];
  /* mult16x16.vhd:54:22  */
  assign n183_o = b[6];
  /* mult16x16.vhd:54:22  */
  assign n184_o = b[7];
  /* mult16x16.vhd:54:22  */
  assign n185_o = b[8];
  /* mult16x16.vhd:54:22  */
  assign n186_o = b[9];
  /* mult16x16.vhd:54:22  */
  assign n187_o = b[10];
  /* mult16x16.vhd:54:22  */
  assign n188_o = b[11];
  /* mult16x16.vhd:54:22  */
  assign n189_o = b[12];
  /* mult16x16.vhd:54:22  */
  assign n190_o = b[13];
  /* mult16x16.vhd:54:22  */
  assign n191_o = b[14];
  /* mult16x16.vhd:54:22  */
  assign n192_o = b[15];
  assign n193_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n194_o = n193_o[2];
  assign n195_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n196_o = n195_o[1];
  /* mult16x16.vhd:61:28  */
  assign n197_o = {n194_o, n196_o};
  assign n198_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n199_o = n198_o[0];
  /* mult16x16.vhd:61:43  */
  assign n200_o = {n197_o, n199_o};
  /* mult16x16.vhd:65:9  */
  assign n202_o = n200_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n204_o = n200_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n205_o = n202_o | n204_o;
  /* mult16x16.vhd:66:9  */
  assign n207_o = n200_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n209_o = n200_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n210_o = n207_o | n209_o;
  /* mult16x16.vhd:67:9  */
  assign n212_o = n200_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n214_o = n200_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n216_o = n200_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n218_o = n200_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n219_o = n216_o | n218_o;
  assign n220_o = {n219_o, n214_o, n212_o, n210_o, n205_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n220_o)
      5'b10000: n227_o = 32'b11111111111111111111111111111111;
      5'b01000: n227_o = 32'b11111111111111111111111111111110;
      5'b00100: n227_o = 32'b00000000000000000000000000000010;
      5'b00010: n227_o = 32'b00000000000000000000000000000001;
      5'b00001: n227_o = 32'b00000000000000000000000000000000;
      default: n227_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n229_o = n227_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n231_o = n227_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n233_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n235_o = n227_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n236_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n238_o = n227_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n240_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n241_o = -n240_o;
  /* mult16x16.vhd:79:9  */
  assign n243_o = n227_o == 32'b11111111111111111111111111111110;
  assign n244_o = {n243_o, n238_o, n235_o, n231_o, n229_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n244_o)
      5'b10000: n247_o = n241_o;
      5'b01000: n247_o = n236_o;
      5'b00100: n247_o = n233_o;
      5'b00010: n247_o = n174_o;
      5'b00001: n247_o = 32'b00000000000000000000000000000000;
      default: n247_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n249_o = n247_o << 31'b0000000000000000000000000000000;
  assign n250_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n251_o = n250_o[4];
  assign n252_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n253_o = n252_o[3];
  /* mult16x16.vhd:61:28  */
  assign n254_o = {n251_o, n253_o};
  assign n255_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n256_o = n255_o[2];
  /* mult16x16.vhd:61:43  */
  assign n257_o = {n254_o, n256_o};
  /* mult16x16.vhd:65:9  */
  assign n259_o = n257_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n261_o = n257_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n262_o = n259_o | n261_o;
  /* mult16x16.vhd:66:9  */
  assign n264_o = n257_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n266_o = n257_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n267_o = n264_o | n266_o;
  /* mult16x16.vhd:67:9  */
  assign n269_o = n257_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n271_o = n257_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n273_o = n257_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n275_o = n257_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n276_o = n273_o | n275_o;
  assign n277_o = {n276_o, n271_o, n269_o, n267_o, n262_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n277_o)
      5'b10000: n284_o = 32'b11111111111111111111111111111111;
      5'b01000: n284_o = 32'b11111111111111111111111111111110;
      5'b00100: n284_o = 32'b00000000000000000000000000000010;
      5'b00010: n284_o = 32'b00000000000000000000000000000001;
      5'b00001: n284_o = 32'b00000000000000000000000000000000;
      default: n284_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n286_o = n284_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n288_o = n284_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n290_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n292_o = n284_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n293_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n295_o = n284_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n297_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n298_o = -n297_o;
  /* mult16x16.vhd:79:9  */
  assign n300_o = n284_o == 32'b11111111111111111111111111111110;
  assign n301_o = {n300_o, n295_o, n292_o, n288_o, n286_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n301_o)
      5'b10000: n304_o = n298_o;
      5'b01000: n304_o = n293_o;
      5'b00100: n304_o = n290_o;
      5'b00010: n304_o = n174_o;
      5'b00001: n304_o = 32'b00000000000000000000000000000000;
      default: n304_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n306_o = n304_o << 31'b0000000000000000000000000000010;
  assign n307_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n308_o = n307_o[6];
  assign n309_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n310_o = n309_o[5];
  /* mult16x16.vhd:61:28  */
  assign n311_o = {n308_o, n310_o};
  assign n312_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n313_o = n312_o[4];
  /* mult16x16.vhd:61:43  */
  assign n314_o = {n311_o, n313_o};
  /* mult16x16.vhd:65:9  */
  assign n316_o = n314_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n318_o = n314_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n319_o = n316_o | n318_o;
  /* mult16x16.vhd:66:9  */
  assign n321_o = n314_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n323_o = n314_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n324_o = n321_o | n323_o;
  /* mult16x16.vhd:67:9  */
  assign n326_o = n314_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n328_o = n314_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n330_o = n314_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n332_o = n314_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n333_o = n330_o | n332_o;
  assign n334_o = {n333_o, n328_o, n326_o, n324_o, n319_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n334_o)
      5'b10000: n341_o = 32'b11111111111111111111111111111111;
      5'b01000: n341_o = 32'b11111111111111111111111111111110;
      5'b00100: n341_o = 32'b00000000000000000000000000000010;
      5'b00010: n341_o = 32'b00000000000000000000000000000001;
      5'b00001: n341_o = 32'b00000000000000000000000000000000;
      default: n341_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n343_o = n341_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n345_o = n341_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n347_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n349_o = n341_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n350_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n352_o = n341_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n354_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n355_o = -n354_o;
  /* mult16x16.vhd:79:9  */
  assign n357_o = n341_o == 32'b11111111111111111111111111111110;
  assign n358_o = {n357_o, n352_o, n349_o, n345_o, n343_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n358_o)
      5'b10000: n361_o = n355_o;
      5'b01000: n361_o = n350_o;
      5'b00100: n361_o = n347_o;
      5'b00010: n361_o = n174_o;
      5'b00001: n361_o = 32'b00000000000000000000000000000000;
      default: n361_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n363_o = n361_o << 31'b0000000000000000000000000000100;
  assign n364_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n365_o = n364_o[8];
  assign n366_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n367_o = n366_o[7];
  /* mult16x16.vhd:61:28  */
  assign n368_o = {n365_o, n367_o};
  assign n369_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n370_o = n369_o[6];
  /* mult16x16.vhd:61:43  */
  assign n371_o = {n368_o, n370_o};
  /* mult16x16.vhd:65:9  */
  assign n373_o = n371_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n375_o = n371_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n376_o = n373_o | n375_o;
  /* mult16x16.vhd:66:9  */
  assign n378_o = n371_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n380_o = n371_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n381_o = n378_o | n380_o;
  /* mult16x16.vhd:67:9  */
  assign n383_o = n371_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n385_o = n371_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n387_o = n371_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n389_o = n371_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n390_o = n387_o | n389_o;
  assign n391_o = {n390_o, n385_o, n383_o, n381_o, n376_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n391_o)
      5'b10000: n398_o = 32'b11111111111111111111111111111111;
      5'b01000: n398_o = 32'b11111111111111111111111111111110;
      5'b00100: n398_o = 32'b00000000000000000000000000000010;
      5'b00010: n398_o = 32'b00000000000000000000000000000001;
      5'b00001: n398_o = 32'b00000000000000000000000000000000;
      default: n398_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n400_o = n398_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n402_o = n398_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n404_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n406_o = n398_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n407_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n409_o = n398_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n411_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n412_o = -n411_o;
  /* mult16x16.vhd:79:9  */
  assign n414_o = n398_o == 32'b11111111111111111111111111111110;
  assign n415_o = {n414_o, n409_o, n406_o, n402_o, n400_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n415_o)
      5'b10000: n418_o = n412_o;
      5'b01000: n418_o = n407_o;
      5'b00100: n418_o = n404_o;
      5'b00010: n418_o = n174_o;
      5'b00001: n418_o = 32'b00000000000000000000000000000000;
      default: n418_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n420_o = n418_o << 31'b0000000000000000000000000000110;
  assign n421_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n422_o = n421_o[10];
  assign n423_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n424_o = n423_o[9];
  /* mult16x16.vhd:61:28  */
  assign n425_o = {n422_o, n424_o};
  assign n426_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n427_o = n426_o[8];
  /* mult16x16.vhd:61:43  */
  assign n428_o = {n425_o, n427_o};
  /* mult16x16.vhd:65:9  */
  assign n430_o = n428_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n432_o = n428_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n433_o = n430_o | n432_o;
  /* mult16x16.vhd:66:9  */
  assign n435_o = n428_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n437_o = n428_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n438_o = n435_o | n437_o;
  /* mult16x16.vhd:67:9  */
  assign n440_o = n428_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n442_o = n428_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n444_o = n428_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n446_o = n428_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n447_o = n444_o | n446_o;
  assign n448_o = {n447_o, n442_o, n440_o, n438_o, n433_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n448_o)
      5'b10000: n455_o = 32'b11111111111111111111111111111111;
      5'b01000: n455_o = 32'b11111111111111111111111111111110;
      5'b00100: n455_o = 32'b00000000000000000000000000000010;
      5'b00010: n455_o = 32'b00000000000000000000000000000001;
      5'b00001: n455_o = 32'b00000000000000000000000000000000;
      default: n455_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n457_o = n455_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n459_o = n455_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n461_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n463_o = n455_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n464_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n466_o = n455_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n468_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n469_o = -n468_o;
  /* mult16x16.vhd:79:9  */
  assign n471_o = n455_o == 32'b11111111111111111111111111111110;
  assign n472_o = {n471_o, n466_o, n463_o, n459_o, n457_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n472_o)
      5'b10000: n475_o = n469_o;
      5'b01000: n475_o = n464_o;
      5'b00100: n475_o = n461_o;
      5'b00010: n475_o = n174_o;
      5'b00001: n475_o = 32'b00000000000000000000000000000000;
      default: n475_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n477_o = n475_o << 31'b0000000000000000000000000001000;
  assign n478_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n479_o = n478_o[12];
  assign n480_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n481_o = n480_o[11];
  /* mult16x16.vhd:61:28  */
  assign n482_o = {n479_o, n481_o};
  assign n483_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n484_o = n483_o[10];
  /* mult16x16.vhd:61:43  */
  assign n485_o = {n482_o, n484_o};
  /* mult16x16.vhd:65:9  */
  assign n487_o = n485_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n489_o = n485_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n490_o = n487_o | n489_o;
  /* mult16x16.vhd:66:9  */
  assign n492_o = n485_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n494_o = n485_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n495_o = n492_o | n494_o;
  /* mult16x16.vhd:67:9  */
  assign n497_o = n485_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n499_o = n485_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n501_o = n485_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n503_o = n485_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n504_o = n501_o | n503_o;
  assign n505_o = {n504_o, n499_o, n497_o, n495_o, n490_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n505_o)
      5'b10000: n512_o = 32'b11111111111111111111111111111111;
      5'b01000: n512_o = 32'b11111111111111111111111111111110;
      5'b00100: n512_o = 32'b00000000000000000000000000000010;
      5'b00010: n512_o = 32'b00000000000000000000000000000001;
      5'b00001: n512_o = 32'b00000000000000000000000000000000;
      default: n512_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n514_o = n512_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n516_o = n512_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n518_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n520_o = n512_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n521_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n523_o = n512_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n525_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n526_o = -n525_o;
  /* mult16x16.vhd:79:9  */
  assign n528_o = n512_o == 32'b11111111111111111111111111111110;
  assign n529_o = {n528_o, n523_o, n520_o, n516_o, n514_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n529_o)
      5'b10000: n532_o = n526_o;
      5'b01000: n532_o = n521_o;
      5'b00100: n532_o = n518_o;
      5'b00010: n532_o = n174_o;
      5'b00001: n532_o = 32'b00000000000000000000000000000000;
      default: n532_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n534_o = n532_o << 31'b0000000000000000000000000001010;
  assign n535_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n536_o = n535_o[14];
  assign n537_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n538_o = n537_o[13];
  /* mult16x16.vhd:61:28  */
  assign n539_o = {n536_o, n538_o};
  assign n540_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n541_o = n540_o[12];
  /* mult16x16.vhd:61:43  */
  assign n542_o = {n539_o, n541_o};
  /* mult16x16.vhd:65:9  */
  assign n544_o = n542_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n546_o = n542_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n547_o = n544_o | n546_o;
  /* mult16x16.vhd:66:9  */
  assign n549_o = n542_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n551_o = n542_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n552_o = n549_o | n551_o;
  /* mult16x16.vhd:67:9  */
  assign n554_o = n542_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n556_o = n542_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n558_o = n542_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n560_o = n542_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n561_o = n558_o | n560_o;
  assign n562_o = {n561_o, n556_o, n554_o, n552_o, n547_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n562_o)
      5'b10000: n569_o = 32'b11111111111111111111111111111111;
      5'b01000: n569_o = 32'b11111111111111111111111111111110;
      5'b00100: n569_o = 32'b00000000000000000000000000000010;
      5'b00010: n569_o = 32'b00000000000000000000000000000001;
      5'b00001: n569_o = 32'b00000000000000000000000000000000;
      default: n569_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n571_o = n569_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n573_o = n569_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n575_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n577_o = n569_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n578_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n580_o = n569_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n582_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n583_o = -n582_o;
  /* mult16x16.vhd:79:9  */
  assign n585_o = n569_o == 32'b11111111111111111111111111111110;
  assign n586_o = {n585_o, n580_o, n577_o, n573_o, n571_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n586_o)
      5'b10000: n589_o = n583_o;
      5'b01000: n589_o = n578_o;
      5'b00100: n589_o = n575_o;
      5'b00010: n589_o = n174_o;
      5'b00001: n589_o = 32'b00000000000000000000000000000000;
      default: n589_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n591_o = n589_o << 31'b0000000000000000000000000001100;
  assign n592_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:20  */
  assign n593_o = n592_o[16];
  assign n594_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:35  */
  assign n595_o = n594_o[15];
  /* mult16x16.vhd:61:28  */
  assign n596_o = {n593_o, n595_o};
  assign n597_o = {n192_o, n191_o, n190_o, n189_o, n188_o, n187_o, n186_o, n185_o, n184_o, n183_o, n182_o, n181_o, n180_o, n179_o, n178_o, n177_o, 1'b0};
  /* mult16x16.vhd:61:50  */
  assign n598_o = n597_o[14];
  /* mult16x16.vhd:61:43  */
  assign n599_o = {n596_o, n598_o};
  /* mult16x16.vhd:65:9  */
  assign n601_o = n599_o == 3'b000;
  /* mult16x16.vhd:65:20  */
  assign n603_o = n599_o == 3'b111;
  /* mult16x16.vhd:65:20  */
  assign n604_o = n601_o | n603_o;
  /* mult16x16.vhd:66:9  */
  assign n606_o = n599_o == 3'b001;
  /* mult16x16.vhd:66:20  */
  assign n608_o = n599_o == 3'b010;
  /* mult16x16.vhd:66:20  */
  assign n609_o = n606_o | n608_o;
  /* mult16x16.vhd:67:9  */
  assign n611_o = n599_o == 3'b011;
  /* mult16x16.vhd:68:9  */
  assign n613_o = n599_o == 3'b100;
  /* mult16x16.vhd:69:9  */
  assign n615_o = n599_o == 3'b101;
  /* mult16x16.vhd:69:20  */
  assign n617_o = n599_o == 3'b110;
  /* mult16x16.vhd:69:20  */
  assign n618_o = n615_o | n617_o;
  assign n619_o = {n618_o, n613_o, n611_o, n609_o, n604_o};
  /* mult16x16.vhd:64:7  */
  always @*
    case (n619_o)
      5'b10000: n626_o = 32'b11111111111111111111111111111111;
      5'b01000: n626_o = 32'b11111111111111111111111111111110;
      5'b00100: n626_o = 32'b00000000000000000000000000000010;
      5'b00010: n626_o = 32'b00000000000000000000000000000001;
      5'b00001: n626_o = 32'b00000000000000000000000000000000;
      default: n626_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:75:9  */
  assign n628_o = n626_o == 32'b00000000000000000000000000000000;
  /* mult16x16.vhd:76:9  */
  assign n630_o = n626_o == 32'b00000000000000000000000000000001;
  /* mult16x16.vhd:77:25  */
  assign n632_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:77:9  */
  assign n634_o = n626_o == 32'b00000000000000000000000000000010;
  /* mult16x16.vhd:78:25  */
  assign n635_o = -n174_o;
  /* mult16x16.vhd:78:9  */
  assign n637_o = n626_o == 32'b11111111111111111111111111111111;
  /* mult16x16.vhd:79:26  */
  assign n639_o = n174_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:79:25  */
  assign n640_o = -n639_o;
  /* mult16x16.vhd:79:9  */
  assign n642_o = n626_o == 32'b11111111111111111111111111111110;
  assign n643_o = {n642_o, n637_o, n634_o, n630_o, n628_o};
  /* mult16x16.vhd:74:7  */
  always @*
    case (n643_o)
      5'b10000: n646_o = n640_o;
      5'b01000: n646_o = n635_o;
      5'b00100: n646_o = n632_o;
      5'b00010: n646_o = n174_o;
      5'b00001: n646_o = 32'b00000000000000000000000000000000;
      default: n646_o = 32'b00000000000000000000000000000000;
    endcase
  /* mult16x16.vhd:84:12  */
  assign n648_o = n646_o << 31'b0000000000000000000000000001110;
  assign n649_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:95:12  */
  assign n650_o = n649_o[255:224];
  assign n651_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:95:24  */
  assign n652_o = n651_o[223:192];
  assign n653_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:95:36  */
  assign n654_o = n653_o[191:160];
  /* mult16x16.vhd:96:13  */
  assign n655_o = n650_o ^ n652_o;
  /* mult16x16.vhd:96:19  */
  assign n656_o = n655_o ^ n654_o;
  /* mult16x16.vhd:97:26  */
  assign n657_o = n650_o & n652_o;
  /* mult16x16.vhd:97:39  */
  assign n658_o = n650_o & n654_o;
  /* mult16x16.vhd:97:33  */
  assign n659_o = n657_o | n658_o;
  /* mult16x16.vhd:97:52  */
  assign n660_o = n652_o & n654_o;
  /* mult16x16.vhd:97:46  */
  assign n661_o = n659_o | n660_o;
  /* mult16x16.vhd:97:11  */
  assign n663_o = n661_o << 31'b0000000000000000000000000000001;
  assign n664_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:100:12  */
  assign n665_o = n664_o[159:128];
  assign n666_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:100:24  */
  assign n667_o = n666_o[127:96];
  assign n668_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:100:36  */
  assign n669_o = n668_o[95:64];
  /* mult16x16.vhd:101:13  */
  assign n670_o = n665_o ^ n667_o;
  /* mult16x16.vhd:101:19  */
  assign n671_o = n670_o ^ n669_o;
  /* mult16x16.vhd:102:26  */
  assign n672_o = n665_o & n667_o;
  /* mult16x16.vhd:102:39  */
  assign n673_o = n665_o & n669_o;
  /* mult16x16.vhd:102:33  */
  assign n674_o = n672_o | n673_o;
  /* mult16x16.vhd:102:52  */
  assign n675_o = n667_o & n669_o;
  /* mult16x16.vhd:102:46  */
  assign n676_o = n674_o | n675_o;
  /* mult16x16.vhd:102:11  */
  assign n678_o = n676_o << 31'b0000000000000000000000000000001;
  assign n679_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:105:30  */
  assign n680_o = n679_o[63:32];
  /* mult16x16.vhd:106:13  */
  assign n681_o = n656_o ^ n663_o;
  /* mult16x16.vhd:106:19  */
  assign n682_o = n681_o ^ n680_o;
  /* mult16x16.vhd:107:26  */
  assign n683_o = n656_o & n663_o;
  /* mult16x16.vhd:107:39  */
  assign n684_o = n656_o & n680_o;
  /* mult16x16.vhd:107:33  */
  assign n685_o = n683_o | n684_o;
  /* mult16x16.vhd:107:52  */
  assign n686_o = n663_o & n680_o;
  /* mult16x16.vhd:107:46  */
  assign n687_o = n685_o | n686_o;
  /* mult16x16.vhd:107:11  */
  assign n689_o = n687_o << 31'b0000000000000000000000000000001;
  assign n690_o = {n249_o, n306_o, n363_o, n420_o, n477_o, n534_o, n591_o, n648_o};
  /* mult16x16.vhd:110:30  */
  assign n691_o = n690_o[31:0];
  /* mult16x16.vhd:111:13  */
  assign n692_o = n671_o ^ n678_o;
  /* mult16x16.vhd:111:19  */
  assign n693_o = n692_o ^ n691_o;
  /* mult16x16.vhd:112:26  */
  assign n694_o = n671_o & n678_o;
  /* mult16x16.vhd:112:39  */
  assign n695_o = n671_o & n691_o;
  /* mult16x16.vhd:112:33  */
  assign n696_o = n694_o | n695_o;
  /* mult16x16.vhd:112:52  */
  assign n697_o = n678_o & n691_o;
  /* mult16x16.vhd:112:46  */
  assign n698_o = n696_o | n697_o;
  /* mult16x16.vhd:112:11  */
  assign n700_o = n698_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:116:16  */
  assign n701_o = n682_o ^ n689_o;
  /* mult16x16.vhd:116:22  */
  assign n702_o = n701_o ^ n693_o;
  /* mult16x16.vhd:117:29  */
  assign n703_o = n682_o & n689_o;
  /* mult16x16.vhd:117:42  */
  assign n704_o = n682_o & n693_o;
  /* mult16x16.vhd:117:36  */
  assign n705_o = n703_o | n704_o;
  /* mult16x16.vhd:117:55  */
  assign n706_o = n689_o & n693_o;
  /* mult16x16.vhd:117:49  */
  assign n707_o = n705_o | n706_o;
  /* mult16x16.vhd:117:14  */
  assign n709_o = n707_o << 31'b0000000000000000000000000000001;
  /* mult16x16.vhd:122:19  */
  assign n710_o = n702_o + n709_o;
  /* mult16x16.vhd:122:27  */
  assign n711_o = n710_o + n700_o;
endmodule

module hpe
  (input  rst,
   input  clk,
   input  en,
   input  [15:0] a,
   input  [15:0] b,
   output [31:0] c,
   output [15:0] a_out,
   output [15:0] b_out);
  reg [15:0] a_reg;
  reg [15:0] b_reg;
  wire [31:0] mult_comb;
  reg [31:0] mult_reg;
  reg [31:0] acc;
  wire [31:0] u_mult_p;
  wire [31:0] n126_o;
  wire [15:0] n127_o;
  wire [15:0] n128_o;
  wire [31:0] n129_o;
  wire [31:0] n130_o;
  wire [15:0] n132_o;
  wire [15:0] n134_o;
  wire [31:0] n136_o;
  wire [31:0] n138_o;
  reg [15:0] n144_q;
  reg [15:0] n145_q;
  reg [31:0] n146_q;
  reg [31:0] n147_q;
  assign c = acc;
  assign a_out = a_reg;
  assign b_out = b_reg;
  /* hPE.vhd:23:12  */
  always @*
    a_reg = n144_q; // (isignal)
  initial
    a_reg = 16'b0000000000000000;
  /* hPE.vhd:24:12  */
  always @*
    b_reg = n145_q; // (isignal)
  initial
    b_reg = 16'b0000000000000000;
  /* hPE.vhd:27:12  */
  assign mult_comb = u_mult_p; // (signal)
  /* hPE.vhd:28:12  */
  always @*
    mult_reg = n146_q; // (isignal)
  initial
    mult_reg = 32'b00000000000000000000000000000000;
  /* hPE.vhd:31:12  */
  always @*
    acc = n147_q; // (isignal)
  initial
    acc = 32'b00000000000000000000000000000000;
  /* hPE.vhd:36:5  */
  mult16x16 u_mult (
    .a(a_reg),
    .b(b_reg),
    .p(u_mult_p));
  /* hPE.vhd:60:55  */
  assign n126_o = acc + mult_reg;
  /* hPE.vhd:51:13  */
  assign n127_o = en ? a : a_reg;
  /* hPE.vhd:51:13  */
  assign n128_o = en ? b : b_reg;
  /* hPE.vhd:51:13  */
  assign n129_o = en ? mult_comb : mult_reg;
  /* hPE.vhd:51:13  */
  assign n130_o = en ? n126_o : acc;
  /* hPE.vhd:46:13  */
  assign n132_o = rst ? 16'b0000000000000000 : n127_o;
  /* hPE.vhd:46:13  */
  assign n134_o = rst ? 16'b0000000000000000 : n128_o;
  /* hPE.vhd:46:13  */
  assign n136_o = rst ? 32'b00000000000000000000000000000000 : n129_o;
  /* hPE.vhd:46:13  */
  assign n138_o = rst ? 32'b00000000000000000000000000000000 : n130_o;
  /* hPE.vhd:45:9  */
  always @(posedge clk)
    n144_q <= n132_o;
  initial
    n144_q = 16'b0000000000000000;
  /* hPE.vhd:45:9  */
  always @(posedge clk)
    n145_q <= n134_o;
  initial
    n145_q = 16'b0000000000000000;
  /* hPE.vhd:45:9  */
  always @(posedge clk)
    n146_q <= n136_o;
  initial
    n146_q = 32'b00000000000000000000000000000000;
  /* hPE.vhd:45:9  */
  always @(posedge clk)
    n147_q <= n138_o;
  initial
    n147_q = 32'b00000000000000000000000000000000;
endmodule

module systolic_4x4
  (input  CLK,
   input  RST,
   input  EN,
   input  [15:0] A0_in,
   input  [15:0] A1_in,
   input  [15:0] A2_in,
   input  [15:0] A3_in,
   input  [15:0] B0_in,
   input  [15:0] B1_in,
   input  [15:0] B2_in,
   input  [15:0] B3_in,
   output [31:0] C00,
   output [31:0] C01,
   output [31:0] C02,
   output [31:0] C03,
   output [31:0] C10,
   output [31:0] C11,
   output [31:0] C12,
   output [31:0] C13,
   output [31:0] C20,
   output [31:0] C21,
   output [31:0] C22,
   output [31:0] C23,
   output [31:0] C30,
   output [31:0] C31,
   output [31:0] C32,
   output [31:0] C33);
  wire [319:0] a_bus;
  wire [319:0] b_bus;
  wire [511:0] c_mat;
  wire [31:0] gen_i_n1_gen_j_n1_pe_c;
  wire [15:0] gen_i_n1_gen_j_n1_pe_a_out;
  wire [15:0] gen_i_n1_gen_j_n1_pe_b_out;
  wire [15:0] n16_o;
  wire [15:0] n17_o;
  wire [31:0] gen_i_n1_gen_j_n2_pe_c;
  wire [15:0] gen_i_n1_gen_j_n2_pe_a_out;
  wire [15:0] gen_i_n1_gen_j_n2_pe_b_out;
  wire [15:0] n21_o;
  wire [15:0] n22_o;
  wire [31:0] gen_i_n1_gen_j_n3_pe_c;
  wire [15:0] gen_i_n1_gen_j_n3_pe_a_out;
  wire [15:0] gen_i_n1_gen_j_n3_pe_b_out;
  wire [15:0] n26_o;
  wire [15:0] n27_o;
  wire [31:0] gen_i_n1_gen_j_n4_pe_c;
  wire [15:0] gen_i_n1_gen_j_n4_pe_a_out;
  wire [15:0] gen_i_n1_gen_j_n4_pe_b_out;
  wire [15:0] n31_o;
  wire [15:0] n32_o;
  wire [31:0] gen_i_n2_gen_j_n1_pe_c;
  wire [15:0] gen_i_n2_gen_j_n1_pe_a_out;
  wire [15:0] gen_i_n2_gen_j_n1_pe_b_out;
  wire [15:0] n36_o;
  wire [15:0] n37_o;
  wire [31:0] gen_i_n2_gen_j_n2_pe_c;
  wire [15:0] gen_i_n2_gen_j_n2_pe_a_out;
  wire [15:0] gen_i_n2_gen_j_n2_pe_b_out;
  wire [15:0] n41_o;
  wire [15:0] n42_o;
  wire [31:0] gen_i_n2_gen_j_n3_pe_c;
  wire [15:0] gen_i_n2_gen_j_n3_pe_a_out;
  wire [15:0] gen_i_n2_gen_j_n3_pe_b_out;
  wire [15:0] n46_o;
  wire [15:0] n47_o;
  wire [31:0] gen_i_n2_gen_j_n4_pe_c;
  wire [15:0] gen_i_n2_gen_j_n4_pe_a_out;
  wire [15:0] gen_i_n2_gen_j_n4_pe_b_out;
  wire [15:0] n51_o;
  wire [15:0] n52_o;
  wire [31:0] gen_i_n3_gen_j_n1_pe_c;
  wire [15:0] gen_i_n3_gen_j_n1_pe_a_out;
  wire [15:0] gen_i_n3_gen_j_n1_pe_b_out;
  wire [15:0] n56_o;
  wire [15:0] n57_o;
  wire [31:0] gen_i_n3_gen_j_n2_pe_c;
  wire [15:0] gen_i_n3_gen_j_n2_pe_a_out;
  wire [15:0] gen_i_n3_gen_j_n2_pe_b_out;
  wire [15:0] n61_o;
  wire [15:0] n62_o;
  wire [31:0] gen_i_n3_gen_j_n3_pe_c;
  wire [15:0] gen_i_n3_gen_j_n3_pe_a_out;
  wire [15:0] gen_i_n3_gen_j_n3_pe_b_out;
  wire [15:0] n66_o;
  wire [15:0] n67_o;
  wire [31:0] gen_i_n3_gen_j_n4_pe_c;
  wire [15:0] gen_i_n3_gen_j_n4_pe_a_out;
  wire [15:0] gen_i_n3_gen_j_n4_pe_b_out;
  wire [15:0] n71_o;
  wire [15:0] n72_o;
  wire [31:0] gen_i_n4_gen_j_n1_pe_c;
  wire [15:0] gen_i_n4_gen_j_n1_pe_a_out;
  wire [15:0] gen_i_n4_gen_j_n1_pe_b_out;
  wire [15:0] n76_o;
  wire [15:0] n77_o;
  wire [31:0] gen_i_n4_gen_j_n2_pe_c;
  wire [15:0] gen_i_n4_gen_j_n2_pe_a_out;
  wire [15:0] gen_i_n4_gen_j_n2_pe_b_out;
  wire [15:0] n81_o;
  wire [15:0] n82_o;
  wire [31:0] gen_i_n4_gen_j_n3_pe_c;
  wire [15:0] gen_i_n4_gen_j_n3_pe_a_out;
  wire [15:0] gen_i_n4_gen_j_n3_pe_b_out;
  wire [15:0] n86_o;
  wire [15:0] n87_o;
  wire [31:0] gen_i_n4_gen_j_n4_pe_c;
  wire [15:0] gen_i_n4_gen_j_n4_pe_a_out;
  wire [15:0] gen_i_n4_gen_j_n4_pe_b_out;
  wire [15:0] n91_o;
  wire [15:0] n92_o;
  wire [31:0] n96_o;
  wire [31:0] n97_o;
  wire [31:0] n98_o;
  wire [31:0] n99_o;
  wire [31:0] n100_o;
  wire [31:0] n101_o;
  wire [31:0] n102_o;
  wire [31:0] n103_o;
  wire [31:0] n104_o;
  wire [31:0] n105_o;
  wire [31:0] n106_o;
  wire [31:0] n107_o;
  wire [31:0] n108_o;
  wire [31:0] n109_o;
  wire [31:0] n110_o;
  wire [31:0] n111_o;
  wire [319:0] n112_o;
  wire [319:0] n113_o;
  wire [511:0] n114_o;
  assign C00 = n96_o;
  assign C01 = n97_o;
  assign C02 = n98_o;
  assign C03 = n99_o;
  assign C10 = n100_o;
  assign C11 = n101_o;
  assign C12 = n102_o;
  assign C13 = n103_o;
  assign C20 = n104_o;
  assign C21 = n105_o;
  assign C22 = n106_o;
  assign C23 = n107_o;
  assign C30 = n108_o;
  assign C31 = n109_o;
  assign C32 = n110_o;
  assign C33 = n111_o;
  /* systolic_4x4.vhd:48:12  */
  assign a_bus = n112_o; // (signal)
  /* systolic_4x4.vhd:49:12  */
  assign b_bus = n113_o; // (signal)
  /* systolic_4x4.vhd:50:12  */
  assign c_mat = n114_o; // (signal)
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n1_gen_j_n1_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n16_o),
    .b(n17_o),
    .c(gen_i_n1_gen_j_n1_pe_c),
    .a_out(gen_i_n1_gen_j_n1_pe_a_out),
    .b_out(gen_i_n1_gen_j_n1_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n16_o = a_bus[319:304];
  /* systolic_4x4.vhd:72:35  */
  assign n17_o = b_bus[319:304];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n1_gen_j_n2_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n21_o),
    .b(n22_o),
    .c(gen_i_n1_gen_j_n2_pe_c),
    .a_out(gen_i_n1_gen_j_n2_pe_a_out),
    .b_out(gen_i_n1_gen_j_n2_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n21_o = a_bus[303:288];
  /* systolic_4x4.vhd:72:35  */
  assign n22_o = b_bus[303:288];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n1_gen_j_n3_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n26_o),
    .b(n27_o),
    .c(gen_i_n1_gen_j_n3_pe_c),
    .a_out(gen_i_n1_gen_j_n3_pe_a_out),
    .b_out(gen_i_n1_gen_j_n3_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n26_o = a_bus[287:272];
  /* systolic_4x4.vhd:72:35  */
  assign n27_o = b_bus[287:272];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n1_gen_j_n4_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n31_o),
    .b(n32_o),
    .c(gen_i_n1_gen_j_n4_pe_c),
    .a_out(gen_i_n1_gen_j_n4_pe_a_out),
    .b_out(gen_i_n1_gen_j_n4_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n31_o = a_bus[271:256];
  /* systolic_4x4.vhd:72:35  */
  assign n32_o = b_bus[271:256];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n2_gen_j_n1_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n36_o),
    .b(n37_o),
    .c(gen_i_n2_gen_j_n1_pe_c),
    .a_out(gen_i_n2_gen_j_n1_pe_a_out),
    .b_out(gen_i_n2_gen_j_n1_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n36_o = a_bus[239:224];
  /* systolic_4x4.vhd:72:35  */
  assign n37_o = b_bus[255:240];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n2_gen_j_n2_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n41_o),
    .b(n42_o),
    .c(gen_i_n2_gen_j_n2_pe_c),
    .a_out(gen_i_n2_gen_j_n2_pe_a_out),
    .b_out(gen_i_n2_gen_j_n2_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n41_o = a_bus[223:208];
  /* systolic_4x4.vhd:72:35  */
  assign n42_o = b_bus[239:224];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n2_gen_j_n3_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n46_o),
    .b(n47_o),
    .c(gen_i_n2_gen_j_n3_pe_c),
    .a_out(gen_i_n2_gen_j_n3_pe_a_out),
    .b_out(gen_i_n2_gen_j_n3_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n46_o = a_bus[207:192];
  /* systolic_4x4.vhd:72:35  */
  assign n47_o = b_bus[223:208];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n2_gen_j_n4_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n51_o),
    .b(n52_o),
    .c(gen_i_n2_gen_j_n4_pe_c),
    .a_out(gen_i_n2_gen_j_n4_pe_a_out),
    .b_out(gen_i_n2_gen_j_n4_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n51_o = a_bus[191:176];
  /* systolic_4x4.vhd:72:35  */
  assign n52_o = b_bus[207:192];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n3_gen_j_n1_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n56_o),
    .b(n57_o),
    .c(gen_i_n3_gen_j_n1_pe_c),
    .a_out(gen_i_n3_gen_j_n1_pe_a_out),
    .b_out(gen_i_n3_gen_j_n1_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n56_o = a_bus[159:144];
  /* systolic_4x4.vhd:72:35  */
  assign n57_o = b_bus[191:176];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n3_gen_j_n2_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n61_o),
    .b(n62_o),
    .c(gen_i_n3_gen_j_n2_pe_c),
    .a_out(gen_i_n3_gen_j_n2_pe_a_out),
    .b_out(gen_i_n3_gen_j_n2_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n61_o = a_bus[143:128];
  /* systolic_4x4.vhd:72:35  */
  assign n62_o = b_bus[175:160];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n3_gen_j_n3_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n66_o),
    .b(n67_o),
    .c(gen_i_n3_gen_j_n3_pe_c),
    .a_out(gen_i_n3_gen_j_n3_pe_a_out),
    .b_out(gen_i_n3_gen_j_n3_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n66_o = a_bus[127:112];
  /* systolic_4x4.vhd:72:35  */
  assign n67_o = b_bus[159:144];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n3_gen_j_n4_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n71_o),
    .b(n72_o),
    .c(gen_i_n3_gen_j_n4_pe_c),
    .a_out(gen_i_n3_gen_j_n4_pe_a_out),
    .b_out(gen_i_n3_gen_j_n4_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n71_o = a_bus[111:96];
  /* systolic_4x4.vhd:72:35  */
  assign n72_o = b_bus[143:128];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n4_gen_j_n1_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n76_o),
    .b(n77_o),
    .c(gen_i_n4_gen_j_n1_pe_c),
    .a_out(gen_i_n4_gen_j_n1_pe_a_out),
    .b_out(gen_i_n4_gen_j_n1_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n76_o = a_bus[79:64];
  /* systolic_4x4.vhd:72:35  */
  assign n77_o = b_bus[127:112];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n4_gen_j_n2_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n81_o),
    .b(n82_o),
    .c(gen_i_n4_gen_j_n2_pe_c),
    .a_out(gen_i_n4_gen_j_n2_pe_a_out),
    .b_out(gen_i_n4_gen_j_n2_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n81_o = a_bus[63:48];
  /* systolic_4x4.vhd:72:35  */
  assign n82_o = b_bus[111:96];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n4_gen_j_n3_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n86_o),
    .b(n87_o),
    .c(gen_i_n4_gen_j_n3_pe_c),
    .a_out(gen_i_n4_gen_j_n3_pe_a_out),
    .b_out(gen_i_n4_gen_j_n3_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n86_o = a_bus[47:32];
  /* systolic_4x4.vhd:72:35  */
  assign n87_o = b_bus[95:80];
  /* systolic_4x4.vhd:66:13  */
  hpe gen_i_n4_gen_j_n4_pe (
    .rst(RST),
    .clk(CLK),
    .en(EN),
    .a(n91_o),
    .b(n92_o),
    .c(gen_i_n4_gen_j_n4_pe_c),
    .a_out(gen_i_n4_gen_j_n4_pe_a_out),
    .b_out(gen_i_n4_gen_j_n4_pe_b_out));
  /* systolic_4x4.vhd:71:35  */
  assign n91_o = a_bus[31:16];
  /* systolic_4x4.vhd:72:35  */
  assign n92_o = b_bus[79:64];
  /* systolic_4x4.vhd:80:17  */
  assign n96_o = c_mat[511:480];
  /* systolic_4x4.vhd:80:37  */
  assign n97_o = c_mat[479:448];
  /* systolic_4x4.vhd:80:57  */
  assign n98_o = c_mat[447:416];
  /* systolic_4x4.vhd:80:77  */
  assign n99_o = c_mat[415:384];
  /* systolic_4x4.vhd:81:17  */
  assign n100_o = c_mat[383:352];
  /* systolic_4x4.vhd:81:37  */
  assign n101_o = c_mat[351:320];
  /* systolic_4x4.vhd:81:57  */
  assign n102_o = c_mat[319:288];
  /* systolic_4x4.vhd:81:77  */
  assign n103_o = c_mat[287:256];
  /* systolic_4x4.vhd:82:17  */
  assign n104_o = c_mat[255:224];
  /* systolic_4x4.vhd:82:37  */
  assign n105_o = c_mat[223:192];
  /* systolic_4x4.vhd:82:57  */
  assign n106_o = c_mat[191:160];
  /* systolic_4x4.vhd:82:77  */
  assign n107_o = c_mat[159:128];
  /* systolic_4x4.vhd:83:17  */
  assign n108_o = c_mat[127:96];
  /* systolic_4x4.vhd:83:37  */
  assign n109_o = c_mat[95:64];
  /* systolic_4x4.vhd:83:57  */
  assign n110_o = c_mat[63:32];
  /* systolic_4x4.vhd:83:77  */
  assign n111_o = c_mat[31:0];
  assign n112_o = {A0_in, gen_i_n1_gen_j_n1_pe_a_out, gen_i_n1_gen_j_n2_pe_a_out, gen_i_n1_gen_j_n3_pe_a_out, gen_i_n1_gen_j_n4_pe_a_out, A1_in, gen_i_n2_gen_j_n1_pe_a_out, gen_i_n2_gen_j_n2_pe_a_out, gen_i_n2_gen_j_n3_pe_a_out, gen_i_n2_gen_j_n4_pe_a_out, A2_in, gen_i_n3_gen_j_n1_pe_a_out, gen_i_n3_gen_j_n2_pe_a_out, gen_i_n3_gen_j_n3_pe_a_out, gen_i_n3_gen_j_n4_pe_a_out, A3_in, gen_i_n4_gen_j_n1_pe_a_out, gen_i_n4_gen_j_n2_pe_a_out, gen_i_n4_gen_j_n3_pe_a_out, gen_i_n4_gen_j_n4_pe_a_out};
  assign n113_o = {B0_in, B1_in, B2_in, B3_in, gen_i_n1_gen_j_n1_pe_b_out, gen_i_n1_gen_j_n2_pe_b_out, gen_i_n1_gen_j_n3_pe_b_out, gen_i_n1_gen_j_n4_pe_b_out, gen_i_n2_gen_j_n1_pe_b_out, gen_i_n2_gen_j_n2_pe_b_out, gen_i_n2_gen_j_n3_pe_b_out, gen_i_n2_gen_j_n4_pe_b_out, gen_i_n3_gen_j_n1_pe_b_out, gen_i_n3_gen_j_n2_pe_b_out, gen_i_n3_gen_j_n3_pe_b_out, gen_i_n3_gen_j_n4_pe_b_out, gen_i_n4_gen_j_n1_pe_b_out, gen_i_n4_gen_j_n2_pe_b_out, gen_i_n4_gen_j_n3_pe_b_out, gen_i_n4_gen_j_n4_pe_b_out};
  assign n114_o = {gen_i_n1_gen_j_n1_pe_c, gen_i_n1_gen_j_n2_pe_c, gen_i_n1_gen_j_n3_pe_c, gen_i_n1_gen_j_n4_pe_c, gen_i_n2_gen_j_n1_pe_c, gen_i_n2_gen_j_n2_pe_c, gen_i_n2_gen_j_n3_pe_c, gen_i_n2_gen_j_n4_pe_c, gen_i_n3_gen_j_n1_pe_c, gen_i_n3_gen_j_n2_pe_c, gen_i_n3_gen_j_n3_pe_c, gen_i_n3_gen_j_n4_pe_c, gen_i_n4_gen_j_n1_pe_c, gen_i_n4_gen_j_n2_pe_c, gen_i_n4_gen_j_n3_pe_c, gen_i_n4_gen_j_n4_pe_c};
endmodule

