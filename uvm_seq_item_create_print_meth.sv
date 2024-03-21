//-------------------------------------------------------------------------
//						By John Bagshaw [Memory - FIFO, Buffer, RAM, DDR]
//-------------------------------------------------------------------------
class mem_seq_item extends uvm_sequence_item;
  // Control Information
  rand bit [3:0] addr;
  rand bit wr_en;
  rand bit rd_en;
  
  // Payload Information 
  rand bit [7:0] wdata;
  bit [7:0] rdata;
  
  // Utility and Field macros,
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(wr_en, UVM_ALL_ON)
    `uvm_field_int(rd_en, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_field_int(rdata, UVM_ALL_ON)
  `uvm_object_utils_end
  
  // Constructor
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction
  
  // Constraint to generate either write or read operation
  constraint wr_rd_c { wr_en != rd_en; }
endclass

//-------------------------------------------------------------------------
// Simple TestBench to create and randomize sequence item
//-------------------------------------------------------------------------
module seq_item_tb;
  
  // Instance
  mem_seq_item seq_item;
  
  initial begin
    // Create and randomize the sequence item
    seq_item = mem_seq_item::type_id::create(); 
    seq_item.randomize();
    
    // Print the sequence item
    seq_item.print();   
  end  
endmodule
