module counter (x,clk,reset,preload,load,count);
	input x,clk,reset,preload;
	input [3:0] load;
	output reg [3:0] count;

	reg [2:0] i=0;    // [23:0] i=0, for conversion of 30MHz clock to 1 MHz clock
	reg clkout=0;

	// New clock with time period of 10 Secs
	always@(negedge clk)
	begin
		i<=i+1;
		if(i==5)     // i==14705882 for conversion of 30MHz clock to 1MHz clock
		begin
			clkout <= ~clkout;
			i <= 0;
		end
	end

// mod-16 Counter Logic
	always@(posedge clkout, negedge reset)
	begin
		if(!reset)
			count<=0;
		else
		begin
			if(preload==1)
			begin
				count<=load;
				if (x==1)
				begin
					if(count==15)
						count<=0;
					else
						count<=count+1;
				end
				else
				begin
					if(count==0)
						count<=15;
					else
						count<=count-1;
				end
			end
			else if (x==1 && preload==0)
			begin
				if(count==15)
					count<=0;
				else
					count<=count+1;
			end
			else
			begin
				if(count==0)
					count<=15;
				else
					count<=count-1;
			end
		end
	end
endmodule
