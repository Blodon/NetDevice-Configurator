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
	<body onload="fillInputs(2, 2, 3, 8, 1)">
	
		<div class="container" align="left">
		
			<form action="/configuration/serial" method="post">
			
				<div class="form-group row">
							
					<label class="col-sm-2 col-form-label">Port:</label>
				    <div class="col-sm-10">
						<select class="form-control form-control-sm" name="portname">
						<c:forEach var="weightDTO" items="${portList}" varStatus="index">	
							<c:choose>
							    <c:when test="${index=='1'}">
							        <option selected="selected">${portList.get(index)}</option>
							    </c:when>    
							    <c:otherwise>
							        <option>${portList.get(index)}</option>
							    </c:otherwise>
							</c:choose>
						</c:forEach>  
						</select>
				    </div>
				    
				</div>
				
				<div class="form-group row">
				
					<label class="col-sm-2 col-form-label">Baudrate:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm" name="baudRate"  onchange="sendInput('baudRate')">
						  <option id="br1">9600
						  <option id="br2">19200
						  <option id="br3">38400
						  <option id="br4">115200
						</select>
					</div>
					
				</div>
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">Data bits:</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputDataBits" name="dataBits" value="8">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">Stop bits:</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputStopBits" name="stopBits" value="1">
				    </div>
				  </div>
				  <div class="form-group row">
					<label class="col-sm-2 col-form-label">Parity bits:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm" id="parity" name="parity" onchange="sendInput('parity')">
						  <option id="p1" vlaue="1">None
						  <option id="p2" vlaue="2">Odd
						  <option id="p3" vlaue="3">Even
						  <option id="p4" vlaue="4">Mark
						  <option id="p5" vlaue="5">Space
						</select>
					</div>
				</div>
		
				  <div class="form-group row">
					<label class="col-sm-2 col-form-label">Flow control:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm" id="flowControl" name="flowControl"  onchange="sendInput('flowControl')">
						  <option id="f1" vlaue="1">None
						  <option id="f2" vlaue="2">XON/XOFF
						  <option id="f3" vlaue="3">RTS/CTS
						  <option id="f4" vlaue="4">DSR/DTR
						</select>
					</div>
				</div>	
					<div class="container">	
						<div class="row align-items-end">
							<div class="col-sm-3" align="left">		
								<button type="submit" class="btn btn-lg btn-default" value="Submit">Submit</button>
							</div>
							<div class="col-sm-3" align="right">	
								<button type="reset" class="btn btn-sm btn-warning" onclice="toDefault()" align="right">Set default</button>
							</div>
						</div>
					</div>	
			</form>
		
		</div>
		
		<!-- jQuery library -->
		<script src="/jquery-3.3.1.js"></script> 
		 
		<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		 

<script>

function fillInputs(baudrateID, parityID, flowID, databits, stopbits){
	
	baudrateID = 'br' + baudrateID;
	parityID = 'p' + parityID;
	flowID = 'f' + flowID;
	
	document.getElementById(baudrateID).selected = true;
	document.getElementById(parityID).selected = true;
	document.getElementById(flowID).selected = true;
	
	document.getElementById('dataBits').value = databits;
	document.getElementById('stopBits').value = stopbits;
	
}

function sendInput(param){
	
	var val = document.getElementById(param).value;
	
	var parity = "{\"parity\": \"" + param +"\"}";
	
	console.log(parity);
	
		$.post("/serial", {
			parity: param
		} ,
	        function(data,status){
	            alert(data + status);
		},"text");
	
		
		
}

function toDefault(){
	
	fillInputs(1,1,1,8,1);
	
}

</script>

		
   
	</body>
</html>