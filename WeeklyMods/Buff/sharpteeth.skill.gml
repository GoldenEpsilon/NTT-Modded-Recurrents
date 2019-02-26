global.icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAC8klEQVRIx5WWv0sbYRjHPxcOx9CeJ4QsudVUCiWCi4KI4NXROQ5dbREHlxIHh4iLgwSaf0Bnl4JcQUSIg4IilFbXuBTRM0PGEHId0ufNe5e7S/pdkvvxfD/v+97zvO9j5CwrICIrm+W+2aRUMQHYuu6yUs0D8HrZYXrbp1Qxud3rUnQcFddqt6NWGDrAymbVAwHcLnQp1DJ4SxaT8xMAfPz+DDAEiAMpgG6uQ/CgUMtQ7fRYqeZ5vezgnrd4PO1xtAzrZ6RCjJxlBYnmAB6UGiZb111mXRv3vAWgANCH6BJgq90eBoixrLG+TPaHDAD+XU8BZl0bgOltn8JqhsfTXhhQdJxgyHihq4CFWobHzZ76FZUa/QE8HNjKXGamL5lRdJxA/6BRJQGiIBm9vkT3zSYGECSZjyuB6B9dEsQoVcwgybzUCIOj19F3t667gw/+L/uMUsUM/Lte7PR10zRzSYDbvW7I3FuyMAqrmSDJfFxACKIV5o3njwcQjQPw73rKfKWaxzhaJlg/o58FMSA9MOm5XnQAh3Mmx2/f9GfwfJUPfuz8UR+nsDqYahKg1DBVsQEcLRPaDGX0AMbDga02uxvPD5W9wES6qRhLJYsm5ycUZGcig+E//QoAXo4XQy+N0utlR/2fKl/gndQpb9R5OLDVYA/nzAHAO6njrm2EQKMkxu7aBuKhQ6a3/T7AO6kDqBdFenDctdzTY+3cTBjw5dNSsLtfY/frJrv7tcTApHsSJ78CkO+plkgHRIOSzKJxdm6G56u8OlaLjtPPoqnyxX+Zxt1/OV5UySFpX3Scfh1IVnz7/T5kkgaQZ5/f/QxlnT56YACIpt9U+WIIIpJMi6Zz1BzobxWzrh2b+3qup9WIFFZcA2AAgV6V4xRZnLF+koUA0TM5aQvQFd1S4oyHAHEtS9pelGY61Nkl9UXSOupK6ubiFNsXRdvGpAN+HIgCxPWleCmR7uglCrWOcV112vE4ahaxza/oqdVKH33KLOLa979zUS9OaZkXhgAAAABJRU5ErkJggg==",1,12,16)
global.hud = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAABN0lEQVQ4y62TsUoDQRRFz2ssbI1B/IOAIhZiikQkEMgPBIv4DVbbWCSEpLDZSuxtTCH5gUBgEZNCSREkgfxBCHFtLWye1RsyZHex8DW7s9x75s5wV1SVtBERBVBVSdWkAUREh9EIgGqlnAr5f4DFbnZCLkrnALyO3+m2ApKO4wFERGv1BgBnx6ceeDKbAjDo9zyIA5jZjJPZNPV9EyKAi1CrNxj0ezQ7obermbutwGlcAkCH0YiT3SsA8sUlm0CLbbN+OwTg4/uZaqXsA77GP+yVdsga03gAI+eLSxZhLhNQCGKn9e7APsarOQDt2xvad/fOaOvcwZEPUFVERBdhjkIQE6/mTpz0fHiMMK2qigMALv7+9cvWzgCfT5fuGFYqrwdmSrsHM242cquJ/GESm5j0P2QZbX4BSknM6845Q+EAAAAASUVORK5CYII=",1,8,8)
skill_set_active(24, 0)
#define skill_name
	return "SHARP TEETH";
	
#define skill_text
	return "@sdamage @wtaken@w is dealt to#all @senemies @one screen";

#define skill_button 
sprite_index = global.icon;

#define skill_icon
return global.hud;
	
#define skill_wepspec
	return 0;

#define skill_tip
	return "eye for an eye";
	
#define skill_take
	sound_play(sndMutSharpTeeth);
	
#define step

with Player if my_health !=(lsthealth) 
    with enemy if point_in_rectangle(x,y,view_xview[other.index],view_yview[other.index],view_xview[other.index]+game_width,view_yview[other.index]+game_height) 
    and !place_meeting(x,y,RobotEat){
        my_health -= max(round(((other.lsthealth-other.my_health)/other.maxhealth)*maxhealth),2);
        if "canfly" in self and canfly and my_health <=0
            my_health = 1
        with instance_create(x,y,RobotEat)
            sprite_index = sprSharpTeeth
    }