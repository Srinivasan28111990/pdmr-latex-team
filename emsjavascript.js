function copyClipboard() {
  var copyText = document.getElementById("myButton").innerHTML;
  
  var input = document.createElement("input");
  input.value = copyText;
  document.body.appendChild(input);
  input.select();
  document.execCommand("copy");
  document.body.removeChild(input); 
}
