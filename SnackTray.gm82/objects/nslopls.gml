#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
s=1
f=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

getregion(x)


//Calm down, it's not worth it
//who asked you

c3=0
c3=position_meeting(x+16,y+16,groundsemi)
if !c3 c3=position_meeting(x+16,y+16,nslopls)
if !c3 c3=position_meeting(x+16,y+16,nslopl2s) 


c7=0
c7=position_meeting(x-16,y-16,groundsemi)
if !c7 c7=position_meeting(x-16,y-16,nslopls)
if !c7 c7=position_meeting(x-16,y-16,nslopl2s)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterterrain[biome],256+!c7*8,192,8*c7+c3*8,48,x,y-16,1,1,$FFFFFF,1)

if !c3 draw_background_part_ext(global.masterterrain[biome],256+8+96,192,8,48,x+8,y-16,1,1,$FFFFFF,1)

if !c7 draw_background_part_ext(global.masterterrain[biome],256+96,192,8,48,x,y-16,1,1,$FFFFFF,1)
