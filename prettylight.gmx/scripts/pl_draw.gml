/// pl_draw()

// Draw vivid lightmap
if (_pl_vivid) {
    draw_set_blend_mode(bm_add);
    draw_surface_ext(_pl_lightmap, view_xview[0], view_yview[0], 1, 1, 0, c_white, 0.1);
}
    
// Draw standard lightmap
draw_set_blend_mode_ext(bm_dest_color, bm_src_color);
draw_surface(_pl_lightmap, view_xview[0], view_yview[0]);
draw_set_blend_mode(bm_normal);
