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
class Notice extends AdminBase
{
    
    /**
     * 公告列表
     */
    public function index()
    {
        $where = $this->logicNotice->getWhere($this->param);
        $list=$this->logicNotice->getNoticeList($where, '', 'create_time desc');

        $this->assign('list', $list);

        return $this->fetch('index');
    }


    /**
     * 公告添加
     */
    public function add()
    {
        IS_POST && $this->jump($this->logicNotice->NoticeEdit($this->param));

        return $this->fetch('edit');
    }
    
    /**
     * 公告编辑
     */
    public function edit()
    {

        IS_POST && $this->jump($this->logicNotice->BannerEdit($this->param));

        $info = $this->logicNotice->getNoticeInfo(['id' => $this->param['id']]);

        $this->assign('info', $info);

        return $this->fetch('edit');
    }

    /**
     * 数据状态设置
     */
    public function setStatus()
    {
        
        $this->jump($this->logicAdminBase->setStatus('Notice', $this->param));
    }

    /**
     * 排序
     */
    public function setSort()
    {

        $this->jump($this->logicAdminBase->setSort('Notice', $this->param));
    }

}
