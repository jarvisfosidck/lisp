

import fileinput, os, string, re

def html_page (filename, previous, next, img):
    file = open(filename, "w")
    file.write("""<HTML><!-- #BeginTemplate "/Templates/index_empty.dwt" -->
<HEAD>
<SCRIPT>
<!--
function get_wd(img, la) {
var im=document.getElementById(img);
var la=document.getElementById(la);
la.style.width=im.width
la.style.height=im.height
  var selectedPosX = 0;
  var selectedPosY = 0;
while(im != null){
	  selectedPosX += im.offsetLeft;
    selectedPosY += im.offsetTop;
    im = im.offsetParent;
  }
la.style.left=selectedPosX
la.style.top=selectedPosY
}
function setfadezero(thing) {
var fade = document.getElementById(thing);
if (/Safari/.test(navigator.userAgent)) {
    var fadecnt = fade.style.Opacity;
		fade.style.Opacity = 0;
} else if (navigator.appName.indexOf("Microsoft")!= -1 
  &&parseInt(navigator.appVersion)>=4) {
	  var fadecnt = fade.filters.alpha.opacity;
    fade.filters.alpha.opacity = 0;
} else if (/Firefox/.test(navigator.userAgent)) {
    var fadecnt = fade.style.MozOpacity;
		fade.style.MozOpacity = 0;
		} else {
		var fadecnt = fade.style.Opacity;
		fade.style.Opacity = 0;
		}
}
function fadeoutOnce(thing) {
var cnt = 1;
var fade = document.getElementById(thing);

if (/Safari/.test(navigator.userAgent)) {
    var fadecnt = fade.style.Opacity;
		fade.style.Opacity = fadecnt*0.8;
} else if (navigator.appName.indexOf("Microsoft")!= -1 
  &&parseInt(navigator.appVersion)>=4) {
	  var fadecnt = fade.filters.alpha.opacity;
    fade.filters.alpha.opacity=fadecnt*0.8;
} else if (/Firefox/.test(navigator.userAgent)) {
    var fadecnt = fade.style.MozOpacity;
		fade.style.MozOpacity = fadecnt*0.8;
		} else {
		var fadecnt = fade.style.Opacity;
		fade.style.Opacity = fadecnt*0.8;
		}
}

function fadeout(thing) {

var tid;
var cnt = 1;
get_wd('dimg', 'dga')
document.getElementById('dimg').style.visibility='Visible';
function timeloop() {
if (cnt == 12) {
clearInterval(tid);
setfadezero(thing);
}
fadeoutOnce(thing);
cnt = cnt+1;
}
tid = setInterval(timeloop, 120);
}
function preloader () {
var1 = new Image();
var1.src = '"""+img+"""';
var2 = new Image();
var2.src = '"""+next+""".jpg';
var3 = new Image();
var3.src = '"""+previous+""".jpg';

varh1 = new Object();
varh1.type = 'text/html';
varh1.data = '"""+next+""".html';

varh2 = new Object();
varh2.type = 'text/html';
varh2.data = '"""+previous+""".html';
}

// -->
</SCRIPT>
<!-- #BeginEditable "doctitle" --> 
<TITLE>Kenney &amp; Associates, Inc Gallery</TITLE>
<!-- #EndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=">
<meta name="keywords" content="kenney, view, associates, email, project, architect, landscape, profile, gantt, roger, professionals, planning, services, architecture,  architectural, experience,galaxy, loveland, commercial, national, construction, portfolio, colorado, facilities, autocad, kenneyarch, residential, design, services, quality, clients, management, community, relationships, building, years, working, roger kenney, kris lee, walt, gantt, jarvis fosdick, mario gomez, betsie paulus,">

<link rel="stylesheet" href="../css/home.css" type="text/css">

<link rel="stylesheet" href="../css/profile_page.css" type="text/css">
</HEAD>

<BODY BGCOLOR="#525252" TEXT="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="fadeout('dga');preloader()">

<table width="718" cellspacing="0" cellpadding="0" align="center">

<tr><td align="center">
<div id=kalogo style="background: transparent; width:300; top:10; position:relative; font-size:0">
<div id=kalogoline style="font-size=0; background-color:#cc3300; height:1; overflow:hidden; line-height:0; width:210; position:absolute; z-index:2; left:0; top:22; width:300"></div>
<div id=kalogobox style="font-size=0;background-color:#cc3300;height:7; position:absolute; z-index:2; top:19; left:0; width:7"></div>
<div id=kalogobox style="font-size=0;background-color:#cc3300;height:7; position:absolute; z-index:2; top:19; left:300; width:7"></div>
<p align="center"><font face="arial" size="4"> kenney <img src="../logobomb.png" height="14"  vertical-align="bottom"; alt=""> associates, inc</font></p>

<p align="center" style="position:absolute; left:0; top:23; width:310"> <font face="arial" size="1"> <i> 
architects &nbsp; landscape architects &nbsp; urban designers &nbsp; planners </i> </font> </p>
</div>
    <div> <br align="center"> <a href="../gallery.html">gallery</a> | <a href="../profile.html">profile</a> | <a href="../portfolio.html">portfolio</a> 
| <a href="../team.html">team</a> | <a href="../index.html">home</a> </p></div>
</div>
</td> </tr>

	</table>
<table cellspacing="0" cellpadding="0" align="center">
<tr><td>&nbsp;</p>&nbsp;</p></td></tr>
<tr>
<td align="center" bgcolor="#525252"  valign="top">

<a href=" """+next+""".html" style="background: transparent"
      	
>

<div align="center" id="dga" onmouseover="this.style.cursor='hand'"
style="position:absolute; z-index:3; filter:alpha(opacity=80) ; -moz-opacity:0.8;  opacity:0.8; background-color:#525252;"> 
</div>
<img id="dimg" name="ga" src=" """+img+"""" border='0' style="visibility:hidden;"></a>

</td>

</td>

</tr>
<tr><td><p>&nbsp;</p></td></tr>
</table>

<table width="600" cellspacing="0" cellpadding="0" align="center" valign="bottom">
<tr><td><p>&nbsp;</p></td></tr>
<tr><td><p>&nbsp;</p></td></tr>
  <tr>
<td align="center" width=600><img src="../logobomb.png" width="20"></td></tr>
  <tr>
    <td valign="top" width=600 style="padding-top:4">
<div style="line-height:0; font-size:0; overflow:hidden; width:600; height:1; background-color:#cc3300"></div> 	
		</td></tr>
		
		
		<tr> <td align='center' style="width:600; padding-top:3;"><font face='arial'size=1>		
			
<a href=" """+previous+""".html">&#60; Back </a> | 
<a href="../gallery.html">Gallery </a> |
<a href=" """+next+""".html">Next &#62; </a>
</font></td>

  </tr>

</table>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-1060501-1";
urchinTracker();
</script>
</BODY>
<!-- #EndTemplate --></HTML>

""")
    file.close()

path='n:/www/ca'
pics=os.listdir(path)
cnt = 0

html_page(os.path.join(path,string.split(pics[-1],'.')[0]+'.html'),string.split(pics[-2],'.')[0], string.split(pics[0],'.')[0], pics[-1])
for h in pics[0:len(pics)-1]:
    html_page(os.path.join(path,string.split(pics[cnt],'.')[0]+'.html'),string.split(pics[cnt-1],'.')[0], string.split(pics[cnt+1],'.')[0], pics[cnt])
    cnt = cnt + 1

    
