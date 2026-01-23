#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (coll) if (coll.piped) {alarm[0]=30 exit}
coll=place_meeting(x,y,player)
if (coll) alarm[0]=30
else alarm[0]=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/



image_blend=$ff0000
if !lemonplaced{

image_xscale=16
image_yscale=9
if global.oldlemonbitmap

{
image_xscale=25
image_yscale=14
}

alarm[0]=2

top=!place_meeting(x,y-140,camsecret)
right=!place_meeting(x+125,y,camsecret)
left=!place_meeting(x-140,y,camsecret)
bottom=!place_meeting(x,y+140,camsecret)

}

else {
top=unreal(top,0)
left=unreal(left,0)
right=unreal(right,0)
bottom=unreal(bottom,0)


alarm[0]=1
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (coll) {
    y=-verybignumber
    with (camsecret) if (abs(x-other.x)=global.screenwidth || abs(ystart-other.ystart)=global.screenheight) {
        y=-verybignumber
        alarm[0]=2
    }
} else y=ystart
