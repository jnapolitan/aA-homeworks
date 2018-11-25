document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('myCanvas');
    canvas.width = 500;
    canvas.height = 500;
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'red';
    ctx.fillRect(10, 10, 400, 200);

    ctx.beginPath();
    ctx.arc(250, 250, 75, 0, 2 * Math.PI, true)
    ctx.strokeStyle = 'blue';
    ctx.lineWidth = 2;
    ctx.stroke();
    ctx.fillStyle = 'lightblue';
    ctx.fill();
});
