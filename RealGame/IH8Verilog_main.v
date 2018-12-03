
//--  This file was automatically generated by the PowerPoint2Verilog compiler. Please do not change anything and use the compiler instead --//

module PP2VerilogDrawingController(CLOCK,reset,animationCLOCK,wasd,arrows,xPixel,yPixel,VGAr,VGAg,VGAb,mouseX,mouseY);

input CLOCK;
input animationCLOCK;
input [3:0]wasd;
input [3:0]arrows;
input [9:0]xPixel;
input[8:0]yPixel;
input [10:0]mouseX;
input [10:0]mouseY;
output [7:0]VGAr;
output [7:0]VGAg;
output [7:0]VGAb;
reg [7:0]VGAr;
reg [7:0]VGAg;
reg [7:0]VGAb;
reg [15:0]buffer;
input reset;

always @(*)
begin

	//Writing backgound color
	VGAr = 8'b11111111;
	VGAg = 8'b11111111; 
	VGAb = 8'b11111111; 

	//Drawing Solid shape "UNNAMED"
	if(xPixel>83 && xPixel<372 && yPixel>20 && yPixel<223)
	begin
		VGAr = 8'b01011011;
		VGAg = 8'b10011011;
		VGAb = 8'b11010101;
	end

	//Drawing Solid shape "UNNAMED"
	if(xPixel>298 && xPixel<587 && yPixel>180 && yPixel<383)
	begin
		VGAr = 8'b01111100;
		VGAg = 8'b01111100;
		VGAb = 8'b01111100;
	end

end



endmodule