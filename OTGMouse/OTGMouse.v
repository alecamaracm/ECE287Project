module OTGMouse(CLOCK,leds,ps2ck,ps2dt);

	output [15:0]leds;
	reg [15:0]leds;
	
	input ps2ck,ps2dt;
	
	input CLOCK;
	
	reg start;
	reg [7:0]data;
	reg parity;
	reg stop;
	
	reg [3:0]position;
	

	
	reg [5:0]skipCycles;
	
	
	
	always @(posedge ps2ck)
	begin
	
				
		if(stop==1 || position>12)
		begin
		
			start=0;
				stop=0;
				parity=0;
				leds[7:0]=data;	
				position=0;

		end
		else 
		begin
		
			case (position)
				4'd0:
				begin
					start=1;
				end
				4'd1:
				begin
					data[0]=ps2dt;
				end
				4'd2:
				begin
					data[1]=ps2dt;
				end
				4'd3:
				begin
					data[2]=ps2dt;
				end
				4'd4:
				begin
					data[3]=ps2dt;
				end
				4'd5:
				begin
					data[4]=ps2dt;
				end
				4'd6:
				begin
					data[5]=ps2dt;
				end
				4'd7:
				begin
					data[6]=ps2dt;
				end
				4'd8:
				begin
					data[7]=ps2dt;
				end
				4'd9:
				begin
					parity=ps2dt;
				end
				
				4'd10:  //Parity
				begin
					stop=ps2dt;
				end
			endcase
		end
		
		position=position+1;
	
	end
	
	
endmodule

