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
	
	padding-bottom: 200px;
	
}
#myInput {
    padding: 20px;
    margin-top: -6px;
    border: 0;
    border-radius: 0;
    background: #f1f1f1;
  }

</style>
 
</head>

<body onload="fillLoadedConfig()" >

<div class="container" align="center">


<!-- NAVBAR TOP -->

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



<!-- CONTENT -->
  
  <div class="container">
  		
  		<!-- TITLE -->
  		<div class="row">
	  		<h1>Device configurator</h1>
	  		<p>Welcome page</p> 
  		</div>
  		<br>
  
  		<!-- I row -->
  		<div class="row align-items-end">
			
			<!-- TOP LEFT -->
			<div class="col-md-4" align="center">
			
				<div class="dropdown">
				    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" onclick="focusSearch()" >Load Configuration
				    <span class="caret"></span></button>
				    <ul class="dropdown-menu">
				      <input class="form-control" id="myInput" type="text" placeholder="Search.." onkeyup="searchSaved()">
				      <li><a href="#">Conf1</a></li>
				      <li><a href="#">MyRouter</a></li>
				      <li><a href="#">new config</a></li>
				      <li><a href="#">2011011</a></li>
				      <li><a href="#">Best Config</a></li>
				      <li><a href="#">Configure</a></li>
				    </ul>
	  			</div>
				
  			</div>
  			
  			<!-- TOP CENTER -->
  			<div class="col-md-4" align="center">
  			
  			<!-- <img alt="Poker" src="poker.jpg" height="100%" width="100%"> -->
  			
  			</div>
  			
  			
  			<!-- TOP RIGHT -->
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
  		
  		<br>
  		
  		<!-- II row confmenu -->
  		<div class="row align-items-end">
  			<div class="btn-group">
	  			<button id="collapseAllBTN" type="button" class="btn btn-warning" onclick="configurationMenuAll()">Show all</button>
	  			<button id="basicBTN" type="button" class="btn" onclick="configurationMenu('basicBTN')">Basic</button>
	  			<button id="advance1BTN" type="button" class="btn"  onclick="configurationMenu('advance1BTN')">Advance I</button>
	  			<button id="advance2BTN" type="button" class="btn" onclick="configurationMenu('advance2BTN')">Advance II</button>
	  			<button id="advance3BTN" type="button" class="btn" onclick="configurationMenu('advance3BTN')">Advance III</button>
  			</div>
  		</div>
  		
  		<br>
  		
  		<form action="configuration" method="post">
  		<!-- II row basic -->
  		<div class="row align-items-end">	
  			<div id="basicBTNcollapse" class="collapse">
	  			<div class="panel panel-primary">
	  				<div class="panel panel-heading">
	  					<h5>Basic</h5>
	  				</div>
	  				<div class="panel panel-body">
				  		<div class="col-md-4">
							
				
								<label for="nameInput">Name:</label>
								<input class="form-control input-sm" id="nameInput" name="name" type="text">
									
								<label for="passwordInput">Password:</label>
								<input class="form-control" id="passwordInput" name="password" type="text">
									
		
				  		</div>
				  		
				  		<div class="col-md-4">
				  			<h1>B 2</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
							<h1>B 3</h1>
						</div>
					</div>
				</div>
			</div>	
		</div>
  		
  		<!-- III row Advance I -->
  		<div class="row align-items-end">	
  			<div id="advance1BTNcollapse" class="collapse">
		  		<div class="panel panel-primary">
	  				<div class="panel panel-heading">
	  					<h5>Advance I</h5>
	  				</div>
	  				<div class="panel panel-body">
				  		<div class="col-md-4">
				  			<h1>A I 1</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
				  			<h1>A I 2</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
							<h1>A I 3</h1>
						</div>
					</div>
				</div>
			</div>	
		</div>
  		
  		<!-- IV row Advance II -->
  		<div class="row align-items-end">	
  			<div id="advance2BTNcollapse" class="collapse">
		  		<div class="panel panel-primary">
	  				<div class="panel panel-heading">
	  					<h5>Advance II</h5>
	  				</div>
	  				<div class="panel panel-body">
				  		<div class="col-md-4">
				  			<h1>A II 1</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
				  			<h1>A II 2</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
							<h1>A II 3</h1>
						</div>
					</div>
				</div>
			</div>	
		</div>
  		
  		<!-- V row Advance III -->
  		<div class="row align-items-end">	
  			<div id="advance3BTNcollapse" class="collapse">
		  		<div class="panel panel-primary">
	  				<div class="panel panel-heading">
	  					<h5>Advance III</h5>
	  				</div>
	  				<div class="panel panel-body">
				  		<div class="col-md-4">
				  			<h1>A III 1</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
				  			<h1>A III 2</h1>
				  		</div>
				  		
				  		<div class="col-md-4">
							<h1>A III 3</h1>
						</div>
					</div>
				</div>
			</div>	
		</div>
		
		<br><br>
		
			
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#saveModal">Ready!</button>
	
	  <!-- Modal I -->
	  <div class="modal fade" id="saveModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Save configuration</h4>
	        </div>
	        <div class="modal-body" align="left">
		        <div class="container">
		        		<div class="row align-items-end">
		        			<div class="col-sm-3" align="center">
	         					<p>Set name for your configuration:</p>
	         					<input class="form-control input-sm" id="saveNameInput" name="saveName" type="text" placeholder="Enter name..">
	         					<br>
	         					<div class="btn-group-vertical">
		         					<button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#sendModal" onclick="saveConfig(1)">Save and send</button>
		         					<button type="submit" class="btn btn-primary" value="Submit" onclick="sendOption(0);saveConfig(1)">Just save</button>
		         					<button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#sendModal" onclick="saveConfig(0)">Just send</button>
	         					</div>
	         					<br>
	         				</div>	 
	        			</div>
	        	</div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-warning" data-dismiss="modal">Dismiss</button>
	        </div>
	      </div>
	   	 </div>
	    </div>
	</div>

	  <div class="modal fade" id="sendModal" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Send configuration</h4>
	        </div>
	        <div class="modal-body">
	        	<div class="container">
	        		<div class="row align-items-end">
	        			<div class="col-sm-2" align="left">
	        				<p>Send over:</p>
	        				<div class="radio">
						      <label><input type="radio" name="optradio" value="1" onclick="setSendFrame('serial') ; sendOption(1)">Serial</label>
						    </div>
						    <div class="radio">
						      <label><input type="radio" name="optradio" value="2" onclick="setSendFrame('ssh') ; sendOption(2)">SSH</label>
						    </div>
						    <div class="radio">
						      <label><input type="radio" name="optradio" value="3"  onclick="setSendFrame('telnet') ; sendOption(3)">Telnet</label>
						    </div>
	        			</div>
	        			<div class="col-sm-4" align="center">
	        				<iframe id="sendFrame" src="" frameborder="0" width="auto" height="auto"></iframe>
	        			</div>	        	
	        			<div class="col-sm-2" align="center">
	        				<button type="submit" class="btn btn-primary" value="Submit">Send</button>
	        			</div>	        		
	        		</div>
	        	</div>
	        </div>
	        <div class="modal-footer">
	        <input type="hidden" name="sendOver" value="0">
	        <input type="hidden" name="saveConfig" value="0">
	          <button type="button" class="btn btn-warning" data-dismiss="modal">Dismiss</button>
	        </div>
	      </div>
	   	 </div>
	    </div>
		
		</form>
  		
  </div>



