function formSubmit() {
	document.getElementById("logoutForm").submit();
}

function showCertainProfile() {
    document.getElementById("showCertainProfile").submit();
}


$("button").click(function(){
	
	$.getJSON("http://kodypocztoweapi.pl/01-234", function(obj) {
		alert('df');
		$.each(obj, function(key, value){
			$("ul").append("<li>"+value.name+"</li>");
		});

	});
});

function regulaminRequired() {
    var x = document.getElementById("rulesRequired").required;
    document.getElementById("demo").innerHTML = x;
}
