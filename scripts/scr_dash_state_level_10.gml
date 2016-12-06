
d = global.dir
player_x = 0;
player_y = 0;
if (instance_exists(obj_player)){
    player_x = obj_player.phy_position_x;
    player_y = obj_player.phy_position_y;
    
    // check if you are going to hit the trap
    
    
   

    // dash
    
    
    if (obj_player.sprite_index == spr_female_right and !place_meeting(
    obj_player.phy_position_x + 240, obj_player.phy_position_y, obj_block_wall))
    {
        obj_player.phy_position_x += 320;
        player_x = obj_player.phy_position_x;
    }
     
    if (obj_player.sprite_index == spr_female_left and !place_meeting(
    obj_player.phy_position_x - 240, obj_player.phy_position_y, obj_block_wall))
    {
        obj_player.phy_position_x -= 320;
       
        
    }   
    if (obj_player.sprite_index == spr_female_up and !place_meeting(
    obj_player.phy_position_x, obj_player.phy_position_y - 240, obj_block_wall))
    {
        obj_player.phy_position_y -= 320;
    }   
    if (obj_player.sprite_index == spr_female_down and !place_meeting(
    obj_player.phy_position_x, obj_player.phy_position_y + 300, obj_block_wall))
    {
        
        obj_player.phy_position_y += 320;
        
    }
   
    
    if (instance_exists(obj_controller_level_10.trap_10_1)){
      
        safe_position_x1 = obj_controller_level_10.trap_10_1.phy_position_x - 90;
        safe_position_x2 = obj_controller_level_10.trap_10_1.phy_position_x + 90;
        safe_position_y1 = obj_controller_level_10.trap_10_1.phy_position_y + 90;
        safe_position_y2 = obj_controller_level_10.trap_10_1.phy_position_y - 90;

        if (obj_player.phy_position_x < safe_position_x2 and obj_player.phy_position_x > safe_position_x1)
        and  (obj_player.phy_position_y < safe_position_y1 and obj_player.phy_position_y > safe_position_y2)
        {
            
            with (obj_player)
            {
                instance_destroy();
            }
            room_restart();
            instance_create(420, 480, obj_player);
            obj_player.visible = true;
        }
    }                       
   
    obj_player.state = scr_move_state; 
    
    var dash = instance_create(obj_player.x,obj_player.y,obj_dash_effect);
    dash.sprite_index = obj_player.sprite_index;

   
    

}

