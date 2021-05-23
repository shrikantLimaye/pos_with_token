let a;
let date;
let time;
var counter = 0;


$(document).on('turbolinks:load', function () { setInterval(() => {
  a = new Date();
  date = a.toLocaleDateString();
  // time = a.getHours() + ":" + a.getMinutes() + ":" + a.getSeconds();
  time = a.toLocaleTimeString("en-IN");
  document.getElementById("time").innerHTML = time + " on " + date;
}, 1000);
});