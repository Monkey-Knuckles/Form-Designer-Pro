/// @description Controller struct

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//																			CONTROLLER STRUCT																		//
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function element_controller() constructor // Initialize element controller
{
	global.element_controller = self; // Store element controller data
	
	element_list = ds_list_create(); // Generate element list
	
	// EXECUTE STEP CODE FOR ALL ELEMENTS IN LIST
	
	static method_step = function() // Initialize element step method
	{
		var _count = ds_list_size(element_list); // Get number of elements in list
		for(var i = 0; i < _count; i++) element_list[| i].method_step(); // Loop through all elements in list
	}
	
	// EXECUTE DRAW CODE FOR ALL ELEMENTS IN LIST
	
	static method_draw = function() // Initialize element draw method
	{
		for(var i = ds_list_size(element_list)-1; i>=0; i--) // Loop through all elements in list
		{
			element_list[| i].method_draw(); // Execute draw method for selected element
		}
	}
	
	// EXECUTE DESTROY CODE FOR ALL ELEMENTS IN LIST
	
	static method_destroy = function() // Initialize element destroy method
	{
		for(var i = ds_list_size(element_list)-1; i>=0; i--) // Loop through all elements in list
		element_list[| i].method_destroy(); // Execute destroy method for selected element
		
		ds_list_destroy(element_list); // Free element list from memmory
		
		delete global.element_controller; // Delete element controller
		global.element_controller = undefined; // Clear element controller data
	}
}