/* Write a constraint to generate even or odd numbers with in the range of 1022-1063 without using  
modulus or divide operator*/

class even_odd_without_opr;
	rand int unsigned even_data;
	rand int  unsigned odd_data;
	
	constraint data_range_even { even_data inside {[1022:1063]};}
	constraint data_range_odd  {odd_data   inside {[1022:1063]};}
	
	constraint data_even {(even_data & 1) ==0;}
	constraint data_odd  {(odd_data & 1) ==1;}
	
endclass

module even_odd_without_opr_top;
	initial
		begin
			even_odd_without_opr pkth;
			pkth=new();
			repeat(10)
				begin	
					pkth.randomize();
					$display("even_data:%0d odd_data:%0d",pkth.even_data,pkth.odd_data);
				end
		end
endmodule
