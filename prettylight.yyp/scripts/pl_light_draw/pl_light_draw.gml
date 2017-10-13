/// @description  Draw the light [Needs clarification in docs]
/// @function  pl_light_draw

var cam = view_get_camera(0);

// Draw light
draw_surface(_pl_lightSurface, x - _pl_baseRadius - camera_get_view_x(cam), y - _pl_baseRadius - camera_get_view_y(cam));
