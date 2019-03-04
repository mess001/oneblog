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

namespace app\admin\validate;

/**
 * 公告验证器
 */
class Notice extends AdminBase
{

    // 验证规则
    protected $rule =   [
        'name'          => 'require',
        'content'       => 'require',
    ];

    // 验证提示
    protected $message  =   [
        'name.require'         => '公告标题不能为空',
        'content.require'      => '公告内容不能为空',
    ];
    
    // 应用场景
    protected $scene = [
        'edit'  =>  ['name', 'content']
    ];
}
