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

namespace app\home\logic;

/**
 * 登录逻辑
 */
class User extends IndexBase
{

    /**
     * 设置会员信息
     */
    public function setMemberValue($where = [], $field = '', $value = '')
    {

        return $this->modelUser->setFieldValue($where, $field, $value);
    }

    /**
     * Notes:改变头像
     * @param $img
     * @param
     * @author 张浩
     * @date 2019/2/28 0028 14:51
     */
    public function changeAvatar($img){
        session('user_info.avatar', $img);
        return $this->modelUser->setFieldValue(['id'=>UID], 'avatar', $img);
    }
}
