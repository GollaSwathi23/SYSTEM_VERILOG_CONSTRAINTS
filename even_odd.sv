/*Q1:) Write a constraint randomize the variables which result odd or even numbers. */

class even_odd;
	rand int unsigned data_even;
	rand int unsigned data_odd;
	
	constraint  even_data {data_even %2==0;}
	constraint  odd_data  {data_odd %2!=0;}

endclass

module even_odd_top;
	initial
		begin
			even_odd pkth;
			pkth=new();
			repeat(10)
				begin
					pkth.randomize();
					$display("even_number:%0d odd_number:%0d",pkth.data_even,pkth.data_odd);
				end
		end
endmodule

					

