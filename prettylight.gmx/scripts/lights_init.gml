/// light_init()

/** 
 * Initialises the lighting system
 * Preferably called in a creation or trigger event
 * Requires a view to be set
 *
 * @author Nik
 * @author xygthop3
 */

// Options
lights_set_ambience( c_black, 1 );
lights_set_vivid( true );
lights_set_blur( true );
lights_set_blur_alpha( 0.25 );
lights_set_blur_amount( 3 );
 
// Initialise surfaces
draw_set_color(c_white);
lights = surface_create( view_wview[0], view_hview[0] );
blurring = surface_create( view_wview[0], view_hview[0] );
result = surface_create( view_wview[0], view_hview[0] );

// Configure light alpha
var s1 = sprite_duplicate( sprLight );
var s2 = sprite_duplicate( sprLight );
sprite_set_alpha_from_sprite( s1, s2 );

// Initialise gaussian blur shader
uni_resolution_hoz = shader_get_uniform( shd_gaussian_horizontal, "resolution" );
uni_resolution_vert = shader_get_uniform( shd_gaussian_vertical, "resolution" );
var_resolution_x = view_wview[0] / bov;
var_resolution_y = view_hview[0] / bov;
shader_enabled = true;
