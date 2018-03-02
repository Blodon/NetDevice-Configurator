	function logonmenu(){
		
    var b = var pass1 = document.getElementById("passwordInput").value; 
		
		if(logon(b)==1){
		var title = document.getElementById("alarm");

		document.forms['alarm'].style.display= "none";
		}
		
	}
	
	function logon(b){	
		if(b=="admin")return 1;
		else return 0;
	}