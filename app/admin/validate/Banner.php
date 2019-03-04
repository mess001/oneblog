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
 * 文章验证器
 */
class Banner extends AdminBase
{
    
    // 验证规则
    protected $rule =   [
        'img'          => 'require',
    ];

    // 验证提示
    protected $message  =   [
        'img.require'         => '文章标题不能为空',
    ];
    
    // 应用场景
    protected $scene = [
        'edit'  =>  ['img'],
        'add'  =>  ['img']
    ];
}
