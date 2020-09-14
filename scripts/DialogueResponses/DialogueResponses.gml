/// @arg response
function DialogueResponses(argument0) {

	switch(argument0)
	{
		case 0:
			break;
		case 1:
			NewTextBox("You gave response A!", 1);
			break;
		case 2:
			NewTextBox("You gave response B! Any further response?", 1, ["3:Yes!", "0:No."]);
			break;
		case 3:
			NewTextBox("Thanks for your responses!", 1);
			break;
		case 4:
			if (global.iLifted != objHat.id)
			{
				NewTextBox("Have you seen my hat?", 1);
			}
			else
			{
				NewTextBox("Thank you for getting my hat back!", 1);
				global.hatQuest = true;
			}
			
		default:
			show_debug_message("THIS SHOULD NOT APPEAR");
			break;
	}


}
