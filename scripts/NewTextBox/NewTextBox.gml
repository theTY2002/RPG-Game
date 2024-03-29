/// @arg message
/// @arg background
/// @arg response(s)
function NewTextBox() {

	var _obj;

	if (instance_exists(objText))
	{
		_obj = objTextQueued;
	}
	else
	{
		_obj = objText;
	}

	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		//Initial Text
		message = argument[0];
		if (instance_exists(other))
		{
			originInstance = other.id;
		}
		else
		{
			originInstance = noone;
		}
	
		//Background
		if (argument_count > 1)
		{
			background = argument[1];
		}
		else
		{
			background = 1;
		}
	
		//Responses
		if (argument_count > 2)
		{
			responses = argument[2];
			//Trim markers
			for (var i = 0; i < array_length(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}

	with (objPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}


}
