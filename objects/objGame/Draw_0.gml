/// @description Insert description here
// You can write your code in this editor
/*
//Count the number of depth objects
var num_instances = instance_number(objDepthObject);

//Create the grid
var ds_depth_grid = ds_grid_create(2, num_instances);

//Fill the grid
for (var i = 0; i < num_instances; i++){
var inst = instance_find(objDepthObject, i);
ds_grid_set(ds_depth_grid, 0, i, inst);
ds_grid_set(ds_depth_grid, 1, i, inst.y);
}

ds_grid_sort(ds_depth_grid, 1, true);

for (var i = 0; i < num_instances; i++){
var inst = ds_grid_get(ds_depth_grid, 0, i);
with (inst){
draw_self();
}
}

ds_grid_destroy(ds_depth_grid);

*/
//draw_set_color(c_aqua);
//var tempColour = merge_color(make_color_rgb(132, 240, 200), make_color_rgb(50, 230, 162), );
draw_sprite_ext(sprSlimeBlank, 0, 50, 50, 1, 1, 0, make_color_rgb(50, 230, 162), 1);
//draw_sprite(sprSlimeBlank, 0, 50, 50);
//draw_set_color(c_white);