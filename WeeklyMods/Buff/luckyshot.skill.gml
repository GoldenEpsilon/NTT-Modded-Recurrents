global.icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAADCUlEQVRIx6WWT0iTYRzHv+8ahBcPJaxCwkGU8pqDZLBDJM7DBonCoBZYxrwMXoZGh8BWsINDMDwk8ZaHDpqCb4ehUqCH6OKhi8EL2yEhJoiQYCJ68DL2dNh+j+/z/p32Pb17nr3fz/v8+f2RxtK9DHW9nf0OJ01NDMBLuzvHljFpLN3LyDiTigIAIuF2/od4QsFaQcVjRT0XSALAFptkPsCmewRzowh0Foi02CSzZKjEJzRdBpvusZiTwukulFeqDW3f7s4xpEoEzDyh6TJiZU0wJV3q9CF51wdt4xSyma/YQjhA02UMndRWUYnUJg+Xi9yYTC0fUoccFKsor1RtIdJik8yGTkpYUBXEEwrWg0kkQyUETiS09V/w3OuDYg3iCADAyByAAHBTc5s47wrY/1MEAOTGRxEJt+PRfO1KLg0rtoe9VlAxNvueQ462Gf7qDFMTA3jxalU4fGlBVVg8oSA3Porc5AzWCqonAABuxW7zZ6M5naH/Rx1QiYA964giNznDv44AjayCAMYLQpeGAw6Xi/wl40G7QYzRTcZmcyHQDpeLfJueh/oQO2oRIF7SdBmd70roGjkde5MfgDQcCDAyM25VIxBNr6UY0ZhZb9FwICCY2YGc5GbOAfSDQKT15n3LC/N7e/xZ/wgbc2N8sBqADoTusBlEaQQAMi8nAADXW68hdnHEBLAGpxQc9DFzFBqDhdT/8Al+/yohlc7wsYYA3Vk/o2RFuhyShHRQXqlygFFLoz+9t4gAR9vMMc9QKugI3UHf/QQf//a14AAxrYCyohOEAHarSD1oRezqqvM1JQAVDtoeY54xnwUAfPn8yVLRRFA90AhAVWozX7G9791Zv20tcErTwgqM1coM6c76XauZW8m0BTSUdwzmXqs4E0DbqPISeW/7BgBgTt9y7Syk4KCPORV1s/lmvoKnoZt8bE7f8uyRpOCgj5lbEruvpm0wl0Sv5ksA2IkivJFuzhaQSUVZJNyO1+sfBMOzNL2ureOCqjDqQ1uudJ7b0LH5pa6C9D8Qu/b9Hz5H2+g6G2kTAAAAAElFTkSuQmCC",1,12,16)
global.hud = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAAApklEQVQ4y9WTIRLCQAxF/z8JzNSjGHoHRBUoBDN1NbU9AxaD6wmqEByEC31EZ0I3ZDswqEbt7E9eskmWkvCPcRkAkomTJJoGQP7SB/sc5NufANS0HW7XS5h9DPZV0iBWQdN2KHfbxO18OuLZj+dNHUMoCSS1rw5YrYsE8jMAAB734esn2BQ8QBKnnY+amIwxV4EHfTZYNEAk5vZgqoeA3E4s+C/M2QtNS3Tpjb2IrAAAAABJRU5ErkJggg==",1,8,8)
skill_set_active(mut_lucky_shot, 0)
#define skill_name
	return "LUCKY SHOT";
	
#define skill_text
	return "SOME KILLS REGENERATE @yAMMO@s";

#define skill_button 
sprite_index = global.icon;

#define skill_icon
return global.hud;
	
#define skill_wepspec
	return 0;

#define skill_tip
	return "ammo everywhere";
	
#define skill_take
	sound_play(sndMutLuckyShot);
	
#define step
var justnow = GameCont.kills;
if fork(){
    wait 0
    if GameCont.kills>justnow and random(10)<1{
        with Player
            with instance_create(0,0,AmmoPickup){
                event_perform(4,0)
            }
    }
}