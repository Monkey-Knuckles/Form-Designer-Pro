//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//																				TOGGLE ELEMENT																		//
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function toggle_element(_sprite, _x, _y, _checked) : core_element() constructor
{
	// PASS IN VARIABLES 
	
	sprite_index = _sprite;
	
	x = _x;
	y = _y;
	
	checked = _checked;
	
	// DRAW ELEMENT
	
	static method_draw = function() 
	{
		draw_sprite(sprite_index, checked, x, y);
	}
}