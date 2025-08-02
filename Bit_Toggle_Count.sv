/*Q1:There is an 8 bit vector (bit [7:0] data_in) which takes some random variable value. Write a constraint 
in such a way that every time it is randomized, total number of bits toggled in data_in vector.*/
class packet_toggle;
	rand bit [7:0] data_in;
	      bit [7:0] prev_data;
	      int toggle_count;
	
	constraint toggled_bits {$countones(data_in ^ prev_data)>0;}
	constraint prev_data_not {prev_data!=data_in;}

	function void pre_randomize();
		prev_data = data_in;
	endfunction

	function void post_randomize();
		toggle_count=$countones(data_in^prev_data);
	endfunction

endclass
module toggle_Top;
	initial
	   begin
		packet_toggle pkth;
			pkth=new();
			pkth.data_in=8'b00000000;
			repeat(10)
			begin
				pkth.randomize();
				$display("data:%0b prev_data:%0b tgl_bits:%0d",pkth.data_in,pkth.prev_data,pkth.toggle_count);
			end
	end
endmodule

