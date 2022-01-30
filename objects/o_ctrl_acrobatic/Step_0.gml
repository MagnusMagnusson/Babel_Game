	
var cameraMoveSpeed = 1.25;
var cam = view_camera[0];
var camY = camera_get_view_y(cam);
	
if(camY > -64 * (score)){
	camera_set_view_pos(cam, 0, camY - cameraMoveSpeed);
}