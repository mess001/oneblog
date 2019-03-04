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
class Comment extends IndexBase
{
    

    
    // 详情
    public function add()
    {
        if(IS_AJAX){
            $data=$this->logicComment->commentAdd($this->param);
             return json($data);
        }
    }
    /**
     *  评论列表
     *
     */
    public function getComment(){
        if(IS_AJAX){
            $post=$this->param;
            $data=$this->logicComment->commentList(['c.aid'=>$post['aid']],$field="c.*,u.nickname,u.avatar",$order="create_time desc");
            foreach($data as $k=>$v){
                $data[$k]['user_img_url']=get_picture_url($v['avatar']);
            }
            $return=[
                'code'=>$data ? RESULT_SUCCESS : RESULT_ERROR,
                'msg'=>$data ? '获取列表成功' : '获取列表失败',
                'data'=>$data?$data:''
            ];
            return json($return);
        }
    }
}
