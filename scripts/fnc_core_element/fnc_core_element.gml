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
		
	}
	
	static method_draw = function() 
	{
		show_message("");
	}

	static method_destroy = function() // Initialize element destroy method
	{
		ds_list_delete(controller_system_element_controller.element_list, ds_list_find_index(controller_system_element_controller.element_list, self)); // Free element list from mommory
	}
}