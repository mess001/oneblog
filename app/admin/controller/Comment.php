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

namespace app\admin\controller;

/**
 * 标签控制器
 */
class Comment extends AdminBase
{
    
    /**
     * 标签列表
     */
    public function index()
    {
        $where['c.'.DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->assign('list', $this->logicComment->commentList($where));
        return $this->fetch('index');
    }
    


    /**
     * 数据状态设置
     */
    public function setStatus()
    {
        $this->jump($this->logicAdminBase->setStatus('Comment', $this->param));
    }


}
