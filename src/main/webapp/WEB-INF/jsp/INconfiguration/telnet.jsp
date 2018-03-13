<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Serial configuration</title>
		
		
		<!-- Bootstrap -->
		<link rel="stylesheet" href="/bootstrap-3.3.7/css/bootstrap.min.css" />
				 
		<style>
			html {
				height: auto;
			}
			body {
		
	
			}
		</style>
	 
	</head>
	<body onload="fillInputs(${typedParameters})">
	
		<div class="container" align="left">
		
			<form action="/configuration/telnet" method="post">
			
				
				
				  <div class="form-group row">
				    <label for="inputTelnetip" class="col-sm-2 col-form-label">Remote IP:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputTelnetip" value="127.0.0.1" onchange="sendInput('inputTelnetip')">
						<h5 class="text-success" id="inputTelnetipInfo"></h5>				 
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputTelnetport" class="col-sm-2 col-form-label">Port:</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputTelnetport" value="23" onchange="sendInput('inputTelnetport')">
						<h5 class="text-success" id="inputTelnetportInfo"></h5>				    
				    </div>
				  </div>
				  
			</form>
		
		</div>
		
		<!-- jQuery library -->
		<script src="/jquery-3.3.1.js"></script> 
		 
		<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		 

<script>

function fillInputs(Telnetip, Telnetport){
	
	document.getElementById('inputTelnetip').value = Telnetip;
	document.getElementById('inputTelnetport').value = Telnetport;
	
}

function sendInput(param){
	
	var info = param + "Info";
	
	$.post("/telnet", {
		telnetIP: $( "#inputTelnetip" ).val(),
		telnetPort: $( "#inputTelnetport" ).val(),
					
	} ,
        function(data,status){
            if(data == "200"){
            	if(document.getElementById(info).classList.contains("text-danger"))
            		document.getElementById(info).classList.remove("text-danger");
            	if(document.getElementById(info).classList.contains("text-success"))
	            		document.getElementById(info).classList.add("text-success");
            } else {
            	if(document.getElementById(info).classList.contains("text-success"))
            		document.getElementById(info).classList.remove("text-success");
            	if(document.getElementById(info).classList.contains("text-danger"))
	            		document.getElementById(info).classList.add("text-danger");
            }
            document.getElementById(info).innerHTML = "saving parameter " + status;
	});

		
}

function toDefault(){
	
	fillInputs("127.0.0.1", 23);
	
}

</script>
	</body>
</html>