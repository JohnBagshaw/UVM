//-------------------------------------------------------------------------
//						By John Bagshaw [Memory - FIFO, Buffer, RAM, DDR]
//-------------------------------------------------------------------------
// Create() and print() methods

class mem_seq_item extends uvm_sequence_item;
  // Control Information
  rand bit [3:0] addr;
  rand bit       wr_en;
  rand bit       rd_en;
  
  // Payload Information 
  rand bit [7:0] wdata;
  
  // Analysis Information
       bit [7:0] rdata;
  
  // Utility and Field macros
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(wr_en, UVM_ALL_ON)
    `uvm_field_int(rd_en, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
  `uvm_object_utils_end
  
  // Constructor
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction
  
  // Constraint to generate either write or read
  constraint wr_rd_c { wr_en != rd_en; }
  
  // Print method for easy debugging
  function void print_item();
    `uvm_info(get_type_name(), $sformatf("Address: %0h, Write Enable: %0b, Read Enable: %0b, Write Data: %0h, Read Data: %0h",
                                         addr, wr_en, rd_en, wdata, rdata), UVM_LOW)
  endfunction
endclass

//-----------------------------------------------------------------
//TestBench to create and randomize sequence item
//-------------------------------------------------------------------------

module seq_item_tb;
  
  // Instance
  mem_seq_item seq_item;
  
  initial begin
    // Test Case 1: Default randomization
    run_test("Test Case 1");
    
    // Test Case 2: Address in lower range
    run_test("Test Case 2", 4'h0, 8'h0);
    
    // Test Case 3: Address in upper range
    run_test("Test Case 3", 4'hF, 8'hFF);
    
    // Test Case 4: Write operation only
    run_test("Test Case 4", 4'hA, 8'h55, 1'b1, 1'b0);
    
    // Test Case 5: Read operation only
    run_test("Test Case 5", 4'h5, 8'hAA, 1'b0, 1'b1);
  end
  
  // Task to run a test case
  task run_test(string test_name, bit [3:0] addr = '0, bit [7:0] wdata = '0, bit wr_en = 'x, bit rd_en = 'x);
    `uvm_info("seq_item_tb", $sformatf("Starting %s", test_name), UVM_LOW)
    
    // Create method
    seq_item = mem_seq_item::type_id::create("seq_item");
    
    // Assign specific values if provided
    if (wr_en !== 'x) seq_item.wr_en = wr_en;
    if (rd_en !== 'x) seq_item.rd_en = rd_en;
    if (addr !== '0) seq_item.addr = addr;
    if (wdata !== '0) seq_item.wdata = wdata;
    
    // Randomizing the sequence item
    if (!seq_item.randomize()) begin
      `uvm_error("seq_item_tb", "Randomization failed")
    end
    
    // Printing the sequence item using the custom print method
    seq_item.print_item();
    
    `uvm_info("seq_item_tb", $sformatf("Completed %s", test_name), UVM_LOW)
  endtask

endmodule
