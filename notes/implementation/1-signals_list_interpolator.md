# Interpolator
### Registers
1. reg_input_line
   - Write: write_reg_input_line
   - Reset: rst_async_reg_input_line
   - In: **INTEGER SAMPLES**
   - Out: out_reg_input_line
2. reg_counter
   - Write: write_reg_counter
   - Reset: rst_async_reg_counter
   - In: out_add_counter
   - Out: out_reg_counter
3. reg_int_out
   - Write: write_reg_int_out
   - Reset: rst_async_reg_int_out
   - In: out_mux_in_sel
   - Out: **out_interp**
4. transpose_buffer
    - Write: write_buffer
    - Reset: rst_async_buffer
    - In: out_mux_in_sel_0 & out_mux_in_sel_1 & out_mux_in_sel_2 & out_mux_in_sel_3
    - Out: column_0, column_1, column_2, column_3 

### Muxes
1. mux_in_sel_0
    - 0: out_fp_0
    - 1: out_reg_input_line[2]
    - Sel: sel_in
    - Out: out_mux_in_sel_0
2. mux_in_sel_1
    - 0: out_fp_1
    - 1: out_reg_input_line[3]
    - Sel: sel_in
    - Out: out_mux_in_sel_1
3. mux_in_sel_2
    - 0: out_fp_2
    - 1: out_reg_input_line[4]
    - Sel: sel_in
    - Out: out_mux_in_sel_2
4. mux_in_sel_3
    - 0: out_fp_3
    - 1: out_reg_input_line[5]
    - Sel: sel_in
    - Out: out_mux_in_sel_3
5. mux_column_sel
    - 0: column_0
    - 1: column_1
    - 2: column_2
    - 3: column_3
    - Sel: sel_column
    - Out: out_mux_column_sel
6. mux_interp_in_sel
    - 0: out_mux_column_sel
    - 1: out_reg_input_line
    - Sel: sel_interp_in
    - Out: out_mux_interp_in_sel
7. mux_filter_sel_0
    - 0: out_interp_0_0
    ...
    - 14: out_interp_0_14
    - Sel: sel_filter
    - Out: out_mux_filter_sel_0
8. mux_filter_sel_1
    - 0: out_interp_1_0
    ...
    - 14: out_interp_1_14
    - Sel: sel_filter
    - Out: out_mux_filter_sel_1
9.  mux_filter_sel_2
    - 0: out_interp_2_0
    ...
    - 14:  out_interp_2_14
    - Sel: sel_filter
    - Out: out_mux_filter_sel_2
10.  mux_filter_sel_3
     - 0: out_interp_3_0
    ...
     - 14: out_interp_3_14
     - Sel: sel_filter
     - Out: out_mux_filter_sel_3
11. mux_dimension_sel
    - 0: out_reg_MV_Y[3:0]
    - 1: out_reg_MV_X[3:0]
    - Sel: sel_dimension
    - Out: out_mux_dimension_sel

### Adders
1. adder_counter
    - A: out_reg_counter
    - B: '1'
    - Out: out_add_counter

---
### Control signals
1. write_reg_input_line
2. write_reg_counter
3. write_reg_int_out
4. write_buffer
5. rst_async_reg_input_line
6. rst_async_reg_counter
7. rst_async_reg_int_out
8. rst_async_buffer
9. sel_in
1.  sel_interp_in
2.  sel_filter
3.  sel_dimension
4.  --> loop_4
5.  --> loop_9
6.  --> loop_13