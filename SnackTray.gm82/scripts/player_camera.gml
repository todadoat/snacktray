//camera movement code
var l,r,panl,panr,t,b,w,h,hw,bgl,bgr,i,memx,noy,cs;

if (settings("frameskip") && !fallbacky) {view_yview[p2]=viewy}

if ((gamemanager.debugcamlock || overwritecam || alarm[0]!=-1 || dead) || (piped && !argument[0] && !finish) || (finish && posed && !c)) {
    gamemanager.shake[p2]=0
    exit
}

i=id
w=global.screenwidth
h=global.screenheight
hw=w/2
noy=0
l=0
r=verybignumber
t=0
b=region.ky
shim=0
l=0

if (shim!=0) camspd=1
camspd=(camspd*24+(1.5+abs(hsp)+abs(hyperspeed)+abs(gm8exspd)+abs(x-(viewx+global.screenwidth))/16))/25
//if (camspd<2) cs=0 else
cs=camspd

camwallr=0
camwalll=0
camwallt=0

if (shim!=0) {
    panl=16*(sign(shim)=1)
    panr=-16*(sign(shim)=-1)
}





/*
if (diggity) {
    with (flag) if (passed[other.p2]) {l=max(other.viewx,min(endstagex,other.viewx)) r=min(r,flag.x+global.screenheight)}
    viewx=max(l,median(gamemanager.origin[p2],round(mean(x,xdig))-hw,gamemanager.righthand[p2]-w))
    exit
}
*/
if (argument[0]) {
    l=0 r=verybignumber memx=0
    t=0
    getregion(x)
    b=region.ky
    ygoto=y
    viewx=x-hw
    viewy=ygoto-(h/2+32)
    camcx=round(x)+hw
    camcy=viewy+h/2

   /*with (camsecret) event_user(1)

    with (camblock) with (other) if (collision_rectangle(viewx-8,viewy-4,viewx+w+8,viewy+h+4,other.id,0,0)) {
        if (camcy>=other.bbox_top && camcy<=other.bbox_bottom+1 && camcx<=other.x && other.left) r=other.bbox_left
        if (camcy>=other.bbox_top && camcy<=other.bbox_bottom+1 && camcx>=other.x && other.right) l=other.bbox_right+1
        if (camcx>=other.bbox_left && camcx<=other.bbox_right+1 && camcy<=other.y && other.top) b=other.bbox_top
        if (camcx>=other.bbox_left && camcx<=other.bbox_right+1 && camcy>=other.y && other.bottom) t=other.bbox_bottom+1
    }*/

} else memx=viewx
//save our current views.
prevviewx=viewx prevviewy=viewy

if (finish && !dead && ending="retainer") {
    viewx=inch(viewx,myretainer.x-hw,2)
} else {
    global.additivex=0
    global.counting=0
    with player if !dead && !(cpu_partner && !player_controlled ) {global.additivex+=x global.counting+=1 }

    if global.counting==0{
        //death. Truly saddening.
        //viewx=round(round(x)-hw)
        //if global.mplay<2 show_message("oh.")
    }else viewx=round(round(global.additivex/global.counting)-hw)
}

if (!jump || climb) ygoto=y+looky
else ygoto=min(y+looky+48,max(ygoto,y+looky))+min(8,8*(vsp/4)*(vsp>2 || vsp<0)*settings("camshimmie"))

viewy=(viewy*4+round(ygoto)-(h/2+32))/5

//background shenanigans
bgl=0 bgr=verybignumber r=verybignumber
with (regionmarker) {
    if (lefthand<other.x) {l=max(lefthand,l) if (l=lefthand && abs(panr)) r=l+w bgl=max(bgl,lefthand)}
    if (x>other.x) {r=min(x,r) if (r=x && panl) l=r-w bgr=min(bgr,x)}
}
gamemanager.origin[p2]=bgl
gamemanager.righthand[p2]=bgr
r=min(r,gamemanager.righthand[p2])

with (flag) if (passed[other.p2]) {endstagex=x l=min(endstagex,memx) r=max(bgl+global.screenwidth,min(r,x+global.screenheight))}
if (gamemanager.ratchet) l=max(l,memx)

camcx=viewx+hw
camcy=viewy+h/2



//Add these variables because if we get clamped on both left and right, we'll just reset it.
clamped_left=0
clamped_right=0
clamped_up=0
clamped_down=0
with camblock{
    
    if   rectangle_in_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,view_xview[other.p2]-2,view_yview[other.p2]-2,view_xview[other.p2]+view_wview[other.p2]+2,view_yview[other.p2]+2+view_hview[other.p2]){
        //Depending on where the camblock is from the middle of the screen, we clamp our screen left or right or up or down.
        
        
        
         if left   if x>other.camcx && other.viewx>(bbox_left-w) {clamped_right=1 other.viewx=bbox_left-w}
         if right   if x<=other.camcx {clamped_left=1 other.viewx=bbox_right}
        
        if bottom if y<=other.camcy {clamped_up=1 other.viewy=bbox_bottom}
        if top if y>other.camcy && other.viewy>(bbox_top-h)  {clamped_down=1 other.viewy=bbox_top-h}
        
    
    }
}
if clamped_left && clamped_right{
    viewx=prevviewx //cam stuck.
}
if clamped_up && clamped_down{
    viewy=prevviewy //cam stuck.
}


if abs(prevviewy-viewy)>max(abs(3*vsp),4) //dude, chill.
viewy=prevviewy+sign(viewy-prevviewy)*max(abs(3*vsp),4)
if abs(prevviewx-viewx)>max(abs(3*hsp),4)  //dude, chill.
viewx=prevviewx+sign(viewx-prevviewx)*max(abs(3*hsp),4)


//regionmarker  still exists.
viewx=median(l,viewx,r-w)
viewy=max(0,viewy)


if viewy+global.screenheight>region.ky viewy=region.ky-global.screenheight


with (flag) if (passed[other.p2] && issign) {other.viewx=view_xview[other.p2]}

//i cant believe youve done this
view_xview[p2]=viewx
if (!noy || argument[0]) view_yview[p2]=viewy
