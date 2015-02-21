/// lights_step()

/**
 * Processes the light system
 * Preferably called in a step event
 *
 * @author Fatalsleep
 * @author Nik
 */
 
// Catch surface errors
if ( !surface_exists( lights ) ) {
    lights = surface_create( view_wview[0], view_hview[0] );
}
if ( !surface_exists( blurring ) ) {
    blurring = surface_create( view_wview[0], view_hview[0] );
} 
if ( !surface_exists( result ) ) {
    result = surface_create( view_wview[0], view_hview[0] );
}

// Process the lights
surface_set_target( lights );
draw_clear_alpha( alc, ala );
draw_set_blend_mode( bm_add );
with ( objLight ) {
    draw_sprite_ext( ls , li , -view_xview + x + xo , -view_yview + y + yo , xs , ys , rs , cs , as );
}

// Reset
draw_set_blend_mode( bm_normal );
surface_reset_target();
