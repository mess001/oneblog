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

use app\common\controller\ControllerBase;
use think\Hook;
use think\Url;

/**
 * 前端模块基类控制器
 */
class IndexBase extends ControllerBase
{
    
    /**
     * 构造方法
     */
    public function __construct()
    {
        
        // 执行父类构造方法
        parent::__construct();

        url::root('/index.php'); //使模板中生成的地址含有/index.php

//        判断是否登录
        if(session('user_info')){
            $uid=session('user_info')['id'];
            $this->assign('user_info',session('user_info'));
            $this->assign('user_img',session('user_info')['avatar']?get_picture_url(session('user_info')['avatar']):'__STATIC__/module/home/images/default_head_img.gif');
        }else{
            $this->assign('user_img','__STATIC__/module/home/images/default_head_img.gif');
        }
        define('UID',isset($uid)?$uid:0);
//        公告列表
        $notice=$this->logicNotice->getNoticeList();
        $this->assign('notice_list',$notice);
        $this->assign('category_list', $this->logicArticle->getArticleCategoryList([], true, 'create_time asc', false));
        $this->assign('cid', 0);
//        热门文章
        $this->assign('hot_list',$this->logicArticle->getHotArticleList());
        $word=$this->logicWord->getRandRow();
        $this->assign('word', $word);
        // 前台控制器钩子
        Hook::listen('hook_controller_index_base', $this->request);
    }
}
