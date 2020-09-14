///@desc CreateDSList(ds_list)
///@arg ds_list
function CreateDSList(argument0) {

	if (!ds_exists(argument0, ds_type_list))
	{
		argument0 = ds_list_create();
	}


}
