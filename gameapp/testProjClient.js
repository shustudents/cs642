function sendPlayGameRequest(optionSelected) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/cgi-bin/game1.py", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.onreadystatechange = function()
    {
        if (xhttp.readyState == 4 && xhttp.status == 200)
        {
 	    var response = JSON.parse(xhttp.responseText);
            var counts = response['counts'];          
            document.getElementById("result").innerHTML=response['message'];
            document.getElementById("win").innerHTML=counts['win'];
            document.getElementById("lose").innerHTML=counts['lose'];
	    document.getElementById("tie").innerHTML=counts['tie'];
            document.getElementById("total").innerHTML=counts['win']+counts['lose']+counts['tie'];
        }
    }
   xhttp.send("user="+this.username.innerText+"&input="+optionSelected);
}
