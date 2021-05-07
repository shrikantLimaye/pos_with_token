$(document).on('turbolinks:load', function () {
    setInterval(function () {
        $('.time-container').load('/product/get_time');

    }, 1);
});