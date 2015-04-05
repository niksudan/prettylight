///lights_init( shaders? , view_id )

/** 
 * Initialises the lighting system
 * Preferably called in a creation or trigger event
 * Requires a view to be set
 *
 * @author Nik
 * @author xygthop3
 * @author FatalSleep
 */

// Options
lights_set_ambience( c_black, 1 );
lights_set_vivid( true );
lights_set_blur( true );
lights_set_blur_alpha( 0.25 );
lights_set_blur_amount( 3 );
 
// Initialise surfaces
draw_set_color(c_white);
global.light_view_id = argument[1];
lights = surface_create( view_wport[global.light_view_id], view_hport[global.light_view_id] );
blurring = surface_create( view_wport[global.light_view_id], view_hport[global.light_view_id] );
result = surface_create( view_wport[global.light_view_id], view_hport[global.light_view_id] );

// Configure light alpha
var s1 = sprite_duplicate( sprLight );
var s2 = sprite_duplicate( sprLight );
sprite_set_alpha_from_sprite( s1, s2 );

// Initialise gaussian blur shader
uni_resolution_hoz = shader_get_uniform( shd_gaussian_horizontal, "resolution" );
uni_resolution_vert = shader_get_uniform( shd_gaussian_vertical, "resolution" );
var_resolution_x = view_wport[global.light_view_id] / bov;
var_resolution_y = view_hport[global.light_view_id] / bov;
shader_enabled = argument[0];

// Initialize light list
light_list = ds_list_create();
