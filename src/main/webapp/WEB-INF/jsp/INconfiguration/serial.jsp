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
						<select class="form-control form-control-sm" id="baudRate" name="baudRate"  onchange="sendInput('baudRate')">
						  <option id="br-9600" value="9600">9600
						  <option id="br-19200" value="19200">19200
						  <option id="br-38400" value="38400">38400
						  <option id="br-115200" value="115200">115200
						</select>
						<h5 class="text-success" id="baudRateInfo"></h5>
					</div>
					
				</div>
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">Data bits:</label>
				    <div class="col-sm-10">
						<input type="number" class="form-control" id="inputDataBits" name="dataBits" value="8" onchange="sendInput('inputDataBits')">
						<h5 class="text-success" id="inputDataBitsInfo"></h5>				   
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">Stop bits:</label>
				    <div class="col-sm-10">
						<input type="number" class="form-control" id="inputStopBits" name="stopBits" value="1" onchange="sendInput('inputStopBits')">
						<h5 class="text-success" id="inputStopBitsInfo"></h5>
				    </div>
				  </div>
				  <div class="form-group row">
					<label class="col-sm-2 col-form-label">Parity bits:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm" id="parity" name="parity" onchange="sendInput('parity')">
						  <option id="p-None" vlaue="None">None
						  <option id="p-Odd" vlaue="Odd">Odd
						  <option id="p-Even" vlaue="Even">Even
						  <option id="p-Mark" vlaue="Mark">Mark
						  <option id="p-Space" vlaue="Space">Space
						</select>
						<h5 class="text-success" id="parityInfo"></h5>
					</div>
				</div>
		
				  <div class="form-group row">
					<label class="col-sm-2 col-form-label">Flow control:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm" id="flowControl" name="flowControl"  onchange="sendInput('flowControl')">
						  <option id="f-None" vlaue="None">None
						  <option id="f-XON/XOFF" vlaue="XON/OFF">XON/XOFF
						  <option id="f-RTS/CTS" vlaue="RTS/CTS">RTS/CTS
						  <option id="f-DSR/DTR" vlaue="DSR/DTR">DSR/DTR
						</select>
						<h5 class="text-success" id="flowControlInfo"></h5>
					</div>
				</div>	
					<div class="container">	
						<div class="row align-items-end">
							<div class="col-sm-6" align="right">	
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

var serialPortV ="NULL";


function fillInputs(baudrateID, parityID, flowID, databits, stopbits){
	
	
	baudrateID = 'br-' + baudrateID;
	parityID = 'p-' + parityID;
	flowID = 'f-' + flowID;
	
	
	document.getElementById(baudrateID).selected = true;
	document.getElementById(parityID).selected = true;
	document.getElementById(flowID).selected = true;
	
	document.getElementById('inputDataBits').value = databits;
	document.getElementById('inputStopBits').value = stopbits;
	
	
}


function sendInput(param){
	
	var info = param + "Info";
	
	//var parity = "{\"parity\": \"" + param +"\"}";
	
	console.log(parity);
	
		$.post("/serial", {
			serialPort: "null",
			serialBaudrate: $( "#baudRate" ).val(),
			serialDataBits: $( "#inputDataBits" ).val(),
			serialStopBits: $( "#inputStopBits" ).val(),
			serialParityBits: $( "#parity" ).val(),
			serialFlowControl: $( "#flowControl" ).val()
			
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
	
	fillInputs(3,1,1,8,1);
	
}

</script>

		
   
	</body>
</html>