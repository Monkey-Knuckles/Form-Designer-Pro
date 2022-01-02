//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//																				TOGGLE ELEMENT																		//
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function toggle_element(_sprite, _index, _x, _y, _x_offset, _y_offset, _x_scale, _y_scale, _angle, _alpha) : core_element() constructor
{
	// PASS IN VARIABLES 
	
	sprite_index = _sprite;
	image_index = _index;
	
	x = _x;
	y = _y;
	
	image_xscale = _x_scale;
	image_yscale = _y_scale;
	
	sprite_width = sprite_get_width(sprite_index) * image_xscale;
	sprite_height = sprite_get_height(sprite_index) * image_yscale;
	
	sprite_xoffset = _x_offset;
	sprite_yoffset = _y_offset;
	
	image_angle = _angle;
	image_alpha = _alpha;
	
	// DRAW ELEMENT
	
	static method_draw = function() 
	{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	}
}