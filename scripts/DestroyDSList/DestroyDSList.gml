///@desc DestroyDSList(ds_list)
///@arg ds_list
function DestroyDSList(argument0) {

	if (ds_exists(argument0, ds_type_list))
	{
		ds_list_destroy(argument0);
	}


}
