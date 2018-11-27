console.log("Hello from the JavaScript console!");

$.ajax({
    url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
    type: 'GET',
    success: function(response) {
        console.log(response.weather[0]);
    }
});

console.log("Hello again from the console!");