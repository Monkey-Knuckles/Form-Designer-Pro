//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                  //
//																				 STARTUP CODE														                //
//                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*********************************************************************************************************************************************************************
*																				BASIC SETTINGS																		 *
*********************************************************************************************************************************************************************/

window_set_caption( game_display_name + " " + GM_version ); // Set window caption text to project name plus version number

/*********************************************************************************************************************************************************************
*																				LOAD OBJECTS																		 *
*********************************************************************************************************************************************************************/

instance_create_layer(256, 256, "lyr_gui", obj_controller); // Load example object