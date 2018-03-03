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
		
			<form action="/configuration/ssh" method="post">
			
				
				
				  <div class="form-group row">
				    <label for="inputSSHip" class="col-sm-2 col-form-label">Remote IP:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputSSHip" placeholder="127.0.0.1">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputSSHport" class="col-sm-2 col-form-label">Port:</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="inputSSHport" placeholder="22" >
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