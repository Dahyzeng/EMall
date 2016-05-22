<html>
<head>
    <title>pic player</title>
    <script type="text/javascript" src="http://img.jb51.net/jslib/jquery/jquery-1.2.6.js"></script>
    <script type="text/javascript" src="http://img.jb51.net/jslib/jquery/tween.js"></script>
</head>
<body>
<div id="picplayer" style="position:relative;overflow:hidden;width:300px;height:300px;clear:none;border:solid 1px #ccc;">
    there is a pic-player
</div>
<script>
    var p = $('#picplayer');
    var pics1 = [
        {url:'http://img.jb51.net/online/picPlayer/1.jpg',link:'http://www.jb51.net/#',time:5000},
        {url:'http://img.jb51.net/online/picPlayer/2.jpg',link:'http://www.jb51.net/#',time:4000},
        {url:'http://img.jb51.net/online/picPlayer/3.jpg',link:'http://www.jb51.net',time:6000},
        {url:'http://img.jb51.net/online/picPlayer/2.jpg',link:'http://www.jb51.net',time:6000},
        {url:'http://img.jb51.net/online/picPlayer/1.jpg',link:'http://www.jb51.net',time:6000}
    ];
    initPicPlayer(pics1,p.css('width').split('px')[0],p.css('height').split('px')[0]);



</script>

</body>
</html>