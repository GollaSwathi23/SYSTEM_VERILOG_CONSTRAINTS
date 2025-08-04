class seq_0011;
	rand bit array[];
	
	constraint array_size {array.size()==20;}
	constraint seq {foreach(array[i])
			array[i]==((i%4)<2)?0:1 ;}
	
endclass
module seq_011_top;
	initial
		begin
		    seq_0011 pkth;
		    pkth=new();
		    repeat(10)
			begin
			    pkth.randomize();
			    $write("The seq of array is :[");
			    foreach(pkth.array[i])
			     $write("%0b ",pkth.array[i]);
			    $display("]");
			end
		end
endmodule
