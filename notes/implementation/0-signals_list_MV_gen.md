# Motion generator datapath
### Registers 
1. reg_coord_X
   - Write: write_reg_coord_X
   - Reset: rst_async_reg_coord_X
   - In: **coord_X**
   - Out: out_reg_coord_X
2. reg_coord_Y
   - Write: write_reg_coord_Y
   - Reset: rst_async_reg_coord_Y
   - In: **coord_Y**
   - Out: out_reg_coord_y
3. reg_X
   - Write: write_reg_X
   - Reset: rst_async_reg_X
   - In: out_mux_X_sel
   - Out: out_reg_X
4. reg_Y
   - Write: write_reg_Y
   - Reset: rst_async_reg_Y
   - In: out_mux_Y_sel
   - Out: out_reg_Y
5. reg_MV_0
   - Write: write_reg_MV_0
   - Reset: rst_async_reg_MV_0
   - In: **MV_0**
   - Out: out_reg_MV_0
6. reg_MV_1
   - Write: write_reg_MV_1
   - Reset: rst_async_reg_MV_1
   - In: **MV_1**
   - Out: out_reg_MV_1
7. reg_gen_MV_X
   - Write: write_reg_gen_MV_X
   - Reset: rst_async_reg_gen_MV_X
   - In: out_MV_gen_X
   - Out: **out_reg_gen_MV_X**
8. reg_gen_MV_Y
   - Write: write_reg_gen_MV_Y
   - Reset: rst_async_reg_gen_MV_Y
   - In: out_MV_gen_Y
   - Out: **out_reg_gen_MV_Y**
9. reg_count_block
   - Write: write_reg_count_block
   - Reset: rst_async_reg_count_block
   - In: out_add_count_block
   - Out: out_reg_count_block

### Muxes
1. mux_X_sel
   - 0: out_reg_coord_X
   - 1: out_add_coord_X
   - Sel: sel_X
   - Out: out_mux_X_sel
2. mux_Y_sel
   - 0: out_reg_coord_Y
   - 1: out_add_coord_Y
   - Sel: sel_Y
   - Out: out_mux_Y_sel

### Adders
1. adder_coord_X
   - A: out_reg_coord_X
   - B: increment_X
   - Out: out_add_coord_X
2. adder_coord_Y
   - A: out_reg_coord_Y
   - B: increment_Y
   - Out: out_add_coord_X
3. adder_count_block
   - A: out_reg_count_block
   - B: '1'
   - Out: out_add_count_block
---
### Control signals
1. write_reg_coord_X
2. write_reg_coord_Y
3. write_reg_X
4. write_reg_Y
5. write_reg_MV_0
6. write_reg_MV_1
7. write_reg_gen_MV_X
8. write_reg_out_MV_Y
9. write_reg_count_block
10. rst_async_reg_coord_X
11. rst_async_reg_coord_Y
12. rst_async_reg_X
13. rst_async_reg_Y
14. rst_async_reg_MV_0
15. rst_async_reg_MV_1
16. rst_async_reg_gen_MV_X
17. rst_async_reg_out_MV_Y
18. rst_async_reg_count_block
19. sel_X
20. sel_Y
21. --> interp_X
22. --> interp_Y
23. --> ctrl_X
24. --> ctrl_Y