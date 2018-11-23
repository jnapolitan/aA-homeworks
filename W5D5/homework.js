function stop () {
    window.setTimeout(function () {
        console.log("HAMMERTIME");
    }, 5000);
}

function hammerTime (time) {
    window.setTimeout(function () {
        console.log("HAMMERTIME");
    }, time);
    console.log(`${time} is hammertime!`)
}

