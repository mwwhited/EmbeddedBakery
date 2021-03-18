`timescale 1ns / 1ps

module Top(
    input        CLK100MHZ  ,
    input  [3:0] sw         ,
    input  [3:0] btn        ,
    output [3:0] led_b      ,
    output [3:0] led_g      ,
    output [3:0] led_r      ,
    output [3:0] led        ,
    inout  [7:0] ja
    );
    
    
    logic sw4;
    assign sw4  = ja[3];
    logic btn4;
    assign btn4 = ja[2];
    
    logic       dividedClock           ;   
    ClockDivider_0 clockDivider(
        .SystemClock(CLK100MHZ),
        .DividedClock(dividedClock)
    );
    
    //assign led = ja[0:3];
    
    logic       rst           ; // : IN STD_LOGIC;                     
    logic       wr_clk        ; // : IN STD_LOGIC;                     
    logic       rd_clk        ; // : IN STD_LOGIC;                     
    logic [3:0] din           ; // : IN STD_LOGIC_VECTOR(3 DOWNTO 0);  
    logic       wr_en         ; // : IN STD_LOGIC;                     
    logic       rd_en         ; // : IN STD_LOGIC;                     
    logic [3:0] dout          ; // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    logic       full          ; // : OUT STD_LOGIC;                    
  //logic       almost_full   ; // : OUT STD_LOGIC;                    
    logic       wr_ack        ; // : OUT STD_LOGIC;                    
  //logic       overflow      ; // : OUT STD_LOGIC;                    
    logic       empty         ; // : OUT STD_LOGIC;                    
  //logic       almost_empty  ; // : OUT STD_LOGIC;                    
    logic       valid         ; // : OUT STD_LOGIC;                    
  //logic       underflow     ; // : OUT STD_LOGIC;                    
    logic [3:0] rd_data_count ; // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    logic [3:0] wr_data_count ; // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    logic       wr_rst_busy   ; // : OUT STD_LOGIC;                    
    logic       rd_rst_busy   ; // : OUT STD_LOGIC
        
    assign din    = { 1'b0, sw[2:0] }   ; 
    assign rst    = btn[0];
    assign wr_clk = dividedClock; // & btn[1];
    assign rd_clk = dividedClock; // & btn[2];
    assign wr_en  = btn[3];
    assign rd_en  = btn4;
    
    assign led    = 
        sw[3] ? 
            (sw4 ? din : dout)
        :
            (sw4 ? wr_data_count : rd_data_count)
        ;
    assign led_r  = sw4 ?
    {
        wr_rst_busy,
        rd_rst_busy,
        1'b0,
        1'b0
    } : {
        1'b0,
        1'b0,
        wr_rst_busy,
        rd_rst_busy
    };
    // assign led_g  = sw4 ? din : dout;
    assign led_b  = sw4 ?
    {
        wr_ack,
        full,
        wr_clk,
        dividedClock
    } : {
        dividedClock,
        rd_clk,
        empty,
        valid
    };
          
    fifo_generator_0 fifo (
        .rst           (rst           ), // : IN STD_LOGIC;
        .wr_clk        (wr_clk        ), // : IN STD_LOGIC;
        .rd_clk        (rd_clk        ), // : IN STD_LOGIC;
        .din           (din           ), // : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        .wr_en         (wr_en         ), // : IN STD_LOGIC;
        .rd_en         (rd_en         ), // : IN STD_LOGIC;
        .dout          (dout          ), // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        .full          (full          ), // : OUT STD_LOGIC;
      //.almost_full   (almost_full   ), // : OUT STD_LOGIC;
        .wr_ack        (wr_ack        ), // : OUT STD_LOGIC;
      //.overflow      (overflow      ), // : OUT STD_LOGIC;
        .empty         (empty         ), // : OUT STD_LOGIC;
      //.almost_empty  (almost_empty  ), // : OUT STD_LOGIC;
        .valid         (valid         ), // : OUT STD_LOGIC;
      //.underflow     (underflow     ), // : OUT STD_LOGIC;
        .rd_data_count (rd_data_count ), // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        .wr_data_count (wr_data_count ), // : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        .wr_rst_busy   (wr_rst_busy   ), // : OUT STD_LOGIC;
        .rd_rst_busy   (rd_rst_busy   )  // : OUT STD_LOGIC
    );
    
endmodule
