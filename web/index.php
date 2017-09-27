<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Grow Old is an online album for Turbulence.org by Jason Freeman.">
    <meta name="author" content="Jason Freeman">

    <title>Jason Freeman: Grow Old</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- the core stuff -->
    <link rel="stylesheet" href="highlight/styles/default.css">
    <script src="highlight/highlight.pack.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
  </head>

  <body data-spy="scroll" data-target=".navbar">
    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Grow Old (an ever-evolving EP)</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li data-toggle="collapse" data-target=".navbar-collapse"><a href="#intro">Introduction</a></li>
            <li data-toggle="collapse" data-target=".navbar-collapse"><a href="#moonmusic">Saturn's Moons</a></li>
            <li data-toggle="collapse" data-target=".navbar-collapse"><a href="#pianomusic">Toy Piano</a></li>
            <li data-toggle="collapse" data-target=".navbar-collapse"><a href="#infinitemusic">Infinite Snowflake</a></li>
            <li data-toggle="collapse" data-target=".navbar-collapse"><a href="#codamusic">Coda</a></li>
            <li data-toggle="collapse" data-target=".navbar-collapse" class="visible-xs"><a href="#mobile-more-menu">More Options</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="navbar navbar-default navbar-fixed-bottom navbar-inverse hidden-xs" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li ><a href="http://www.jasonfreeman.net" target="_blank">About Jason Freeman</a></li>
            <li><a href="http://www.jasonfreeman.net/Contact/" target="_blank">Contact</a></li>
            <li><a href="http://turbulence.org" target="_blank">back to Turbulence.org</a></li>
          </ul>
          <ul class="nav navbar-nav navbar">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Share<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="https://www.facebook.com/dialog/feed?app_id=145634995501895&display=popup&caption=Why%20can't%20my%20music%20grow%20old%20with%20me?&link=http://turbulence.org/Works/GrowOld/&redirect_uri=https://developers.facebook.com/tools/explorer" target="_blank">Share on Facebook</a></li>
                <li><a href="https://twitter.com/share?url=http://turbulence.org/Works/GrowOld/" target="_blank">Tweet</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Podcast<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="itpc://turbulence.org/Works/GrowOld/rss/growold.php" target="_blank">Subscribe in iTunes</a></li>
                <li><a href="feed://turbulence.org/Works/GrowOld/rss/growold.php" target="_blank">Subscribe anywhere else</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div id="intro" class="jumbotron">
        <h2>Introduction</h2>
        <?php include 'text/intro.txt'; ?>
        <div id="mobile-more-menu" class="well visible-xs">
          <br>
          <ul>
            <li><a href="http://www.jasonfreeman.net" target="_blank">About Jason Freeman</a></li>
            <li><a href="http://www.jasonfreeman.net/Contact/" target="_blank">Contact</a></li>
            <li><a href="http://turbulence.org" target="_blank">back to Turbulence.org</a></li>
            <li>Share:</li>
            <ul>
                <li><a href="https://www.facebook.com/dialog/feed?app_id=145634995501895&display=popup&caption=Why%20can't%20my%20music%20grow%20old%20with%20me?&link=http://turbulence.org/Works/GrowOld/&redirect_uri=https://developers.facebook.com/tools/explorer" target="_blank">Share on Facebook</a></li>
                <li><a href="https://twitter.com/share?url=http://turbulence.org/Works/GrowOld/" target="_blank">Tweet</a></li>
            </ul>
            <li>Podcast:</li>
            <ul>
                <li><a href="itpc://turbulence.org/Works/GrowOld/rss/growold.php" target="_blank">Subscribe in iTunes</a></li>
                <li><a href="feed://turbulence.org/Works/GrowOld/rss/growold.php" target="_blank">Subscribe anywhere else</a></li>
            </ul>
          </ul>
        </div>
      </div>

    </div> <!-- /container -->

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div id="moonmusic" class="jumbotron">
            <h2>Saturn's Moons</h2>
          <div id="moonessay" class="row">
           <!--<audio controls>
              <source src="sound/alec.ogg" type="audio/ogg">
              <source src="sound/alec.mp3" type="audio/mpeg">
              Click <a href="sound/alec.mp3">here</a> to listen to Saturn's Moons.
          </audio>-->
          <iframe src="http://archive.org/download/jason_freeman_grow_old/Saturns_Moons_<?php include 'scripts/filenamedate.txt'; ?>.aif" width="500" height="30" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>
          (Generated on <?php include 'scripts/filenamedate.txt'; ?>)
        </div>
        <div class="row">
          <?php include 'text/alec.txt'?>
        </div>
        <div id="mooncode" class="row pre-scrollable">
          <pre><code><?php $code = file_get_contents('scripts/alec5.sco'); $code = htmlentities($code, ENT_QUOTES); echo $code; ?></code></pre>
        </div>
      </div>
    </div> <!-- /container -->

  <div class="container">
        <div id="pianomusic" class="jumbotron">
            <h2>Toy Piano</h2>
          <div id="pianoessay" class="row">
          <iframe src="http://archive.org/download/jason_freeman_grow_old/Toy_Piano_<?php include 'scripts/filenamedate.txt'; ?>.aif" width="500" height="30" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>
          (Generated on <?php include 'scripts/filenamedate.txt'; ?>)
        </div>
        <div class="row">
          <?php include 'text/jonathan.txt'?>
        </div>
        <div class="well well-lg">
          <div class="row">
            (Bonus Track: Live Performance of Lullaby for Growing Old by <a href="http://www.sonicgenerator.gatech.edu/tim-whitehead" target="_blank">Tim Whitehead</a>)
          </div>
          <div class="row">
            <iframe src="https://archive.org/download/lullabyforgrowingold/freeman%20lullaby.wav" width="500" height="30" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>
          </div>
          <div id="pianoscore" class="row">
            <div class="col-xs-6 col-md-4">
              <a href="text/toypiano.pdf" class="thumbnail" target="_blank">
                <img src="text/toypiano1.png" alt="Toy Piano Score, page 1">
              </a>
            </div>
            <div class="col-xs-6 col-md-4">
              <a href="text/toypiano.pdf" class="thumbnail" target="_blank">
                <img src="text/toypiano2.png" alt="Toy Piano Score, page 2">
              </a>
            </div>
            <div class="col-xs-6 col-md-4">
              <a href="text/toypiano.pdf" class="thumbnail" target="_blank">
                <img src="text/toypiano3.png" alt="Toy Piano Score, page 3">
              </a>
            </div>
          </div>
        </div>
        <div id="pianocode" class="row pre-scrollable">
          <pre><code><?php $code = file_get_contents('scripts/jonathan3.sco'); $code = htmlentities($code, ENT_QUOTES); echo $code; ?></code></pre>
        </div>
        </div>
    </div> <!-- /container -->
    <div class="container">
        <div id="infinitemusic" class="jumbotron">
            <h2>Infinite Snowflake</h2>
          <div id="infiniteessay" class="row">
          <iframe src="http://archive.org/download/jason_freeman_grow_old/Infinite_Snowflake_<?php include 'scripts/filenamedate.txt'; ?>.aif" width="500" height="30" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>
          (Generated on <?php include 'scripts/filenamedate.txt'; ?>)
        </div>
        <div class="row">
          <?php include 'text/leah.txt'?>
        </div>
        <div id="infinitecode" class="row pre-scrollable">
          <pre><code><?php $code = file_get_contents('scripts/leah3.sco'); $code = htmlentities($code, ENT_QUOTES); echo $code; ?></code></pre>
        </div>
      </div>
    </div> <!-- /container -->
    <div class="container">
        <div id="codamusic" class="jumbotron">
            <h2>Coda</h2>
          <div id="codaessay" class="row">
          <iframe src="http://archive.org/download/jason_freeman_grow_old/Coda_<?php include 'scripts/filenamedate.txt'; ?>.aif" width="500" height="30" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>
          (Generated on <?php include 'scripts/filenamedate.txt'; ?>)
        </div>
        <div class="row">
          <?php include 'text/coda.txt'?>
        </div>
        <div id="codacode" class="row pre-scrollable">
          <pre><code><?php $code = file_get_contents('scripts/coda3.sco'); $code = htmlentities($code, ENT_QUOTES); echo $code; ?></code></pre>
        </div>
      </div>
    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-49889839-1', 'turbulence.org');
  ga('send', 'pageview');

</script>
  </body>
</html>
