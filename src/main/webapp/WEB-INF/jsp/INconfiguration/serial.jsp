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
		
			<form action="/configuration/serial" method="post">
			
				<div class="form-group row">
							
					<label class="col-sm-2 col-form-label">Port:</label>
				    <div class="col-sm-10">
						<select class="form-control form-control-sm">
						  <option>COM10</option>
						  <option>COM11</option>
						</select>
				    </div>
				    
				</div>
				
				<div class="form-group row">
				
					<label class="col-sm-2 col-form-label">Baudrate:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm">
						  <option>9600</option>
						  <option>115200</option>
						</select>
					</div>
					
				</div>
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">Data bits</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputDataBits" placeholder="8">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">Stop bits</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputStopBits" placeholder="1">
				    </div>
				  </div>
				  <div class="form-group row">
					<label class="col-sm-2 col-form-label">Parity bits:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm">
						  <option>None</option>
						  <option>Odd</option>
						  <option>Even</option>
						  <option>Mark</option>
						  <option>Space</option>
						</select>
					</div>
				</div>
		
				  <div class="form-group row">
					<label class="col-sm-2 col-form-label">Flow control:</label>
					<div class="col-sm-10">
						<select class="form-control form-control-sm" placeholder="XON/XOFF">
						  <option>None</option>
						  <option>XON/XOFF</option>
						  <option>RTS/CTS</option>
						  <option>DSR/DTR</option>
						</select>
					</div>
				</div>		
		
		
				<button type="submit" class="btn btn-default" value="Submit">Submit</button>
			</form>
		
		</div>
		
				<!-- jQuery library -->
		<script src="jquery-3.3.1.js"></script> 
				<!-- Latest compiled JavaScript -->
		<script src="/bootstrap-3.3.7/js/bootstrap.min.js"></script>
				 
	</body>
</html>