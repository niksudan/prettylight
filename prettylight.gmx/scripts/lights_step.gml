///lights_step( view_id )

/**
 * Processes the light system
 * Preferably called in a step event
 *
 * @author FatalSleep
 * @author Nik
 */
 
// Catch surface errors
if ( !surface_exists( lights ) ) {
    lights = surface_create( view_wview[global.light_view_id], view_hview[global.light_view_id] );
}
if ( !surface_exists( blurring ) ) {
    blurring = surface_create( view_wview[global.light_view_id], view_hview[global.light_view_id] );
} 
if ( !surface_exists( result ) ) {
    result = surface_create( view_wview[global.light_view_id], view_hview[global.light_view_id] );
}
