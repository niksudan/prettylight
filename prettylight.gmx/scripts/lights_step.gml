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
