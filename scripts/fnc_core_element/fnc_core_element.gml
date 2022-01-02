/// @description Core element struct

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//																			CORE ELEMENT STRUCT																		//
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function core_element() constructor // Initialize core element constructor
{
	controller_system_element_controller = global.element_controller; // Store element controller data
	
	ds_list_add(controller_system_element_controller.element_list, self); // Add element to list

	static method_step = function() 
	{
		var _padding = obj_controller.controller_settings_handle_padding;
		var _snap_value = obj_controller.controller_settings_snap_value;
		
		var _sprite_width = sprite_width * image_xscale;
		var _sprite_height = sprite_height * image_yscale;
		
		// SET HANDLE BOUNDRIES
		
		var _handle_move_x1 = x - _padding;
		var _handle_move_y1 = y - _padding;
		var _handle_move_x2 = x + _padding;
		var _handle_move_y2 = y + _padding;
		
		_handle_move_x1 = clamp(_handle_move_x1, 0, room_width);
		_handle_move_y1 = clamp(_handle_move_y1, 0, room_height);
		
		var _handle_active_x1 = x + _padding;
		var _handle_active_y1 = y + _padding;
		var _handle_active_x2 = x - _padding + _sprite_width;
		var _handle_active_y2 = y - _padding + _sprite_height;
		
		var _handle_all_x1 = x + _padding;
		var _handle_all_y1 = y + _padding;
		var _handle_all_x2 = x - _padding + _sprite_width;
		var _handle_all_y2 = y - _padding + _sprite_height;
		
		var _handle_horizontal_x1 = x - _padding + _sprite_width;
		var _handle_horizontal_y1 = y + _padding;
		var _handle_horizontal_x2 = x + _padding + _sprite_width;
		var _handle_horizontal_y2 = y - _padding + _sprite_height;
		
		var _handle_vertical_x1 = x + _padding;
		var _handle_vertical_y1 = y - _padding + _sprite_height;
		var _handle_vertical_x2 = x - _padding + _sprite_width;
		var _handle_vertical_y2 = y + _padding + _sprite_height;
		
		var _handle_diagonal_x1 = x - _padding + _sprite_width;
		var _handle_diagonal_y1 = y - _padding + _sprite_height;
		var _handle_diagonal_x2 = x + _padding + _sprite_width;
		var _handle_diagonal_y2 = y + _padding + _sprite_height;
		
		// APPLY HANDLES
		
		if !mouse_check_button(mb_left)
		{
			if global.controller_system_id == self
			{
				controller_system_selected_handle = CONST_HANDLE.DEFAULT;
				window_set_cursor(cr_arrow);
			}
			
			if point_in_rectangle(mouse_x, mouse_y, _handle_all_x1, _handle_all_y1, _handle_all_x2, _handle_all_y2)
			{
				global.controller_system_id = self;
			}
		
			if point_in_rectangle(mouse_x, mouse_y, _handle_move_x1, _handle_move_y1, _handle_move_x2, _handle_move_y2)
			{
				controller_system_selected_handle = CONST_HANDLE.MOVE;
				window_set_cursor(cr_size_all);
			}
		
			if point_in_rectangle(mouse_x, mouse_y, _handle_active_x1, _handle_active_y1, _handle_active_x2, _handle_active_y2)
			{
				controller_system_selected_handle = CONST_HANDLE.ACTIVE;
				window_set_cursor(cr_handpoint);
			}
		
			if point_in_rectangle(mouse_x, mouse_y, _handle_horizontal_x1, _handle_horizontal_y1, _handle_horizontal_x2, _handle_horizontal_y2)
			{
				controller_system_selected_handle = CONST_HANDLE.HORIZONTAL;
				window_set_cursor(cr_size_we);
			}
		
			if point_in_rectangle(mouse_x, mouse_y, _handle_vertical_x1, _handle_vertical_y1, _handle_vertical_x2, _handle_vertical_y2)
			{
				controller_system_selected_handle = CONST_HANDLE.VERTICAL;				
				window_set_cursor(cr_size_ns);
			}
				
			if point_in_rectangle(mouse_x, mouse_y, _handle_diagonal_x1, _handle_diagonal_y1, _handle_diagonal_x2, _handle_diagonal_y2)
			{
				controller_system_selected_handle = CONST_HANDLE.DIAGONAL;
				window_set_cursor(cr_size_nwse);
			}
		}
		
		// EXECUTE HANDLE BEHAVIER
		
		if mouse_check_button(mb_left)
		{
			if global.controller_system_id == self
			{
				switch (controller_system_selected_handle)
				{
					case CONST_HANDLE.MOVE:
					
						x = round(mouse_x / _snap_value) * _snap_value;
						y = round(mouse_y / _snap_value) * _snap_value;
			
					break;
			
					case CONST_HANDLE.ACTIVE:
					
					if mouse_check_button_pressed(mb_left)
					{
						image_index = !image_index;
					}
					
					break;
			
					case CONST_HANDLE.HORIZONTAL:
					
						image_xscale = (mouse_x - x) / sprite_width;
						
			
					break;
			
					case CONST_HANDLE.VERTICAL:
			
						image_yscale = (mouse_y - y) / sprite_height;
			
					break;
			
					case CONST_HANDLE.DIAGONAL:
			
						image_xscale = (mouse_x - x) / sprite_width;
						image_yscale = (mouse_y - y) / sprite_height;
						
						
			
					break;
				}
			}
		}
	}

	static method_destroy = function() // Initialize element destroy method
	{
		ds_list_delete(controller_system_element_controller.element_list, ds_list_find_index(controller_system_element_controller.element_list, self)); // Free element list from mommory
	}
}