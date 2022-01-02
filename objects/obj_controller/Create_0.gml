/// @description Controller struct

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//																			CONTROLLER STRUCT														                //
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

controller_system_element_controller = new element_controller(); // Generate new element controller

toggle_example_0 = new toggle_element(spr_checkbox, 0, 32, 32, 0, 0, 1, 1, 0, 1);
toggle_example_1 = new toggle_element(spr_checkbox, 0, 128, 32, 0, 0, 1, 1, 0, 1);

controller_settings_handle_padding = 4;

enum CONST_HANDLE
{
	DEFAULT,
	ACTIVE,
	MOVE,
	HORIZONTAL,
	VERTICAL,
	DIAGONAL,
}

global.controller_system_id = -1;
controller_system_selected_handle = CONST_HANDLE.DEFAULT;

controller_settings_snap_value = 4;

controller_system_keep_aspect = true;