/// pl_light_update()

// Prepare the light surface
if (!surface_exists(_pl_lightSurface)) {
    _pl_lightSurface = surface_create(_pl_baseRadius * 2, _pl_baseRadius * 2);
}
surface_set_target(_pl_lightSurface);

    draw_clear(c_black);
    
    // Draw light
    draw_set_alpha(_pl_alpha);
    draw_circle_color(_pl_baseRadius, _pl_baseRadius, _pl_radius, _pl_color, c_black, false);
    
    // Reset
    draw_set_alpha(1);
    draw_set_color(c_black);

// Reset
surface_reset_target();
