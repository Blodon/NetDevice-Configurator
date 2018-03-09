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
	<body>
	
		<div class="container" align="left">
		
			<form action="/configuration/telnet" method="post">
			
				
				
				  <div class="form-group row">
				    <label for="inputTelnetip" class="col-sm-2 col-form-label">Remote IP:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputTelnetip" value="127.0.0.1">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputTelnetport" class="col-sm-2 col-form-label">Port:</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputTelnetport" value="23">
				    </div>
				  </div>
				  

				<button type="submit" class="btn btn-default" value="Submit">Submit</button>
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
	
	var val = document.getElementById(param).value;
	
	var parity = "{\"telnetIP\": \"" + param +"\"}";
	
	console.log(parity);
	
		$.post("/telnet", {
			parity: param
		} ,
	        function(data,status){
	            alert(data + status);
		},"text");
	
		
		
}

function toDefault(){
	
	fillInputs("127.0.0.1", 23);
	
}

</script>
	</body>
</html>