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
class Comment extends HomeBase
{
    
    // 验证规则
    protected $rule =   [
        
        'uid'  => 'require',
        'aid'  => 'require',
        'comment'      => 'require',
    ];
    
    // 验证提示
    protected $message  =   [
        
        'uid.require'    => '用户必须登录',
        'aid.require'    => '评论文章必须存在',
        'comment.require'    => '评论内容必须存在',
    ];

    // 应用场景
    protected $scene = [
        
        'register'   =>  ['username','password', 'nickname'],
    ];
}
