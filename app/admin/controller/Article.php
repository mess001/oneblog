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
 * 文章控制器
 */
class Article extends AdminBase
{
    
    /**
     * 文章列表
     */
    public function articleList()
    {
        
        $where = $this->logicArticle->getWhere($this->param);
        
        $this->assign('list', $this->logicArticle->getArticleList($where, 'a.*,m.nickname,c.name as category_name', 'a.create_time desc'));
        
        return $this->fetch('article_list');
    }
    
    /**
     * 文章添加
     */
    public function articleAdd()
    {
        
        $this->articleCommon();
        $this->assign('tags_checked',[]);
        return $this->fetch('article_edit');
    }
    
    /**
     * 文章编辑
     */
    public function articleEdit()
    {
        
        $this->articleCommon();
        
        $info = $this->logicArticle->getArticleInfo(['a.id' => $this->param['id']], 'a.*,m.nickname,c.name as category_name');
        
        !empty($info) && $info['img_ids_array'] = str2arr($info['img_ids']);
        $where=[
            'aid'=>$this->param['id']
        ];
        $tags_checked=$this->logicArticleTag->getTagCheckedList($where);

        $this->assign('tags_checked',$tags_checked);

        $this->assign('info', $info);
        
        return $this->fetch('article_edit');
    }
    
    /**
     * 文章添加与编辑通用方法
     */
    public function articleCommon()
    {
        $data=$this->param;
        if(IS_POST&&isset($data['content-html-code'])&&$data['content-html-code']){
            $content=$data['content'];
            $data['content']=$data['content-html-code'];
            $data['content_md']=html_entity_decode($content);
        }
        IS_POST && $this->jump($this->logicArticle->articleEdit($data));
        
        $this->assign('article_category_list', $this->logicArticle->getArticleCategoryList([], 'id,name', '', false));
        $this->assign('tags', $this->logicTag->getTagList([], 'id,name', 'sort desc,create_time desc', false));
    }
    
    /**
     * 文章分类添加
     */
    public function articleCategoryAdd()
    {
        
        IS_POST && $this->jump($this->logicArticle->articleCategoryEdit($this->param));
        
        return $this->fetch('article_category_edit');
    }
    
    /**
     * 文章分类编辑
     */
    public function articleCategoryEdit()
    {
        
        IS_POST && $this->jump($this->logicArticle->articleCategoryEdit($this->param));
        
        $info = $this->logicArticle->getArticleCategoryInfo(['id' => $this->param['id']]);
        
        $this->assign('info', $info);
        
        return $this->fetch('article_category_edit');
    }
    
    /**
     * 文章分类列表
     */
    public function articleCategoryList()
    {
        
        $this->assign('list', $this->logicArticle->getArticleCategoryList());
       
        return $this->fetch('article_category_list');
    }
    
    /**
     * 文章分类删除
     */
    public function articleCategoryDel($id = 0)
    {
        
        $this->jump($this->logicArticle->articleCategoryDel(['id' => $id]));
    }
    
    /**
     * 数据状态设置
     */
    public function setStatus()
    {
        
        $this->jump($this->logicAdminBase->setStatus('Article', $this->param));
    }

    /**
     * 排序
     */
    public function setSort()
    {

        $this->jump($this->logicAdminBase->setSort('Article', $this->param));
    }

    /**
     * Notes:分类排序
     * @param
     * @author 张浩
     * @date 2019/1/25 0025 17:05
     */
    public function setSortCate()
    {

        $this->jump($this->logicAdminBase->setSort('ArticleCategory', $this->param));
    }
}
