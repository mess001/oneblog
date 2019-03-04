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

namespace app\admin\logic;

/**
 * 标签逻辑
 */
class ArticleTag extends AdminBase
{

    /**
     * 获取标签列表
     */
    public function getTagCheckedList($where)
    {

         $result = $this->modelArticleTag->getColumn($where,'tid');
        return $result?$result:[];
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

        return $result ? [RESULT_SUCCESS, '标签操作成功', $url] : [RESULT_ERROR, $this->modelArticle->getError()];
    }

    /**
     * 获取标签信息
     */
    public function getTagInfo($where = [],  $field = true)
    {

        return $this->modelTag->getInfo($where, $field);
    }

}
