<?php
// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\home\validate;

/**
 * 登录验证器
 */
class User extends HomeBase
{
    
    // 验证规则
    protected $rule =   [
        
        'username'  => 'require|email|unique:user',
        'password'      => 'require|confirm|length:6,20',
        'nickname'  => 'require|unique:user',
        'verify'    => 'require|captcha',
    ];
    
    // 验证提示
    protected $message  =   [
        
        'username.require'    => '用户名不能为空',
        'password.require'    => '密码不能为空',
        'nicknmae.require'    => '昵称不能为空',
        'username.unique'          => '用户名已经存在',
        'nickname.unique'          => '昵称已经存在',
        'nickname.require'      => '昵称不能为空',
        'password.length'       => '密码长度为6-20字符',
        'password.confirm'      => '两次密码不一致',
        'username.email'           => '邮箱格式不正确',
        'verify.require'      => '验证码不能为空',
        'verify.captcha'      => '验证码不正确',
    ];

    // 应用场景
    protected $scene = [
        
        'register'   =>  ['username','password', 'nickname'],
    ];
}
