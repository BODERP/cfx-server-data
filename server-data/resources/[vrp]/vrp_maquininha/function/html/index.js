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
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://vrp_maquininha/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://vrp_maquininha/exit', JSON.stringify({}));
        return
    })
    $("#submit").click(function () {
        let inputValue = $("#input").val()
        if (inputValue.length >= 100) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "Input was greater than 100"
            }))
            return
        } else if (!inputValue) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "There was no value in the input field"
            }))
            return
        }
		// Valores
		let valorValeu = $("#valor").val()
        if (valorValeu.length >= 100) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "valor was greater than 100"
            }))
            return
        } else if (!valorValeu) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "There was no value in the valor field"
            }))
            return
        }
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $.post('http://vrp_maquininha/trans', JSON.stringify({
            text: inputValue,
			text2: valorValeu,
        }));
        return;
    })
	$("#submis").click(function () {
        let inputValue = $("#input").val()
        if (inputValue.length >= 100) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "Input was greater than 100"
            }))
            return
        } else if (!inputValue) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "There was no value in the input field"
            }))
            return
        }
		// Valores
		let valorValeu = $("#valor").val()
        if (valorValeu.length >= 100) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "valor was greater than 100"
            }))
            return
        } else if (!valorValeu) {
            $.post("http://vrp_maquininha/error", JSON.stringify({
                error: "There was no value in the valor field"
            }))
            return
        }
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $.post('http://vrp_maquininha/cobre', JSON.stringify({
            text: inputValue,
			text2: valorValeu,
        }));
        return;
    })
})
