const RESOURCE_NAME = "photo_item";

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                // document.getElementById("image").src = "https://bozzy.xyz/cameraroll/characters/"+item.image;
                document.getElementById("image").src = item.image;
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`http://${RESOURCE_NAME}/exit`, JSON.stringify({}));
            return
        }
    };
})
