/// @description  Add light object(s) to a prettylight system
/// @function  pl_add
/// @param obj1
/// @param  obj2
/// @param  ...

for (var i = 0; i < argument_count; i++) {
    ds_list_add(_pl_lightObjects, argument[i]);
}
