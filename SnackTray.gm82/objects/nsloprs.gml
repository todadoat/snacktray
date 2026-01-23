#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=1
nslop=1
f=-1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savemask=mask_index
mask_index=sprite_index
getregion(x)
c2=place_meeting(x,y+24,groundsemi)||guaranteedc2
if c2 superc2=(place_meeting(x,y+24+16,groundsemi))

c1=0
c1=position_meeting(x-16,y+16,groundsemi)
if !c1 c1=position_meeting(x-16,y+16,nslopls)
if !c1 c1=position_meeting(x-16,y+16,nslopl2s)


c9=0
c9=position_meeting(x+16,y-16,groundsemi)
if !c9 c9=position_meeting(x+16,y-16,nslopls)
if !c9 c9=position_meeting(x+16,y-16,nslopl2s)

mask_index=savemask
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterterrain[biome],240+!c9*8,192,8*c9+c1*8,48,x,y-16,1,1,$FFFFFF,1)


if !c1 draw_background_part_ext(global.masterterrain[biome],240+96,192,8,48,x,y-16,1,1,$FFFFFF,1)
