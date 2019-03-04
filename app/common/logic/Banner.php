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
 * 横幅逻辑
 */
class Banner extends LogicBase
{

    
    /**
     * 获取横幅列表
     */
    public function getBannerList($where = [], $field = '', $order = '')
    {

        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $list=$this->modelBanner->getList($where, $field, $order);
        foreach($list as $k=>$v){
            $img=$this->modelPicture->getImgUrl($v['img']);
            $list[$k]['imgurl']=$img;
        }
//        print_r($list);die;

        return $list;
    }
    
    
    
    /**
     * 横幅信息编辑
     */
    public function BannerEdit($data = [])
    {
        $validate_result = $this->validateBanner->scene('edit')->check($data);

        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateBanner->getError()];
        }

        $url = url('index');
        
        empty($data['id']) && $data['member_id'] = MEMBER_ID;

        $result = $this->modelBanner->setInfo($data);

        
        $handle_text = empty($data['id']) ? '新增' : '编辑';
        
        $result && action_log($handle_text, '横幅' . $handle_text . '，name：' . $data['img']);
        
        return $result ? [RESULT_SUCCESS, '横幅操作成功', $url] : [RESULT_ERROR, $this->modelBanner->getError()];
    }

    /**
     * 获取横幅信息
     */
    public function getBannerInfo($where = [], $field = '')
    {

        
        return $this->modelBanner->getInfo($where, $field);
    }

    /**
     * 横幅删除
     */
    public function articleDel($where = [])
    {
        
        $result = $this->modelBanner->deleteInfo($where);
        
        $result && action_log('删除', '横幅删除，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '横幅删除成功'] : [RESULT_ERROR, $this->modelBanner->getError()];
    }
}
