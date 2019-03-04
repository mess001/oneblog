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
class Article extends IndexBase
{
    

    
    // 详情
    public function detail($id = 0)
    {
        
        $where = [];
        
        !empty((int)$id) && $where['a.id'] = $id;
        
        $data = $this->logicArticle->getArticleInfo($where);
        $this->assign('article_info', $data);
        $this->assign('cid', $data['category_id']);
        $this->assign('tag_list',$this->logicTag->articleTag($data['id']));
        //文章浏览次数
        $this->logicArticle->addHits($id);
        $this->assign('category_list', $this->logicArticle->getArticleCategoryList([], true, 'create_time asc', false));
//        文章评论
        $countComment=$this->logicComment->countNum(['aid'=>$data['id']]);
        $this->assign('countComment',$countComment);
        $this->assign('comment_list', $this->logicComment->commentList(['aid'=>$data['id']]));
//        上一篇、下一篇
        $prev=model('article')->where(['id'=>['LT',$id]])->field('id,name')->order('id desc')->find();
        $next=model('article')->where(['id'=>['GT',$id]])->field('id,name')->order('id asc')->find();
        $this->assign('prev',$prev);
        $this->assign('next',$next);

        return $this->fetch('detail');
    }
}
