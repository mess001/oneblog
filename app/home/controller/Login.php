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

namespace app\home\controller;

/**
 * 登录控制器
 */
class Login extends IndexBase
{
    
    // 注册异步
    public function register()
    {
        $post=input();
        IS_POST && $this->jump( $this->logicLogin->register($post));

    }
    // 注册异步
    public function login()
    {
        $post=input();
        IS_POST && $this->jump( $this->logicLogin->loginHandle($post['username'],$post['password'],$post['verify']));

    }
    public function logout(){
        $this->jump($this->logicLogin->logout());
    }

}
