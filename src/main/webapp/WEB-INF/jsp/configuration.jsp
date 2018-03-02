<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Configuration</title>
</head>
<body>



<%@include file="INconfiguration/serial.jsp" %>



<form action="configuration" method="post">
<div class="modal-dialog">

	<div class="modal-content">
	
		<div class="modal-header" align="center">
        <h4 class="modal-title" id="myModalLabel">Set Configuration</h4>
		</div>
		
		<div class="modal-body">    
	        <form class="form-inline" role="form" name="passwordTable">
	        	<div class="form-group">

        		<h5 class="modal-text" id="myModalWeightText">Name:</h5>
			    <input type="text" class="form-control" id="weightInput" name="p1" autofocus>
			  </div>	
			  <div class="form-group">
        		<h5 class="modal-text" id="myModalPasswordText">Password:</h5>
			    <label class="sr-only" for="passwodInput">Password</label>

			    <input type="text" class="form-control" id="passwordWInput" name="p2">
			  </div>		
			   
			</form> 
		</div>
		
		<div class="modal-footer">	
 		 <div class="row" align="center">
      	  <button type="submit" class="btn btn-default" value="Submit">Submit</button>

      	 </div>
		</div>
		
	</div>
	
</div>
</form>



</body>
</html>