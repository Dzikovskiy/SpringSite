
$(function () {

    $('.card-columns .card .card-footer .editBtn').on('click', function (event) {
        event.preventDefault();
        var href = $(this).attr('href');
        $.get(href,function (message) {
            $('.editModal #id').val(message.id);
            $('.editModal #text').val(message.text);
            $('.editModal #tag').val(message.tag);
            $('.editModal #filename').val(message.filename);

        });
        $('.editModal #editModal').modal();
    })
});