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
class Tag extends LogicBase
{

    /**
     * 获取标签列表
     */
    public function getTagList($where = [], $field = '', $order = '')
    {

        return $this->modelTag->getList($where, $field, $order);
    }

    /**
     * 获取标签列表搜索条件
     */
    public function getWhere($data = [])
    {

        $where = [];

        !empty($data['search_data']) && $where['name'] = ['like', '%'.$data['search_data'].'%'];

        return $where;
    }

    /**
     * 标签信息编辑
     */
    public function tagEdit($data = [])
    {

        $validate_result = $this->validateTag->scene('edit')->check($data);

        if (!$validate_result) {

            return [RESULT_ERROR, $this->validateTag->getError()];
        }

        $url = url('index');

        empty($data['id']) && $data['member_id'] = MEMBER_ID;

        $result = $this->modelTag->setInfo($data);

        $handle_text = empty($data['id']) ? '新增' : '编辑';

        $result && action_log($handle_text, '标签' . $handle_text . '，name：' . $data['name']);

        return $result ? [RESULT_SUCCESS, '标签操作成功', $url] : [RESULT_ERROR, $this->modelTag->getError()];
    }

    /**
     * 获取标签信息
     */
    public function getTagInfo($where = [],  $field = true)
    {

        return $this->modelTag->getInfo($where, $field);
    }
    /**
     * 文章标签列表
     */
    public function articleTag($aid){
        $where=['at.aid'=>$aid];
        $this->modelTag->alias('t');
        $join = [
            [SYS_DB_PREFIX . 'article_tag at', 'at.tid = t.id'],
        ];

        $where['t.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        $this->modelTag->join = $join;

        return $this->modelTag->getList($where,'t.id,t.name','at.create_time');
    }

}
