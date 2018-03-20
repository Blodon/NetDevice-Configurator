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
	<body  onload="fillInputs(${typedParameters})">
	
		<div class="container" align="left">
		
			<form action="/configuration/ssh" method="post">
			
				
				
				  <div class="form-group row">
				    <label for="inputSSHdomain" class="col-sm-2 col-form-label">Domain name:</label>
				    <div class="col-sm-10">
						<input type="text" class="form-control" id="inputSSHdomain" placeholder="example@example.com" onchange="sendInput('inputSSHpassword')">
						<h5 class="text-success" id="inputSSHdomainInfo"></h5>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputSSHpassword" class="col-sm-2 col-form-label">Password:</label>
				    <div class="col-sm-10">
						<input type="password" class="form-control" id="inputSSHpassword" onchange="sendInput('inputSSHpassword')">
						<h5 class="text-success" id="inputSSHpasswordInfo"></h5>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputSSHip" class="col-sm-2 col-form-label">Remote IP:</label>
				    <div class="col-sm-10">
						<input type="text" class="form-control" id="inputSSHip" value="127.0.0.1" onchange="sendInput('inputSSHip')">
						<h5 class="text-success" id="inputSSHipInfo"></h5>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputSSHport" class="col-sm-2 col-form-label">Port:</label>
				    <div class="col-sm-10">
						<input type="number" class="form-control" id="inputSSHport" value="22" onchange="sendInput('inputSSHport')">
						<h5 class="text-success" id="inputSSHportInfo"></h5>
				    </div>
				  </div>
				  
			</form>
		
		</div>
		

		<!-- jQuery library -->
		<script src="/jquery-3.3.1.js"></script> 
		 
		<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		 

<script>

function fillInputs(SSHip, SSHport){
	
	document.getElementById('inputSSHip').value = SSHip;
	document.getElementById('inputSSHport').value = SSHport;
	
}

function sendInput(param){
	
	var info = param + "Info";
	
		$.post("/ssh", {
			sshIP: $( "#inputSSHip" ).val(),
			sshPort: $( "#inputSSHport" ).val(),
						
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


</script>
 
	</body>
</html>