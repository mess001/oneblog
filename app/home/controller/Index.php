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
 * 前端首页控制器
 */
class Index extends IndexBase
{
    
    // 首页
    public function index($cid = 0,$tid=0,$keyword='')
    {
        $where = [];
        !empty((int)$cid) && $where['a.category_id'] = $cid;

        $this->assign('cid', $cid);
        if($cid){
            $this->assign('cate_info', $this->logicArticle->getArticleCategoryInfo(['id'=>$cid], true, 'create_time asc', false));
            $this->assign('article_list', $article_list=$this->logicArticle->getArticleList($where, 'a.*,m.nickname,c.name as category_name', 'a.create_time desc'));

            return $this->fetch('category');

        }else if($tid){
            !empty((int)$tid) && $where['at.tid'] = $tid;
            $this->assign('tag_info', $this->logicTag->getTagInfo(['id'=>$tid], true, 'create_time desc', false));
            $this->assign('article_list', $article_list=$this->logicArticle->getArticleListBytid($where, 'a.*,c.name as category_name', 'a.create_time desc'));

            return $this->fetch('tag');

        }else if($keyword){
            $where['a.name|a.content']=['like','%'.$keyword.'%'];
            $this->assign('article_list', $article_list=$this->logicArticle->getArticleList($where, 'a.*,c.name as category_name', 'a.create_time desc'));
            return $this->fetch('search');
        }else{
            $this->assign('article_list', $article_list=$this->logicArticle->getArticleList($where, 'a.*,m.nickname,c.name as category_name', 'a.create_time desc'),true);
            //推荐
            $tuijian=$this->logicArticle->getArticleInfo(['a.is_top'=>1]);
            $tuijian['content_t']=show_or_hidden(strip_tags(html_entity_decode($tuijian['content'])),200,false);
            $this->assign('tuijian',$tuijian);
            $this->assign('banner_list', $this->logicBanner->getBannerList([], '', 'create_time desc'));
            $this->assign('tag_list', $this->logicTag->getTagList([], '', 'create_time desc' ));
            // 模板变量赋值
            return $this->fetch('index');
        }

    }

}
