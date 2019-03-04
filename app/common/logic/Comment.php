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

namespace app\common\logic;

/**
 * 标签逻辑
 */
class Comment extends LogicBase
{

    /**
     * 标签信息编辑
     */
    public function commentAdd($data = [])
    {
        if(UID){
            $data['uid']=UID;
        }
        $ip=request()->ip();
        $data['ip']=$ip;
//        $address_data=getCity($ip);
//        $data['address']=$address_data['country'].' '.$address_data['region'].' '.$address_data['city'];
        $data['comment'] = html_entity_decode($data['comment']);
        $validate_result = $this->validateComment->scene('add')->check($data);

        if (!$validate_result) {

            return [RESULT_ERROR, $this->validateComment->getError()];
        }

        $result = $this->modelComment->setInfo($data);
        $return=[
            'code'=>$result ? RESULT_SUCCESS : RESULT_ERROR,
            'msg'=>$result ? '评论新增成功' : $this->modelComment->getError(),
            'data'=>$result?$data:[]
        ];
        return $return;
    }
    /**
     * 评论列表
     *
     */
    public function commentList($where=[],$field="c.*,u.nickname,u.avatar",$order="c.create_time desc"){
        $this->modelComment->alias('c');
        $join = [
            [SYS_DB_PREFIX . 'user u', 'u.id = c.uid'],
        ];
        $this->modelComment->join = $join;
       return $this->modelComment->getList($where,$field,$order);
    }
    public function countNum($where=[]){
        return $this->modelComment->stat($where);
    }

}
