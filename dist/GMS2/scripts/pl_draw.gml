/// @description  Render lights in the draw event
/// @function  pl_draw

var cam = view_get_camera(0);

// Draw vivid lightmap
if (_pl_vivid) {
    gpu_set_blendmode(bm_add);
    draw_surface_ext(_pl_lightmap, camera_get_view_x(cam), camera_get_view_y(cam), 1, 1, 0, c_white, 0.1);
}

// Draw standard lightmap
gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
draw_surface(_pl_lightmap, camera_get_view_x(cam), camera_get_view_y(cam));
gpu_set_blendmode(bm_normal);
