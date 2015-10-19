/// pl_light_init(radius, colour, alpha)

// Set light properties
_pl_radius = argument0;
_pl_baseRadius = argument0;
_pl_color = argument1;
_pl_alpha = argument2;

// Setup the individual light surface
_pl_lightSurface = surface_create(_pl_radius * 2, _pl_radius * 2);
