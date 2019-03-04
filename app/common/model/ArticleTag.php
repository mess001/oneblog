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

namespace app\common\model;

/**
 * 文章分类模型
 */
class ArticleTag extends ModelBase
{
    /**
     * Notes:
     * @param $tagids int  标签id
     * @param $aid int 文章id
     * @param bool $flag 编辑 true或新增 false
     * @param
     * @author 张浩
     * @date 2019/1/29 0029 14:33
     */
    public function updateTags($tagids,$aid,$flag=true){
        $tagids=trim($tagids,',');
        $tagArr=explode(',',$tagids);
        if($flag){
            //编辑
            // 先删除所有
            // 再新增
            $this->deleteInfo(['aid'=>$aid],true);
        }
        foreach($tagArr as $v){
            $data=[
                'aid'=>$aid,
                'tid'=>$v,
            ];
            $data_add[]=$data;
        }
        $this->setList($data_add);
    }
}
