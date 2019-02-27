#define init

sprite_replace(sprFloor7, "sprFloor7_grey.png", 8, 0, 0)
sprite_replace(sprFloor7B, "sprFloor7B_grey.png", 4, 0, 0)
sprite_replace(sprFloor7Explo, "sprFloor7Explo_grey.png", 4, 1, 1)
sprite_replace(sprWall7Trans, "sprWall7Trans_grey.png", 8, 0, 0)
sprite_replace(sprWall7Out, "sprWall7Out_grey.png", 1, 0, 0)
sprite_replace(sprWall7Bot, "sprWall7Bot_grey.png", 8, 0, 0)
sprite_replace(sprDebris7, "sprDebris7_grey.png", 7, 0, 0)
sprite_replace(sprWall7Top, "sprWall7Top_grey.png", 8, 0, 0)

global.gce = -1;
#define step

if GameCont.area = 7{
    background_color = make_color_hsv((30*GameCont.loops),150,50);
}

if GameCont.area = 7{
    var col = make_color_hsv((30*GameCont.loops),150,250)
        
    if GameCont.area = 105{
        col = make_color_rgb(100,100,155);
        with instances_matching_ne(hitme,"proc",1){
            image_blend = make_color_rgb(140,140,140);
            proc = 1;
        }
    }
    with instances_matching([Wall,Top,TopSmall,Floor],"proc",undefined){
        image_blend = col;
        proc = 1;
    }
}
