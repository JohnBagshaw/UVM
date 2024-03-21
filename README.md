# Memory DUT Verification (FIFO, Buffer, RAM, DDR, DMA) for create() and print() Methods
Using uvm sequence item create() and print() methods.

OVERVIEW:

This code defines a UVM sequence item class named mem_seq_item used for generating transactions in a verification environment. It contains control information (addr, wr_en, and rd_en) representing address and read/write enable signals, and payload information (wdata and rdata) representing data to be written and read.


The class utilizes UVM field macros to automate tasks related to field manipulation, such as printing, copying, and comparing objects. These macros (uvm_field_int) are used to declare the fields of the sequence item class.


A constructor is defined to initialize the sequence item with a default name.


A constraint (wr_rd_c) is imposed to ensure that either a write (wr_en = 1) or a read (rd_en = 1) operation is generated, but not both simultaneously.


The seq_item_tb module instantiates the mem_seq_item class, creates an instance of it, randomizes its fields, and prints the randomized sequence item.
![Screenshot 2024-03-20 203228](https://github.com/JohnBagshaw/UVM/assets/84130776/e21edcd6-df16-4ffe-8b6b-1172dc775af4)


# Producer_Consumer_TB_JohnB_UVM
Design Verification Tasks
"Simple Producer-Consumer Communication Testbench Using UVM Methodology" (towards helping newbies and related interest groups)



***https://www.edaplayground.com/x/aDnN***



The code snippet in the link above shows a testbench for a producer-consumer communication scenario, implemented using the Universal Verification Methodology (UVM). The testbench consists of three classes: "producer", "consumer", and "env". The "producer" and "consumer" classes simulate the source and sink of the data respectively, while the "env" class sets up the test environment and coordinates the communication between the two components.



The "include" statement at the beginning of the code imports the UVM macro definitions, which provide various functionalities for the UVM methodology, such as message logging, transaction recording, and configuration management.



The "test" module is the top-level module of the testbench, which instantiates the "env" class and calls the "run_test" function. The "import uvm_pkg::*" statement brings in all the UVM classes and packages into the module's scope.



The "producer" and "consumer" classes each have a single port for sending and receiving integers respectively, while the "env" class creates instances of the producer, consumer, and FIFO classes and connects the ports to the FIFO channel to ensure that integers are transmitted from the producer to the consumer through the FIFO buffer.



The testbench is designed to verify that the communication between the producer and consumer is working correctly and to test the behavior of the design under various conditions.



Overall, the code demonstrates a simple example of using the UVM methodology to develop and test hardware designs, providing a useful tool for verifying the correctness of complex hardware designs.



See the results and code snippets below: 
![image](https://user-images.githubusercontent.com/84130776/236657199-e61c4fb0-5133-4e6e-9675-83d0c49d4750.png)
