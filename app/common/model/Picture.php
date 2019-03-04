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

namespace app\common\model;

/**
 * 图片模型
 */
class Picture extends ModelBase
{
    public function getImgUrl($img){
        $re=$this->getValue(['id'=>$img],'path');
        return $re?PATH_IMG.$re:'/static/module/admin/img/onimg.png';
    }
    
}
