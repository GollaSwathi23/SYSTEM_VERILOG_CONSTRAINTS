/*Define following constraints for a 4-bit dynamic array. 
The size of the array should be in between 15 to 20. 
There should be even numbers in odd location and odd numbers in even locations */
class  eveninoddineven;
	rand bit[3:0] dyn_arry[];
	
	constraint size_array {dyn_arry.size inside {[15:20]};}
	constraint location {foreach (dyn_arry[i])
		{
			if(i%2==0)
				dyn_arry[i]%2==1;
			else
				dyn_arry[i]%2==0;
		}
	}
		
	
	
endclass

module eveninoddineven_top;
	initial 
		begin
			eveninoddineven pkth;
			pkth=new();
			repeat(10)
			begin
				pkth.randomize();
				$write("Array size :%0d [ ",pkth.dyn_arry.size());
				foreach(pkth.dyn_arry[i])
					$write("%0d ",pkth.dyn_arry[i]);
				$display("]");
				
			end
		end
endmodule
	
