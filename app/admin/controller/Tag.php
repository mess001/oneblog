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
class Tag extends AdminBase
{
    
    /**
     * 标签列表
     */
    public function index()
    {
        
        $where = $this->logicTag->getWhere($this->param);
        $this->assign('list', $this->logicTag->getTagList($where, '', 'create_time desc'));
        return $this->fetch('index');
    }
    
    /**
     * 标签添加
     */
    public function add()
    {
//      IS_POST && print_r($this->param);
        IS_POST && $this->jump($this->logicTag->tagEdit($this->param));

        return $this->fetch('edit');
    }
    
    /**
     * 标签编辑
     */
    public function edit()
    {

        IS_POST && $this->jump($this->logicTag->tagEdit($this->param));

        $info = $this->logicTag->getTagInfo(['id' => $this->param['id']]);

        $this->assign('info', $info);

        return $this->fetch('edit');
    }

    /**
     * 数据状态设置
     */
    public function setStatus()
    {
        
        $this->jump($this->logicAdminBase->setStatus('Tag', $this->param));
    }

    /**
     * 排序
     */
    public function setSort()
    {

        $this->jump($this->logicAdminBase->setSort('Tag', $this->param));
    }

}