<!-- FOOTER -->
<br>
<br>
<p class="text-muted">Easy footer here by Blodon</p>
<br>
<br>
<!-- NAV BOTTOM -->
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
	  			<button type="button" class="btn btn-default" onclick="goTop()">
	  				<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span>
				</button>
			</div>
  		</div>
  </div>
</nav>



<script>

var collapsed = true;

function focusSearch(){
document.getElementById("myInput").focus();
}

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

function setSendFrame(page){
	
	page = '/configuration/' + page;
	
	document.getElementById("sendFrame").src = page;
	
}

function sendOption(connectionType){
	document.getElementById('sendOver').value = connectionType;
}

function saveConfig(saveT){
	document.getElementById('saveConfig').value = saveT;
	
}

function configurationMenu(buttonName){

	document.getElementById(buttonName).classList.toggle('active');
	document.getElementById(buttonName).classList.toggle('btn-success');
	
	if(document.getElementById(buttonName).classList.contains('active')){
		document.getElementById((buttonName + 'collapse')).classList.remove('collapse');
	} else {
		document.getElementById((buttonName + 'collapse')).classList.add('collapse');
	}
	
}

function setBTN(buttonName){
	if(!document.getElementById(buttonName).classList.contains('active')) document.getElementById(buttonName).classList.add('active');
	if(!document.getElementById(buttonName).classList.contains('btn-success')) document.getElementById(buttonName).classList.add('btn-success');
	document.getElementById((buttonName + 'collapse')).classList.remove('collapse');
}

function resetBTN(buttonName){
	document.getElementById(buttonName).classList.remove('active');
	document.getElementById(buttonName).classList.remove('btn-success');
	if(!document.getElementById((buttonName + 'collapse')).classList.contains('collapse')) document.getElementById((buttonName + 'collapse')).classList.add('collapse');
}


function fillLoadedConfig(){
	
	document.getElementById('nameInput').value = 'name';
	
	
}



function configurationMenuAll(){

	if(collapsed){
		
		document.getElementById('collapseAllBTN').classList.add('active');
		document.getElementById('collapseAllBTN').innerHTML = 'Hide all';
		setBTN('basicBTN');
		setBTN('advance1BTN');
		setBTN('advance2BTN');
		setBTN('advance3BTN');
		
		collapsed = false;
		return;
	
	}
	
	if(collapsed == false) {
		
		document.getElementById('collapseAllBTN').classList.remove('active');
		document.getElementById('collapseAllBTN').innerHTML = 'Show all';
		resetBTN('basicBTN');
		resetBTN('advance1BTN');
		resetBTN('advance2BTN');
		resetBTN('advance3BTN');
		
		collapsed = true;
		return;
		
	}
	
	
}


function goTop(){
	$('html, body').animate({ scrollTop: 0 }, 'fast');
}

function searchSaved(){
	
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $(".dropdown-menu li").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
}
</script>


		<!-- jQuery library -->
		<script src="jquery-3.3.1.js"></script> 
		 
		<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		 
   
</body>
</html>