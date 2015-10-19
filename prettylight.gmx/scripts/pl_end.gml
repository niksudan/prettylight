/// pl_end()

surface_free(_pl_lightmap);
surface_free(_pl_blurmap);

for (var i = 0; i < ds_list_size(_pl_lightObjects); i++) {
    with (ds_list_find_value(_pl_lightObjects , i)) {
        pl_light_destroy();
    }
}
