module PP2VerilogDrawingController(xPixel,yPixel,VGAr,VGAg,VGAb,mouseX,mouseY);

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

always @(*)
begin

	//Writing backgound color
	VGAr = 8'b00011001;
	VGAg = 8'b00101101; 
	VGAb = 8'b00001010; 

	//Drawing Solid shape "Bottom properties"
	if(xPixel>53 && xPixel<639 && yPixel>385 && yPixel<479)
	begin
		VGAr = 8'b10101111;
		VGAg = 8'b10101011;
		VGAb = 8'b10101011;
		if(xPixel<54 || xPixel>638 || yPixel<386 || yPixel>478)    //Drawing border
		begin
			VGAr = 8'b00101111;
			VGAg = 8'b01010010;
			VGAb = 8'b10001111;
		end
	end

	//Drawing Solid shape "Random Orange box"
	if(xPixel>439 && xPixel<604 && yPixel>41 && yPixel<384)
	begin
		VGAr = 8'b11000101;
		VGAg = 8'b01011010;
		VGAb = 8'b00010001;
	end

	//Drawing Solid shape "Solid purple with transparent border"
	//   --> Allowed 50% transparent render
	if(xPixel>69 && xPixel<348 && yPixel>59 && yPixel<187)
	begin
		VGAr = 8'b01110000;
		VGAg = 8'b00110000;
		VGAb = 8'b10100000;
		if(xPixel<71 || xPixel>346 || yPixel<61 || yPixel>185)    //Drawing border
		begin
			VGAr = (8'b11111111 + VGAr) / 2;
			VGAg = (8'b11011001 + VGAg) / 2;
			VGAb = (8'b01100110 + VGAb) / 2;
		end
	end

	//Drawing Solid shape "Basic transparency"
	//   --> Allowed 50% transparent render
	if(xPixel>24 && xPixel<412 && yPixel>231 && yPixel<299)
	begin
		VGAr = 8'b01010100;
		VGAg = 8'b10000010;
		VGAb = 8'b00110101;
	end

	//Drawing Solid shape "High transparency"
	//   --> Allowed 50% transparent render
	if(xPixel>369 && xPixel<470 && yPixel>130 && yPixel<198)
	begin
		VGAr = (8'b01000000 + VGAr) / 2;
		VGAg = (8'b01000000 + VGAg) / 2;
		VGAb = (8'b01000000 + VGAb) / 2;
	end

	//Drawing Solid shape "Low transparency"
	//   --> Allowed 50% transparent render
	if(xPixel>369 && xPixel<470 && yPixel>25 && yPixel<93)
	begin
		VGAr = (8'b01010100 + VGAr) / 2;
		VGAg = (8'b10000010 + VGAg) / 2;
		VGAb = (8'b00110101 + VGAb) / 2;
	end

	//Drawing Solid shape "Left bar"
	if(xPixel>0 && xPixel<278 && yPixel>0 && yPixel<206)
	begin
		VGAr = 8'b01000100;
		VGAg = 8'b01110010;
		VGAb = 8'b11000100;
	end

	//Drawing mouse: 
	if(yPixel>=(mouseY+1) && yPixel<(mouseY+2) && xPixel>=(mouseX+3) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b01010010,8'b01001000,8'b00000100};
	if(yPixel>=(mouseY+1) && yPixel<(mouseY+2) && xPixel>=(mouseX+4) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+1) && yPixel<(mouseY+2) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+1) && yPixel<(mouseY+2) && xPixel>=(mouseX+7) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+1) && yPixel<(mouseY+2) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+3) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+7) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b11010000,8'b10111000,8'b00001000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+2) && yPixel<(mouseY+3) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+2) && xPixel<(mouseX+3)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+3) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b10001010,8'b01111100,8'b00000100};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b01011000,8'b01010010,8'b00000100};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10010000,8'b10000000,8'b00000110};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b10101000,8'b10101000,8'b10101000};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b00010000,8'b01010000,8'b00011010};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+10) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11010100,8'b11000000,8'b00001000};
	if(yPixel>=(mouseY+3) && yPixel<(mouseY+4) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b01011000,8'b01010100,8'b00000100};
	if(yPixel>=(mouseY+4) && yPixel<(mouseY+5) && xPixel>=(mouseX+2) && xPixel<(mouseX+3)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+4) && yPixel<(mouseY+5) && xPixel>=(mouseX+3) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+4) && yPixel<(mouseY+5) && xPixel>=(mouseX+6) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+4) && yPixel<(mouseY+5) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b00110000,8'b11111111,8'b01010010};
	if(yPixel>=(mouseY+4) && yPixel<(mouseY+5) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b00101000,8'b11001100,8'b01000010};
	if(yPixel>=(mouseY+4) && yPixel<(mouseY+5) && xPixel>=(mouseX+10) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+1) && xPixel<(mouseX+2)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+2) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b01010100,8'b01001000,8'b00000100};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b00101100,8'b00101000,8'b00000010};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+5) && yPixel<(mouseY+6) && xPixel>=(mouseX+11) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+0) && xPixel<(mouseX+1)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+1) && xPixel<(mouseX+2)) {VGAr,VGAg,VGAb}={8'b10000100,8'b01110100,8'b00000100};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+2) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+4) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10110000,8'b10011100,8'b00000110};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001100,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b10111010,8'b10101100,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11010000,8'b10111010,8'b00001000};
	if(yPixel>=(mouseY+6) && yPixel<(mouseY+7) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+1) && xPixel<(mouseX+2)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+2) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001100,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b01010100,8'b01001000,8'b00000100};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b01101110,8'b01100100,8'b00000100};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+14) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+7) && yPixel<(mouseY+8) && xPixel>=(mouseX+20) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+1) && xPixel<(mouseX+2)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+2) && xPixel<(mouseX+3)) {VGAr,VGAg,VGAb}={8'b01001010,8'b01001010,8'b01001010};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+3) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b00010000,8'b00010000,8'b00010000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11101100,8'b10100110,8'b01100000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b00101100,8'b00101000,8'b00000010};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001010,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b01000010,8'b00111010,8'b00000010};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+15) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+19) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b11010000,8'b10111010,8'b00001000};
	if(yPixel>=(mouseY+8) && yPixel<(mouseY+9) && xPixel>=(mouseX+20) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+1) && xPixel<(mouseX+2)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+2) && xPixel<(mouseX+3)) {VGAr,VGAg,VGAb}={8'b10010100,8'b10010100,8'b10010100};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+3) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b01010000,8'b01010000,8'b01010000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b11001000,8'b11001000,8'b11001000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b00011110,8'b00011110,8'b00011110};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11000010,8'b11000010,8'b11000010};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b11010100,8'b10111110,8'b00001000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+10) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+15) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b01010100,8'b01001010,8'b00000100};
	if(yPixel>=(mouseY+9) && yPixel<(mouseY+10) && xPixel>=(mouseX+19) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+3) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+13) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+15) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b01011000,8'b01010010,8'b00000100};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+19) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+10) && yPixel<(mouseY+11) && xPixel>=(mouseX+20) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+3) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b11010000,8'b10111010,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+5) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000110,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+11) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+15) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b01011000,8'b01010010,8'b00000100};
	if(yPixel>=(mouseY+11) && yPixel<(mouseY+12) && xPixel>=(mouseX+19) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b01011000,8'b01010100,8'b00000100};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b01010100,8'b01001100,8'b00000100};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+7) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b01010100,8'b01001000,8'b00000100};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+10) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b01110010,8'b01101000,8'b00000100};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+15) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b10010110,8'b10001010,8'b00000110};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+17) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b00110110,8'b00110100,8'b00000000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+19) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+12) && yPixel<(mouseY+13) && xPixel>=(mouseX+21) && xPixel<(mouseX+22)) {VGAr,VGAg,VGAb}={8'b10001110,8'b01111110,8'b00000110};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+7) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+15) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+17) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11010100,8'b11000000,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+19) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+13) && yPixel<(mouseY+14) && xPixel>=(mouseX+21) && xPixel<(mouseX+22)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00101000,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+7) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+10) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+15) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+17) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11010110,8'b11000010,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b01011010,8'b01010000,8'b00000100};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+19) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+14) && yPixel<(mouseY+15) && xPixel>=(mouseX+21) && xPixel<(mouseX+22)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001000,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+2) && xPixel<(mouseX+3)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+3) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+4) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+7) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+10) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b11011000,8'b11000100,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b00101000,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+15) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b10000110,8'b01111100,8'b00000100};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+19) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+15) && yPixel<(mouseY+16) && xPixel>=(mouseX+21) && xPixel<(mouseX+22)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+2) && xPixel<(mouseX+4)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+10) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b01110010,8'b01101000,8'b00000100};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+13) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+16) && yPixel<(mouseY+17) && xPixel>=(mouseX+20) && xPixel<(mouseX+22)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+3) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+8) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+12) && xPixel<(mouseX+13)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+13) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b10111110,8'b10101000,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+15) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b01111100,8'b01101100,8'b00000100};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+16) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+20) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+17) && yPixel<(mouseY+18) && xPixel>=(mouseX+21) && xPixel<(mouseX+22)) {VGAr,VGAg,VGAb}={8'b11010000,8'b10111010,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b01110100,8'b01100100,8'b00000100};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001010,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+8) && xPixel<(mouseX+11)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+11) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11010100,8'b11000000,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+12) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b00101000,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+15) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b11010100,8'b11000000,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+17) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+19) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+18) && yPixel<(mouseY+19) && xPixel>=(mouseX+20) && xPixel<(mouseX+21)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b00101010,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+8) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+12) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b00101000,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+15) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+19) && yPixel<(mouseY+20) && xPixel>=(mouseX+17) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+9) && xPixel<(mouseX+12)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+12) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b00101000,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+15) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+20) && yPixel<(mouseY+21) && xPixel>=(mouseX+17) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b01001100,8'b01000100,8'b00000100};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11010110,8'b11000000,8'b00001000};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b10001100,8'b01111100,8'b00000100};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+10) && xPixel<(mouseX+14)) {VGAr,VGAg,VGAb}={8'b00101010,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+14) && xPixel<(mouseX+15)) {VGAr,VGAg,VGAb}={8'b00100010,8'b00011100,8'b00000000};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+15) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b00101010,8'b00100100,8'b00000010};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b10101100,8'b10011000,8'b00000110};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+17) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+21) && yPixel<(mouseY+22) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b10111100,8'b10100110,8'b00001000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+4) && xPixel<(mouseX+5)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+5) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11011100,8'b11001010,8'b00001000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+9) && xPixel<(mouseX+10)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+10) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+17) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b10000110,8'b01111100,8'b00000100};
	if(yPixel>=(mouseY+22) && yPixel<(mouseY+23) && xPixel>=(mouseX+19) && xPixel<(mouseX+20)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+4) && xPixel<(mouseX+6)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+6) && xPixel<(mouseX+7)) {VGAr,VGAg,VGAb}={8'b01100100,8'b01011000,8'b00000100};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+7) && xPixel<(mouseX+8)) {VGAr,VGAg,VGAb}={8'b11001110,8'b10110100,8'b00001000};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+8) && xPixel<(mouseX+9)) {VGAr,VGAg,VGAb}={8'b10101100,8'b10011000,8'b00001000};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+9) && xPixel<(mouseX+16)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+16) && xPixel<(mouseX+17)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+17) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+23) && yPixel<(mouseY+24) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b11011110,8'b11001110,8'b00001000};
	if(yPixel>=(mouseY+24) && yPixel<(mouseY+25) && xPixel>=(mouseX+6) && xPixel<(mouseX+18)) {VGAr,VGAg,VGAb}={8'b00000000,8'b00000000,8'b00000000};
	if(yPixel>=(mouseY+24) && yPixel<(mouseY+25) && xPixel>=(mouseX+18) && xPixel<(mouseX+19)) {VGAr,VGAg,VGAb}={8'b10100100,8'b10010000,8'b00000110};

end

endmodule
