<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Cisco device configurator</title>


       <!-- Bootstrap -->
       <link rel="stylesheet" href="/bootstrap-3.3.7/css/bootstrap.min.css" />
		 
 <style>
 html {
    height: auto;
}
body {

	height: 100px;
	
	padding-top: 50px;
    background-attachment: local;
	background: no-repeat linear-gradient(rgba(0, 0, 255, 0.7) 10px, rgb(155, 180, 255));
	background-position:top;
	
	background-color: rgb(155, 180, 255);
	
	padding-bottom: 120px;
	
}

</style>
 
</head>

<body>

<div class="container" align="center">

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<br>



  
  <div class="container">
  		<div class="row">
	  		<h1>Device configurator</h1>
	  		<p>Welcome page</p> 
  		</div>
  
  		<div class="row align-items-end">
			<div class="col-md-6">
  				<div class="form-group">
				    <label for="inputsm">Name:</label>
				    <input class="form-control input-sm" id="name" type="text">
				</div>
  			
  			
  			
  			</div>
  			<div class="col-md-6">
	  			<ul class="nav nav-tabs">
				  <li role="presentation" class="active"><a href="#">Serial</a></li>
				  <li role="presentation"><a href="#">SSH</a></li>
				  <li role="presentation"><a href="#">Telnet</a></li>
				  <li role="presentation"><a href="#">Raw-text</a></li>
				</ul>
				<iframe src="/configuration" frameborder="0"></iframe>
  			</div>
  		</div>
  </div>
  
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>





<h1>${a.print()}</h1>
<a href="/configuration"> ${a.print()}</a>

<form action="/" method="post">
<input type="text" class="form-control" id="langIndex" name="langIndex">
<button type="submit" class="btn btn-default" value="Submit">Submit</button>
</form>
</div>





<nav class="navbar navbar-fixed-bottom" role="navigation" style="height: auto" >
  
  	<div class="container">
  		<div class="row align-items-end">
			<div class="col-md-6">
	  			<div class="dropup">
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    idź
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
				    <li><a href="#">Action</a></li>
				    <li><a href="#">Another action</a></li>
				    <li><a href="#">Something else here</a></li>
				    <li role="separator" class="divider"></li>
				    <li><a href="#">Separated link</a></li>
				  </ul>
				</div>
			</div>
			<div class="col-md-6" align="right">
	  			<button type="button" class="btn btn-default">
	  				<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
				</button>
			</div>
  		</div>
  </div>
</nav>


		<!-- jQuery library -->
		<script src="jquery-3.3.1.js"></script> 
		 
		<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		 
   
</body>
</html>