function sendPlayGameRequest(optionSelected) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/cgi-bin/game1.py", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.onreadystatechange = function()
    {
        if (xhttp.readyState == 4 && xhttp.status == 200)
        {
            document.getElementById("result").innerHTML=xhttp.responseText;

        }
    }
    xhttp.send("'"+optionSelected+"'");
}
