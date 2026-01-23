#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
f=0.5
s=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c2=place_meeting(x,y+16,groundsemi)||guaranteedc2
if c2 superc2=(position_meeting(x,y+1+16,groundsemi))

c6=position_meeting(x+8+16,y+8+16,groundsemi)
if !c6 c6=position_meeting(x+8+16,y+8+16,nsloprs)
if !c6 c6=position_meeting(x+8+16,y+8+16,nslopr2s)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterterrain[biome],320+96*!c6,208,16,32,x+16,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],304+96*!c6,192,16,48,x,y-16,1,1,$FFFFFF,1)
