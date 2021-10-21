function getdata() {

    fetch("http://127.0.0.1:5500/day6/data.json")
        .then(result =>
            result.json()
        )
        .then(function (res) {
            console.log("set Data: ", res.products);
            localStorage.setItem("StoreJson", JSON.stringify(res.products));
            var local = localStorage.getItem("StoreJson");
            console.log('Data : ', JSON.parse(local));
        })
}