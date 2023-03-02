# Verilog Tips

- **Always** is used for registers + combinational logic. If it is *always(@ posedge clk)*, the event *posedge clk* triggers the always block and the logic inside the block is evaluated and assigned.
  - **always @ (*)** - If something in the RHS of the always block changes,that particular expression is evaluated and assigned. 

- **Assign** is used for net type declarations (Wire,Tri etc). Since wires change values according to the value driving them, whenever the operands on the RHS changes, the value is evaluated and assigned to LHS (simulating a wire).

- **Statements:** 
  - **=** is blocking statement. In an always block, the line of code will be executed only after it's previous line has executed. Hence, they happens one after the other, just like combinatoral logics in loop.
  - **<=** is non-blocking in nature. This means that in an always block, every line will be executed in parallel. Hence leading to implementation of sequential elements.

- **Variable data types** are: integer, real, realtime, reg, time.
    - **integer** is typically a 32 bit twos complement integer.
    - **real** is typically a 64 bit IEEE floating point number.
    - **realtime** is of type real used for storing time as a floating point value. 
    - **reg** is by default a one bit unsigned value.
        - The reg variable data type may have a modifier signed, and may have bits by using the vector modifier [msb:lsb].
    - **time** is typically 64 bit unsigned value that is the simulation time. The system function $time provides the simulation time.
  
