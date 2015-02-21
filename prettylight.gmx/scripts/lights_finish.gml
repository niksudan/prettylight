///lights_finish()

/**
 * Ends the light system
 * Preferably called on Room End or Game End
 *
 * @author Nik
 */
 
surface_free( lights );
surface_free( blurring );
surface_free( result );
ds_list_destroy( light_list );
