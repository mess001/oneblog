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
class Tag extends AdminBase
{
    
    // 验证规则
    protected $rule =   [
        'name'          => 'require|unique:tag',
    ];

    // 验证提示
    protected $message  =   [
        'name.require'         => '分类名称不能为空',
        'name.unique'          => '分类名称已经存在',
    ];
    
    // 应用场景
    protected $scene = [
        'edit'  =>  ['name'],
        'add'  =>  ['name'],
    ];
}
