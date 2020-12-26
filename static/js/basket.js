window.onload = function () {
    $('.basket_list').on('click', 'input[type="number"]', function () {
        let elem = event.target;
        $.ajax({
            url: "/basket/edit/" + elem.name + "/" + elem.value + "/",
            success: function (data) {
                $('.basket_list').html(data.result);
            }
        })
    })
    event.preventDefault();
}