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
class Banner extends AdminBase
{
    
    /**
     * 横幅列表
     */
    public function index()
    {
        $list=$this->logicBanner->getBannerList([], '', 'create_time desc');
//        foreach($list as $k=>$v){
//            $img=$v['img'];
//            $imgurl=$this->logic
//            $list[$k]['imgurl']=11;
//        }
//        print_r($list);
        $this->assign('list', $list);

        return $this->fetch('index');
    }
    
    /**
     * 横幅添加
     */
    public function add()
    {
//      IS_POST && print_r($this->param);
        IS_POST && $this->jump($this->logicBanner->BannerEdit($this->param));

        return $this->fetch('edit');
    }
    
    /**
     * 横幅编辑
     */
    public function edit()
    {

        IS_POST && $this->jump($this->logicBanner->BannerEdit($this->param));

        $info = $this->logicBanner->getBannerInfo(['id' => $this->param['id']]);

        $this->assign('info', $info);

        return $this->fetch('edit');
    }

    /**
     * 数据状态设置
     */
    public function setStatus()
    {
        
        $this->jump($this->logicAdminBase->setStatus('Banner', $this->param));
    }

    /**
     * 排序
     */
    public function setSort()
    {

        $this->jump($this->logicAdminBase->setSort('Banner', $this->param));
    }

}
