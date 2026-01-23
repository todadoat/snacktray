#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lemonplaced {
top=unreal(top,0)
left=unreal(left,0)
right=unreal(right,0)
bottom=unreal(bottom,0)


exit}

top=!position_meeting(x+125,y-70,camblock)
bottom=!place_meeting(x+125,y+140,camblock)
left=!place_meeting(x-125,y+70,camblock)
right=!place_meeting(x+(750/2)/2,y+70,camblock)  //screensize (500) +screensize/2   then divided by 2... why? Well, whatever.


//quickly realizing this is all stupid and unnecessary. what if i just...

top=1
right=1
bottom=1
left=1

//gonna leave this as a test for now. I gotta fix up this whole thing to work on a per block basis level anyway!!

image_blend=$ff


image_xscale=16
image_yscale=9


if global.oldlemonbitmap

{
image_xscale=25
image_yscale=14
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if top draw_sprite(sprite_index,1,x,y)
if right draw_sprite(sprite_index,2,x,y)
if bottom draw_sprite(sprite_index,3,x,y)
if left draw_sprite(sprite_index,4,x,y)
