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
 * 标签链接控制器
 */
class Notice extends IndexBase
{
    

    
    // 详情
    public function detail($id)
    {
        $info=$this->logicNotice->getNoticeInfo(['id'=>$id]);
        $this->assign('info',$info);

        return $this->fetch('detail');
    }

}
