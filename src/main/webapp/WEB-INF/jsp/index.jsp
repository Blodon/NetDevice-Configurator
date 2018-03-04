<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<title>Cisco device configurator</title>


       <!-- Bootstrap -->
       <link rel="stylesheet" href="/bootstrap-3.3.7/css/bootstrap.min.css" />
		 
 <style>
 html {
    height: 25%;
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
      <a class="navbar-brand" href="#">CoOvWe</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Learn</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Configure</a></li>
            <li><a href="#">List</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Create map</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Connect</a></li>
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
        <li><a href="#">Login</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${a.printlanguage()} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <form action="/" method="post">
  			<li>
  				<button type="submit" name="langIndex" value="pl" class="btn-link">Polski</button>
			</li>
            <li>
            	<button type="submit" name="langIndex" value="eng" class="btn-link">English</button>
            </li>
            </form>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

  
  <div class="container">
  		<div class="row">
	  		<h1>Device configurator</h1>
	  		<p>Welcome page</p> 
  		</div>
  		<br>
  
  		<div class="row align-items-end">
			
			<div class="col-md-4" align="left">
				<form action="configuration" method="post">
	
					<label for="nameInput">Name:</label>
					<input class="form-control input-sm" id="name" name="name" type="text">
						
					<label for="passInput">Password:</label>
					<input class="form-control" id="passwordInput" name="password" type="text">
						
					<button type="submit" class="btn btn-default" value="Submit">Submit</button>
				
				</form>
  			
  			</div>
  			
  			<div class="col-md-4" align="center">
  			
  			<!-- <img alt="Poker" src="poker.jpg" height="100%" width="100%"> -->
  			
  			</div>
  			
  			<div class="col-md-4">
	  			<div class="modal-content">
		  			<ul class="nav nav-tabs">
					  <li role="presentation" id="serialBTN" class="active" onclick="connectionMenu(1)"><a href="#">Serial</a></li>
					  <li role="presentation" id="sshBTN" class="" onclick="connectionMenu(2)"><a href="#">SSH</a></li>
					  <li role="presentation" id="telnetBTN" class="" onclick="connectionMenu(3)"><a href="#">Telnet</a></li>
					  <li role="presentation" id="rawBTN" class="" onclick="connectionMenu(4)"><a href="#">Raw-text</a></li>
					</ul>
					<iframe id="frame" src="/configuration/serial" frameborder="0" width="100%" height="auto"></iframe>
	  			</div>
  			</div>
  		
  		</div>
  		
  </div>





<nav class="navbar navbar-fixed-bottom" role="navigation" style="height: auto" >
  
  	<div class="container">
  		<div class="row align-items-end">
			<div class="col-md-6" align="left">
	  			<div class="dropup">
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    skip to
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
				    <li><a href="#">Home</a></li>
				    <li><a href="#">Your account</a></li>
				    <li role="separator" class="divider"></li>
				    <li><a href="#">Configurator</a></li>
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



<script>
function connectionMenu(x) {
	
	document.getElementById("serialBTN").classList.remove('active');
	document.getElementById("sshBTN").classList.remove('active');
	document.getElementById("telnetBTN").classList.remove('active');
	document.getElementById("rawBTN").classList.remove('active');
	
	if(x==1){
    document.getElementById("frame").src = "/configuration/serial";
    document.getElementById("serialBTN").classList.add('active');
    
	}
	else if(x==2){
		document.getElementById("frame").src = "/configuration/ssh";
		document.getElementById("sshBTN").classList.add('active');
		}
	else if(x==3){
		document.getElementById("frame").src = "/configuration/telnet";
		document.getElementById("telnetBTN").classList.add('active');
		}
	else if(x==4){
		document.getElementById("frame").src = "/configuration/raw";
		document.getElementById("rawBTN").classList.add('active');
		}
    
}
</script>


		<!-- jQuery library -->
		<script src="jquery-3.3.1.js"></script> 
		 
		<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		 
   
</body>
</html>