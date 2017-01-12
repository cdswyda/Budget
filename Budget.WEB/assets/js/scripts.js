
jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        if(username == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            return false;
        }
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }
        //var logindata = { 'username': username, 'password': password };
        //$.ajax({
        //    url: '../../ashx/login.ashx',
        //    type: 'GET',
        //    data: logindata,
        //    success: function (result) {
        //        alert("sss");
        //        if (result === 0) {
        //            alert("µÇÂ¼Ê§°Ü£¡");
        //            //location.href = "../../index.html";
        //        }
        //        else {
        //            location.href = "https://www.baidu.com/";
        //        }
        //    }
        //});



    });

    $('.page-container form .username, .page-container form .password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
