$(function () {
    //Back to top
    $('body').append('<div id="toTop" class="btn orange darken-4 text-white">TOP</div>');
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0) {
            $('#toTop').fadeIn();
        } else {
            $('#toTop').fadeOut();
        }
    });

    $('#toTop').click(function () {
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});

// Animations initialization
new WOW().init();