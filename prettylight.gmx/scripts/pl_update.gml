/// pl_update()

// Update lights
for (var i = 0; i < ds_list_size(_pl_lightObjects); i++) {
    with (ds_list_find_value(_pl_lightObjects , i)) {
        pl_light_update();
    }
}

// Prepare lightmap
if (!surface_exists(_pl_lightmap)) {
    _pl_lightmap = surface_create(view_wview[0], view_hview[0]);
}

surface_set_target(_pl_lightmap);

    // Draw ambience
    draw_clear(c_black);
    draw_set_alpha(_pl_ambientBrightness);
    draw_set_color(_pl_ambientColor);
    draw_rectangle(0, 0, surface_get_width(_pl_lightmap), surface_get_height(_pl_lightmap), false);
    
    // Draw lights
    draw_set_alpha(1);
    draw_set_blend_mode(bm_add);
    for (var i = 0; i < ds_list_size(_pl_lightObjects); i++) {
        with (ds_list_find_value(_pl_lightObjects , i)) {
            pl_light_draw();
        }
    }

// Reset
surface_reset_target();
draw_set_colour(c_white);
draw_set_blend_mode(bm_normal);

if (_pl_blurring) {

    // Prepare blurmap
    if (!surface_exists(_pl_blurmap)) {
        _pl_blurmap = surface_create(view_wview[0], view_hview[0]);
    }
    
    surface_set_target(_pl_blurmap);
    
        // Draw blur
        draw_clear(c_black);
        draw_set_blend_mode(bm_add);
        
        shader_set(pl_shd_gaussian_horizontal);
        shader_set_uniform_f(_pl_uni_resolution_hoz, _pl_var_resolution_x, _pl_var_resolution_y);
        draw_surface(_pl_lightmap, 0, 0);
        shader_reset();
    
    surface_reset_target();
    
    surface_set_target(_pl_lightmap);
    
        draw_clear(c_black);
    
        shader_set(pl_shd_gaussian_vertical);
        shader_set_uniform_f(_pl_uni_resolution_vert, _pl_var_resolution_x, _pl_var_resolution_y);
        draw_surface(_pl_blurmap, 0, 0);
        shader_reset();

    // Reset
    surface_reset_target();
    draw_set_colour(c_white);
    draw_set_blend_mode(bm_normal);
}
