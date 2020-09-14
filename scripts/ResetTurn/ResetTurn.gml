///@desc ResetTurn(ds_list)
///@arg ds_list
function ResetTurn(argument0) {

	NewTextBox(argument0[| 0], 4);
	if (ds_exists(argument0, ds_type_list) && ds_list_size(argument0) > 1)
	{
		NewTextBox(argument0[| 1], 4);
	}
	messageTimer = 60;
			
	DestroyDSList(argument0);


}
