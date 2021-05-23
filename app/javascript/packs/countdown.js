// const startingMinutes = 20;
// let time = startingMinutes * 60;

// const countdownEl = document.getElementsByClassName('countdown');




// 
document.addEventListener("turbolinks:load", function() {
   const buttonElement = document.querySelector('#yes')
   
   const startingMinutes = 10;
   let time = startingMinutes * 60;
   const countdownEl = document.querySelector('#countdown');

   function updateCountdown() {
      const minutes = Math.floor(time / 60);
      let seconds = time % 60;
      seconds = seconds <= 10 ? '0' + seconds : seconds;
      countdownEl.innerHTML = `${minutes}:${seconds}`;
      time--
  }

   buttonElement.addEventListener("click", e => {
      setInterval(updateCountdown, 1000);
      // console.log("I was clicked")
      // alert("The click works")
   });
});



// $(document).on('turbolinks:load', function () {
//     // let countDownTimer = document.getElementById('countdown');

//      alert('This Works');
// });