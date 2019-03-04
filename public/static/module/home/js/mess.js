/**
 * Created by Administrator on 2019/2/12 0012.
 */
    //刷新验证码
$(".captcha_change").click(function(){

    var captcha_img_obj = $("#captcha_img");

    captcha_img_obj.attr("src",captcha_img_obj.attr("src")+"?"+Math.random());
});