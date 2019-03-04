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
class Tag extends IndexBase
{
    

    
    // 详情
    public function index()
    {
        $list=model('tag')->query("select t.* ,COUNT(`at`.aid) as counta
	FROM blog_tag as t
	 left JOIN blog_article_tag as at
	ON `at`.tid =t.id
	LEFT JOIN blog_article as a
	ON a.id=`at`.aid
	WHERE a.status>-1 AND t.`status`>-1 AND `at`.`status`>-1
	GROUP BY t.id
	ORDER BY counta desc;");
        $this->assign('tag_list',$list);

        return $this->fetch('index');
    }

}
