document.getElementById("showMessageBookmark").style.display = "none";

function sendMessage() {
    $("#sendMessageBookmark").show();
    $("#showMessageBookmark").hide();
    document.getElementById("haha").style.color = "red";
    document.getElementById("hahaha").style.color = "black";
}

function showMessage() {
    $("#showMessageBookmark").show();
    $("#sendMessageBookmark").hide();
    document.getElementById("hahaha").style.color = "red";
    document.getElementById("haha").style.color = "black";
}

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

function rateSubmit(point) {
    var x = document.getElementById(point).value;
    document.getElementById("resultRadio").innerHTML = x;
}

