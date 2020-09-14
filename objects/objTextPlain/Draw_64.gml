/// @description Draw Textbox
// You can write your code in this editor
//NineSliceBoxStretched(sprTextBoxBg, x1, y1, x2, y2, background);

DrawSetText(fText, fa_center, fa_top, c_black);

var _print = string_copy(message, 1, textProgress);

if (responses[0] != -1) && (textProgress >= string_length(message))
{
	for (var i = 0; i < array_length(responses); i++)
	{
		_print += "\n";
		if (i == responseSelected)
		{
			_print += "> ";
		}
		
		_print += responses[i];
		
		if (i == responseSelected)
		{
			_print += " <";
		}
	}
}

draw_text((x1 + x2) / 2, y1 + textTopBuffer, _print);
draw_set_color(c_white);
draw_text((x1 + x2) / 2, y1 + textTopBuffer - 1, _print);