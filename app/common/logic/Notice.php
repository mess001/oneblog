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
 * 公告逻辑
 */
class Notice extends LogicBase
{

    
    /**
     * 获取公告列表
     */
    public function getNoticeList($where = [], $field = '', $order = '')
    {

        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $list=$this->modelNotice->getList($where, $field, $order);

        return $list;
    }

    /**
     * 获取文章列表搜索条件
     */
    public function getWhere($data = [])
    {

        $where = [];

        !empty($data['search_data']) && $where['name'] = ['like', '%'.$data['search_data'].'%'];

        return $where;
    }
    
    /**
     * 公告信息编辑
     */
    public function NoticeEdit($data = [])
    {
        $validate_result = $this->validateNotice->scene('edit')->check($data);
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateNotice->getError()];
        }

        $url = url('index');
        
        empty($data['id']) && $data['member_id'] = MEMBER_ID;

        $result = $this->modelNotice->setInfo($data);

        
        $handle_text = empty($data['id']) ? '新增' : '编辑';
        
        $result && action_log($handle_text, '公告' . $handle_text . '，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '公告操作成功', $url] : [RESULT_ERROR, $this->modelNotice->getError()];
    }

    /**
     * 获取公告信息
     */
    public function getNoticeInfo($where = [], $field = '')
    {

        
        return $this->modelNotice->getInfo($where, $field);
    }

    /**
     * 公告删除
     */
    public function articleDel($where = [])
    {
        
        $result = $this->modelNotice->deleteInfo($where);
        
        $result && action_log('删除', '公告删除，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '公告删除成功'] : [RESULT_ERROR, $this->modelNotice->getError()];
    }
}
