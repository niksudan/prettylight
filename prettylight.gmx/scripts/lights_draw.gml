/// lights_draw()

/**
 * Draws the lighting system
 * Preferably called in a Draw GUI event
 *
 * @author Fatalsleep
 * @author xygthop3
 * @author Nik
 */

// Process the lights
surface_set_target( lights );
draw_clear_alpha( alc, ala );
draw_set_blend_mode( bm_add );
with ( objLight ) {
    draw_sprite_ext( ls , li , -view_xview + x + xo , -view_yview + y + yo , xs , ys , rs , cs , as );
}
draw_set_blend_mode( bm_normal );
surface_reset_target();
 
draw_set_alpha( 1 );

// Make lights more vivid if necessary
if ( lv ) {
    draw_set_blend_mode( bm_add );
    draw_surface_ext( lights, 0, 0, 1, 1, 0, c_white, 0.5 );
}

// Draw lights
draw_set_blend_mode_ext( bm_dest_color, bm_src_color );
draw_surface( lights, 0, 0 );
draw_set_blend_mode( bm_normal );

// Process the blurring
if ( ab ) {
    
    // We grab the application surface and blur it horizontally
    surface_set_target( blurring );
    if ( shader_enabled ) {
        shader_set( shd_gaussian_horizontal );
    }
    shader_set_uniform_f( uni_resolution_hoz, var_resolution_x, var_resolution_y );
    draw_surface( application_surface, 0, 0 );
    shader_reset();
    surface_reset_target();
    
    // Now we grab that result and blur it vertically
    surface_set_target( result );
    if ( shader_enabled ) {
        shader_set( shd_gaussian_vertical );
    }
    shader_set_uniform_f( uni_resolution_vert, var_resolution_x, var_resolution_y );
    draw_surface( blurring, 0, 0 );
    shader_reset();
    surface_reset_target();
    
    // Overlay the blur on top
    draw_surface_ext( result , 0, 0, 1, 1, 0, c_white, boa );
    
}
